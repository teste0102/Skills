#!/usr/bin/env python3
"""MK Web - Integrado (rec + Haiku)"""
from flask import Flask, render_template_string, request, jsonify
import subprocess, whisper, anthropic, os

app = Flask(__name__)
client = anthropic.Anthropic()
model = whisper.load_model("medium")

HTML = '''<!DOCTYPE html><html><head><meta charset="utf-8"><title>MK</title><style>body{background:#0E1430;color:white;font-family:Arial}
.container{max-width:600px;margin:50px auto;background:#1a2540;padding:30px;border-radius:10px}h1{color:#00d4ff;text-align:center}
.chat{height:400px;overflow-y:auto;border:2px solid #00d4ff;padding:10px;margin:20px 0;background:#0E1430;border-radius:5px}
.msg{margin:10px 0;padding:10px;border-radius:5px}.user{background:#00d4ff;color:#0E1430;text-align:right}.mk{background:#1abc9c}
#btn{padding:15px;background:#ff4444;color:white;border:none;border-radius:50px;width:100%;cursor:pointer;font-size:16px;font-weight:bold}
#btn.rec{background:#ffaa00}#status{text-align:center;color:#00d4ff;margin:10px 0}</style></head><body>
<div class="container"><h1>🎤 MK Agent</h1><div id="status">Pronto</div><div class="chat" id="chat"></div>
<button id="btn">🎤 HOLD TO TALK</button></div><script>const btn=document.getElementById("btn");let recording=false;
btn.addEventListener("mousedown",()=>{if(recording)return;recording=true;btn.classList.add("rec");btn.textContent="🔴 GRAVANDO";
fetch("/gravar-iniciar").then(r=>r.json())});btn.addEventListener("mouseup",()=>{if(!recording)return;recording=false;
btn.classList.remove("rec");btn.textContent="🎤 HOLD TO TALK";document.getElementById("status").textContent="⏳ Processando";
fetch("/gravar-parar").then(r=>r.json()).then(d=>{addMsg("user",d.texto);
fetch("/responder",{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify({texto:d.texto})})
.then(r=>r.json()).then(d=>{addMsg("mk",d.resposta);document.getElementById("status").textContent="Pronto"})})});
function addMsg(t,m){const c=document.getElementById("chat"),d=document.createElement("div");d.className="msg "+t;
d.textContent=m;c.appendChild(d);c.scrollTop=c.scrollHeight}</script></body></html>'''

@app.route('/')
def index():
    return render_template_string(HTML)

@app.route('/gravar-iniciar')
def gravar_iniciar():
    subprocess.Popen(['rec', '-r', '16000', '-c', '1', '-b', '16', '/tmp/mk_audio.wav'])
    return jsonify({'ok': True})

@app.route('/gravar-parar')
def gravar_parar():
    os.system('pkill -f "rec.*mk_audio"')
    resultado = model.transcribe('/tmp/mk_audio.wav', language='pt')
    return jsonify({'texto': resultado['text']})

@app.route('/responder', methods=['POST'])
def responder():
    texto = request.json.get('texto')
    msg = client.messages.create(model='claude-haiku-4-5-20251001', max_tokens=300, messages=[{'role':'user','content':texto}])
    return jsonify({'resposta': msg.content[0].text})

if __name__ == '__main__':
    app.run(port=5000, debug=False)


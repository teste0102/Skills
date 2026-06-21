#!/usr/bin/env python3
"""
JARVIS Local: Áudio → Qwen3 → Áudio
"""
import whisper
import requests
import pyttsx3
import sys
import os

def escuta(arquivo_audio):
    """Whisper: áudio → texto"""
    print(f"🎤 Transcrevendo {arquivo_audio}...")
    model = whisper.load_model("base")
    resultado = model.transcribe(arquivo_audio)
    texto = resultado["text"]
    print(f"📝 Você disse: {texto}")
    return texto

def processa(texto):
    """Qwen3: texto → resposta"""
    print("🤖 Processando...")
    response = requests.post(
        "http://localhost:11434/api/generate",
        json={"model": "qwen3:8b", "prompt": texto, "stream": False},
        timeout=30
    )
    resposta = response.json()["response"]
    print(f"💬 Resposta: {resposta[:100]}...")
    return resposta

def fala(texto):
    """TTS: texto → áudio"""
    print("🔊 Falando...")
    engine = pyttsx3.init()
    engine.setProperty('rate', 150)
    engine.say(texto)
    engine.runAndWait()

def main():
    if len(sys.argv) < 2:
        print("Uso: python3 jarvis.py <arquivo_audio.wav>")
        sys.exit(1)
    
    arquivo = sys.argv[1]
    
    # Pipeline completo
    texto = escuta(arquivo)
    resposta = processa(texto)
    fala(resposta)
    
    print("\n✅ Concluído!")

if __name__ == "__main__":
    main()

# 🤖 JARVIS

**Agente Local Inteligente com Áudio**

Conversa com JARVIS via texto ou áudio. Ele detecta intenção e chama as skills certas.

## 🎤 Usar com Áudio

```bash
# Gerar áudio
python3 -c "
import pyttsx3
engine = pyttsx3.init()
engine.save_to_file('Qual é o preço do Samsung A15 no Mercado Livre?', '/tmp/pergunta.wav')
engine.runAndWait()
"

# Executar JARVIS com áudio
python3 ~/.claude/skills/jarvis-audio/jarvis.py /tmp/pergunta.wav
```

## 💬 Usar com Texto (Terminal)

```bash
/jarvis explorar
/jarvis criar-skill novo-projeto
/jarvis skills
```

## Pipeline

1. 🎤 **Whisper** — áudio → texto
2. 🤖 **Qwen3:8b** — processa + detecta skill
3. 📞 **Skills** — executa (buscar-ml, buscar-shopee, etc)
4. 🔊 **TTS** — texto → áudio (fala resposta)

## Recursos

- ✅ Escuta e responde em português
- ✅ Detecta intenção automaticamente
- ✅ Integra 12 skills
- ✅ Roda 100% local (Qwen3 + Ollama)


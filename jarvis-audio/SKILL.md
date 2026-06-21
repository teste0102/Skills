# 🎤 JARVIS Audio

**Conversa com JARVIS usando áudio!**

## Como usar

```bash
# Gerar áudio
python3 -c "
import pyttsx3
engine = pyttsx3.init()
engine.save_to_file('Qual é o preço do Samsung A15?', '/tmp/pergunta.wav')
engine.runAndWait()
"

# Falar com JARVIS
python3 ~/.claude/skills/jarvis-audio/jarvis.py /tmp/pergunta.wav
```

## Pipeline

1. 🎤 **Whisper** — áudio → texto
2. 🤖 **Qwen3:8b** — texto → resposta
3. 🔊 **TTS** — resposta → áudio (fala)

## Requisitos

```bash
pip3 install openai-whisper pyttsx3 scipy soundfile requests
```

## Resultado

JARVIS ESCUTA sua pergunta e RESPONDE EM VOZ!


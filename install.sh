#!/bin/bash
set -e

echo "🚀 Instalando sikavial-skills..."
echo ""

if ! command -v code &> /dev/null; then
  echo "📦 Instalando VS Code..."
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install --cask visual-studio-code 2>/dev/null || echo "Instale em: https://code.visualstudio.com/"
  else
    echo "Instale em: https://code.visualstudio.com/"
  fi
else
  echo "✅ VS Code já instalado"
fi

echo ""
echo "📦 Instalando Claude Code Extension..."
code --install-extension anthropic.claude-dev --force 2>/dev/null || true

mkdir -p ~/.claude/plugins

if ! command -v claude &> /dev/null; then
  echo "📦 Instalando Claude Code CLI..."
  npm install -g @anthropic-ai/claude-code 2>/dev/null || echo "Instale Node.js em: https://nodejs.org/"
else
  echo "✅ Claude Code CLI já instalado"
fi

echo ""
echo "🎯 Adicionando marketplace..."
claude /plugin marketplace add teste0102/Skills 2>/dev/null || true

echo ""
echo "💾 Instalando skills..."

skills=(
  "espec" "build" "review" "iterate"
  "buscador" "buscar-ml"
  "orquestrador" "explorador" "criador" "curador"
)

for skill in "${skills[@]}"; do
  echo "  • $skill..."
  claude /plugin install $skill@sikavial-skills 2>/dev/null || true
  sleep 0.5
done

echo ""
echo "✅ INSTALAÇÃO COMPLETA!"
echo "Acesse: https://teste0102.github.io/Skills/"

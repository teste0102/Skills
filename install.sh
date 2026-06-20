#!/bin/bash
set -e

echo "🚀 Instalando sikavial-skills..."

# Verifica VS Code
if ! command -v code &> /dev/null; then
  echo "❌ VS Code não encontrado"
  exit 1
fi
echo "✅ VS Code encontrado"

# Instala extensão
echo "📦 Instalando Claude Code Extension..."
code --install-extension anthropic.claude-dev --force 2>/dev/null || true

# Verifica Claude CLI
if ! command -v claude &> /dev/null; then
  echo "❌ Claude Code CLI não encontrado"
  exit 1
fi
echo "✅ Claude Code CLI encontrado"

# Cria pasta
mkdir -p ~/.claude/plugins

echo ""
echo "💾 Instalando 10 skills..."

# Instala cada skill SEM menu interativo
for skill in espec build review iterate buscador buscar-ml orquestrador explorador criador curador; do
  echo "  ⚙️  $skill..."
  timeout 10 bash -c "echo 'n' | claude /plugin install $skill@sikavial-skills" 2>/dev/null || true
  sleep 0.3
done

echo ""
echo "✅ INSTALAÇÃO COMPLETA!"
echo ""
echo "Use no Claude Code:"
echo "  /espec, /build, /review, /iterate"
echo "  /buscador, /buscar-ml"
echo "  /orquestrador, /explorador, /criador, /curador"

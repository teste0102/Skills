#!/bin/bash
set -e

echo "🚀 Preparando sikavial-skills..."

# Verifica dependências
if ! command -v code &> /dev/null; then
  echo "❌ VS Code não encontrado"
  exit 1
fi

if ! command -v claude &> /dev/null; then
  echo "❌ Claude Code CLI não encontrado"
  exit 1
fi

echo "✅ Dependências ok"
echo ""
echo "Abrindo Claude Code..."
sleep 2

# Abre Claude Code
claude &

sleep 3

echo ""
echo "════════════════════════════════════════════════════════════"
echo "Cole ESTES comandos um por um no Claude Code:"
echo "════════════════════════════════════════════════════════════"
echo ""
echo "/plugin marketplace add teste0102/Skills"
echo "/plugin install espec@sikavial-skills"
echo "/plugin install build@sikavial-skills"
echo "/plugin install review@sikavial-skills"
echo "/plugin install iterate@sikavial-skills"
echo "/plugin install buscador@sikavial-skills"
echo "/plugin install buscar-ml@sikavial-skills"
echo "/plugin install orquestrador@sikavial-skills"
echo "/plugin install explorador@sikavial-skills"
echo "/plugin install criador@sikavial-skills"
echo "/plugin install curador@sikavial-skills"
echo ""
echo "✅ Pronto! Use os 10 skills acima."

#!/bin/bash
set -e

echo "🚀 Instalando sikavial-skills..."

PLUGINS_DIR="$HOME/.claude/plugins"
mkdir -p "$PLUGINS_DIR"

echo "📂 Copiando skills e agentes..."
cp -r espec build review iterate buscador buscar-ml "$PLUGINS_DIR/"
cp -r agents/orquestrador agents/explorador agents/criador agents/curador "$PLUGINS_DIR/"

echo "📝 Copiando manifesto..."
cp plugins-manifest.json "$PLUGINS_DIR/"

# Limpa duplicatas
find "$PLUGINS_DIR" -name ".claude-plugin" -type d -exec rm -rf {} + 2>/dev/null || true

echo ""
echo "✅ INSTALAÇÃO 100% COMPLETA!"
echo "🚀 10 skills + 4 agentes prontos!"
sleep 1
claude


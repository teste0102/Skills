#!/bin/bash
set -e

echo "🚀 Instalando sikavial-skills..."
echo ""

PLUGINS_DIR="$HOME/.claude/plugins"
mkdir -p "$PLUGINS_DIR"

echo "📂 Copiando 6 skills..."
for skill in espec build review iterate buscador buscar-ml; do
  rm -rf "$PLUGINS_DIR/$skill" 2>/dev/null || true
  cp -r "$skill" "$PLUGINS_DIR/"
done

echo "🤖 Copiando 4 agentes..."
for agent in orquestrador explorador criador curador; do
  rm -rf "$PLUGINS_DIR/$agent" 2>/dev/null || true
  cp -r "agents/$agent" "$PLUGINS_DIR/"
done

# Remove duplicatas de .claude-plugin
find "$PLUGINS_DIR" -name ".claude-plugin" -type d -exec rm -rf {} + 2>/dev/null || true

echo ""
echo "✅ INSTALAÇÃO 100% COMPLETA!"
echo "🚀 10 skills + 4 agentes prontos!"
echo ""
echo "Reiniciando Claude Code..."
sleep 1

claude


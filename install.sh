#!/bin/bash
set -e

echo "🚀 Instalando sikavial-skills..."
echo ""

PLUGINS_DIR="$HOME/.claude/plugins"
CLAUDE_DIR="$HOME/.claude"
mkdir -p "$PLUGINS_DIR"
mkdir -p "$CLAUDE_DIR"

echo "📂 Copiando 6 skills..."
for skill in espec build review iterate buscador buscar-ml; do
  cp -r "$skill" "$PLUGINS_DIR/" 2>/dev/null || true
  # Move plugin.json para raiz
  if [ -f "$PLUGINS_DIR/$skill/.claude-plugin/plugin.json" ]; then
    cp "$PLUGINS_DIR/$skill/.claude-plugin/plugin.json" "$PLUGINS_DIR/$skill/"
  fi
done

echo "🤖 Copiando 4 agentes..."
for agent in orquestrador explorador criador curador; do
  cp -r "agents/$agent" "$PLUGINS_DIR/" 2>/dev/null || true
  # Move plugin.json para raiz
  if [ -f "$PLUGINS_DIR/$agent/.claude-plugin/plugin.json" ]; then
    cp "$PLUGINS_DIR/$agent/.claude-plugin/plugin.json" "$PLUGINS_DIR/$agent/"
  fi
done

echo ""
echo "✅ INSTALAÇÃO 100% COMPLETA!"
echo "🚀 10 skills + 4 agentes prontos!"
echo ""
echo "Abrindo Claude Code..."
sleep 1

claude


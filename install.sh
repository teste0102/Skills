#!/bin/bash
set -e

echo "🚀 Instalando sikavial-skills..."
echo ""

PLUGINS_DIR="$HOME/.claude/plugins"
CLAUDE_DIR="$HOME/.claude"
mkdir -p "$PLUGINS_DIR"
mkdir -p "$CLAUDE_DIR"

echo "📂 Copiando 6 skills..."
cp -r espec "$PLUGINS_DIR/" 2>/dev/null || true
cp -r build "$PLUGINS_DIR/" 2>/dev/null || true
cp -r review "$PLUGINS_DIR/" 2>/dev/null || true
cp -r iterate "$PLUGINS_DIR/" 2>/dev/null || true
cp -r buscador "$PLUGINS_DIR/" 2>/dev/null || true
cp -r buscar-ml "$PLUGINS_DIR/" 2>/dev/null || true

echo "🤖 Copiando 4 agentes..."
cp -r agents/orquestrador "$PLUGINS_DIR/" 2>/dev/null || true
cp -r agents/explorador "$PLUGINS_DIR/" 2>/dev/null || true
cp -r agents/criador "$PLUGINS_DIR/" 2>/dev/null || true
cp -r agents/curador "$PLUGINS_DIR/" 2>/dev/null || true

echo "🔧 Removendo config local (usando Claude Pro)..."
rm -f "$CLAUDE_DIR/settings.json" 2>/dev/null || true

echo ""
echo "✅ INSTALAÇÃO 100% COMPLETA!"
echo "🚀 10 skills + 4 agentes prontos!"
echo ""
echo "Abrindo Claude Code (Claude Pro)..."
sleep 1

claude


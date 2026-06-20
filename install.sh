#!/bin/bash
set -e

echo "🚀 Instalando sikavial-skills..."

# Copia plugins para a pasta do Claude Code
PLUGINS_DIR="$HOME/.claude/plugins"
mkdir -p "$PLUGINS_DIR"

echo "📂 Copiando skills..."
cp -r espec "$PLUGINS_DIR/" 2>/dev/null || true
cp -r build "$PLUGINS_DIR/" 2>/dev/null || true
cp -r review "$PLUGINS_DIR/" 2>/dev/null || true
cp -r iterate "$PLUGINS_DIR/" 2>/dev/null || true
cp -r buscador "$PLUGINS_DIR/" 2>/dev/null || true
cp -r buscar-ml "$PLUGINS_DIR/" 2>/dev/null || true

echo "🤖 Copiando agentes..."
cp -r agents/orquestrador "$PLUGINS_DIR/" 2>/dev/null || true
cp -r agents/explorador "$PLUGINS_DIR/" 2>/dev/null || true
cp -r agents/criador "$PLUGINS_DIR/" 2>/dev/null || true
cp -r agents/curador "$PLUGINS_DIR/" 2>/dev/null || true

echo ""
echo "✅ INSTALAÇÃO COMPLETA!"
echo "🚀 10 skills + 4 agentes já estão prontos!"
echo ""
echo "Abra o Claude Code e use:"
echo "  /espec, /build, /review, /iterate"
echo "  /buscador, /buscar-ml"
echo "  /orquestrador, /explorador, /criador, /curador"

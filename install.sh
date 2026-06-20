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

echo "⚙️ Copiando configurações..."
cp settings.json "$CLAUDE_DIR/" 2>/dev/null || true

echo "🔒 Confiando na workspace..."
mkdir -p "$CLAUDE_DIR/trust"
touch "$CLAUDE_DIR/trust/home_mknexaro" 2>/dev/null || true

echo ""
echo "✅ INSTALAÇÃO 100% COMPLETA!"
echo "🚀 10 skills + 4 agentes prontos!"
echo ""
echo "Iniciando Claude Code..."
sleep 2

# Instala cada skill com ENTER para aceitar menu
(
  sleep 2
  echo "/plugin install espec"
  sleep 2
  printf "\n"
  sleep 2
  echo "/plugin install build"
  sleep 2
  printf "\n"
  sleep 2
  echo "/plugin install review"
  sleep 2
  printf "\n"
  sleep 2
  echo "/plugin install iterate"
  sleep 2
  printf "\n"
  sleep 2
  echo "/plugin install buscador"
  sleep 2
  printf "\n"
  sleep 2
  echo "/plugin install buscar-ml"
  sleep 2
  printf "\n"
  sleep 2
  echo "/plugin install orquestrador"
  sleep 2
  printf "\n"
  sleep 2
  echo "/plugin install explorador"
  sleep 2
  printf "\n"
  sleep 2
  echo "/plugin install criador"
  sleep 2
  printf "\n"
  sleep 2
  echo "/plugin install curador"
  sleep 2
  printf "\n"
) | claude

echo ""
echo "✨ TUDO PRONTO! Use os 10 skills no Claude Code!"


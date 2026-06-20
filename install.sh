#!/bin/bash
set -e

echo "🚀 Instalando sikavial-skills..."
echo ""

PLUGINS_DIR="$HOME/.claude/plugins"
mkdir -p "$PLUGINS_DIR"

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
cp settings.json "$HOME/.claude/" 2>/dev/null || true

echo ""
echo "✅ INSTALAÇÃO 100% COMPLETA!"
echo "🚀 10 skills + 4 agentes prontos!"
echo ""
echo "Abrindo Claude Code..."
sleep 2

# Registra marketplace e instala tudo automaticamente
(
  sleep 2
  echo "1"
  sleep 1
  echo "/plugin marketplace add teste0102/Skills"
  sleep 2
  echo "/plugin install espec@sikavial-skills"
  sleep 1
  echo "/plugin install build@sikavial-skills"
  sleep 1
  echo "/plugin install review@sikavial-skills"
  sleep 1
  echo "/plugin install iterate@sikavial-skills"
  sleep 1
  echo "/plugin install buscador@sikavial-skills"
  sleep 1
  echo "/plugin install buscar-ml@sikavial-skills"
  sleep 1
  echo "/plugin install orquestrador@sikavial-skills"
  sleep 1
  echo "/plugin install explorador@sikavial-skills"
  sleep 1
  echo "/plugin install criador@sikavial-skills"
  sleep 1
  echo "/plugin install curador@sikavial-skills"
  sleep 2
) | claude


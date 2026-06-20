#!/bin/bash
set -e

echo "🚀 Instalando sikavial-skills..."

if ! command -v claude &> /dev/null; then
  echo "❌ Claude Code não encontrado"
  exit 1
fi

echo "✅ Claude Code ok"
echo ""
echo "💾 Instalando 10 skills automaticamente..."
echo ""

# Confiar na workspace e instalar tudo
(
  sleep 1
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

echo ""
echo "✅ INSTALAÇÃO COMPLETA!"
echo "🚀 10 skills + 4 agentes prontos para usar!"

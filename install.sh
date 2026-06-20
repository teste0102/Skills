#!/bin/bash
set -e

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   sikavial-skills • Instalador v2.0      ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# Verifica Claude Code CLI
if ! command -v claude &> /dev/null; then
  echo "❌ Claude Code CLI não encontrado!"
  echo "   Instale em: https://docs.anthropic.com/en/docs/claude-code"
  exit 1
fi
echo "✅ Claude Code CLI encontrado"

# Cria diretório de skills
SKILLS_DIR="$HOME/.claude/skills"
mkdir -p "$SKILLS_DIR"

# Clona o repositório temporariamente
TEMP_DIR=$(mktemp -d)
echo "📥 Baixando skills..."
git clone --quiet https://github.com/teste0102/Skills.git "$TEMP_DIR" 2>/dev/null

# Copia skills para ~/.claude/skills/
echo "📂 Instalando 6 skills..."
for skill in espec build review iterate buscador buscar-ml; do
  rm -rf "$SKILLS_DIR/$skill" 2>/dev/null
  cp -r "$TEMP_DIR/$skill/skills/$skill" "$SKILLS_DIR/$skill" 2>/dev/null || true
  echo "   ✓ $skill"
done

echo "🤖 Instalando 4 agentes..."
for agent in orquestrador explorador criador curador; do
  rm -rf "$SKILLS_DIR/$agent" 2>/dev/null
  cp -r "$TEMP_DIR/agents/$agent/skills/$agent" "$SKILLS_DIR/$agent" 2>/dev/null || true
  echo "   ✓ $agent"
done

# Limpa temporário
rm -rf "$TEMP_DIR"

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   ✅ INSTALAÇÃO COMPLETA!                ║"
echo "║                                          ║"
echo "║   10 skills instaladas em:               ║"
echo "║   ~/.claude/skills/                      ║"
echo "║                                          ║"
echo "║   COMO USAR:                             ║"
echo "║   Abra o Claude Code e peça:             ║"
echo "║                                          ║"
echo "║   • 'escreva uma spec para...'           ║"
echo "║     → usa skill espec                    ║"
echo "║   • 'construa conforme a spec'           ║"
echo "║     → usa skill build                    ║"
echo "║   • 'verifique se está conforme a spec'  ║"
echo "║     → usa skill review                   ║"
echo "║   • 'busca patinete no mercado livre'    ║"
echo "║     → usa skill buscar-ml                ║"
echo "║   • 'busca informações sobre...'         ║"
echo "║     → usa skill buscador                 ║"
echo "║                                          ║"
echo "║   Skills são carregadas AUTOMATICAMENTE  ║"
echo "║   quando Claude detecta que são úteis.   ║"
echo "╚══════════════════════════════════════════╝"
echo ""
echo "Abrindo Claude Code..."
sleep 2
claude

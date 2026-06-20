#!/bin/bash
set -e

echo "🚀 Instalando sikavial-skills..."
echo ""

CACHE_DIR="$HOME/.claude/plugins/cache/sikavial-skills"
CLAUDE_DIR="$HOME/.claude"
mkdir -p "$CACHE_DIR"

echo "📂 Copiando 6 skills..."
for skill in espec build review iterate buscador buscar-ml; do
  mkdir -p "$CACHE_DIR/$skill/0.1.0"
  cp -r "$skill"/* "$CACHE_DIR/$skill/0.1.0/" 2>/dev/null || true
done

echo "🤖 Copiando 4 agentes..."
for agent in orquestrador explorador criador curador; do
  mkdir -p "$CACHE_DIR/$agent/0.1.0"
  cp -r "agents/$agent"/* "$CACHE_DIR/$agent/0.1.0/" 2>/dev/null || true
done

echo "📝 Registrando 10 plugins..."
NOW=$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")

cat > "$CLAUDE_DIR/plugins/installed_plugins.json" << EOF
{
  "version": 2,
  "plugins": {
    "espec@sikavial-skills": [{"scope": "user", "installPath": "$CACHE_DIR/espec/0.1.0", "version": "0.1.0", "installedAt": "$NOW", "lastUpdated": "$NOW"}],
    "build@sikavial-skills": [{"scope": "user", "installPath": "$CACHE_DIR/build/0.1.0", "version": "0.1.0", "installedAt": "$NOW", "lastUpdated": "$NOW"}],
    "review@sikavial-skills": [{"scope": "user", "installPath": "$CACHE_DIR/review/0.1.0", "version": "0.1.0", "installedAt": "$NOW", "lastUpdated": "$NOW"}],
    "iterate@sikavial-skills": [{"scope": "user", "installPath": "$CACHE_DIR/iterate/0.1.0", "version": "0.1.0", "installedAt": "$NOW", "lastUpdated": "$NOW"}],
    "buscador@sikavial-skills": [{"scope": "user", "installPath": "$CACHE_DIR/buscador/0.1.0", "version": "0.1.0", "installedAt": "$NOW", "lastUpdated": "$NOW"}],
    "buscar-ml@sikavial-skills": [{"scope": "user", "installPath": "$CACHE_DIR/buscar-ml/0.1.0", "version": "0.1.0", "installedAt": "$NOW", "lastUpdated": "$NOW"}],
    "orquestrador@sikavial-skills": [{"scope": "user", "installPath": "$CACHE_DIR/orquestrador/0.1.0", "version": "0.1.0", "installedAt": "$NOW", "lastUpdated": "$NOW"}],
    "explorador@sikavial-skills": [{"scope": "user", "installPath": "$CACHE_DIR/explorador/0.1.0", "version": "0.1.0", "installedAt": "$NOW", "lastUpdated": "$NOW"}],
    "criador@sikavial-skills": [{"scope": "user", "installPath": "$CACHE_DIR/criador/0.1.0", "version": "0.1.0", "installedAt": "$NOW", "lastUpdated": "$NOW"}],
    "curador@sikavial-skills": [{"scope": "user", "installPath": "$CACHE_DIR/curador/0.1.0", "version": "0.1.0", "installedAt": "$NOW", "lastUpdated": "$NOW"}]
  }
}
EOF

echo ""
echo "✅ INSTALAÇÃO 100% COMPLETA!"
echo "🚀 10 skills + 4 agentes registrados!"
echo ""
echo "Abrindo Claude Code..."
sleep 1

claude


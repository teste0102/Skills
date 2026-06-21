---
name: "curador"
description: "Revisa a árvore de skills, detecta duplicatas e mantém marketplace.json sincronizado com os arquivos reais."
---

# Curador de Skills

Quando `/curar` é invocado (diretamente ou via Orquestrador):

## Processo

1. **Leia o estado real**:
   - Liste todas as pastas em `/home/mknexaro/Skills/` (exceto `agents/`, `specs/`, `.git/`)
   - Para cada pasta, verifique se existe `.claude-plugin/plugin.json` e `skills/<nome>/SKILL.md`

2. **Leia o marketplace**:
   - Leia `/home/mknexaro/Skills/.claude-plugin/marketplace.json`

3. **Detecte inconsistências**:
   - Skills que existem em disco mas não estão no marketplace → **órfãs**
   - Skills no marketplace mas sem arquivos em disco → **fantasmas**
   - Skills com nomes similares (>80% de similaridade) → **possíveis duplicatas**
   - `plugin.json` com campos obrigatórios ausentes → **formato inválido**

4. **Reporte ao usuário**:

```
## Relatório de Curadoria

✓ Skills válidas: <lista>
⚠ Órfãs (em disco, fora do marketplace): <lista>
⚠ Fantasmas (no marketplace, sem arquivos): <lista>
⚠ Possíveis duplicatas: <pares>
✗ Formato inválido: <lista>
```

5. **Corrija automaticamente**:
   - Órfãs → pergunte se deve registrar no marketplace
   - Fantasmas → pergunte se deve remover do marketplace
   - Duplicatas → pergunte qual manter antes de qualquer ação
   - Formato inválido → corrija os campos ausentes

6. **Salve o marketplace.json** atualizado ao final

## Regras

- Nunca delete arquivos em disco sem confirmação explícita do usuário
- Sempre mostre o relatório antes de aplicar correções
- Em caso de dúvida, pergunte

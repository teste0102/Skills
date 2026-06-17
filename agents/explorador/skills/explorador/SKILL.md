---
name: "explorador"
description: "Analisa o contexto do projeto atual e recomenda as 3 skills mais relevantes com justificativa."
---

# Explorador de Skills

Quando `/explorar` é invocado (diretamente ou via Orquestrador):

## Processo

1. **Analise o projeto atual**:
   - Liste os arquivos presentes no diretório (`find . -maxdepth 2 -type f`)
   - Identifique a linguagem principal, framework e propósito
   - Leia o `README.md` ou `package.json` se existirem

2. **Leia o marketplace**:
   - Leia `/home/mknexaro/Skills/.claude-plugin/marketplace.json`
   - Liste todas as skills e agentes disponíveis

3. **Relacione contexto com skills**:
   - Para cada skill, avalie relevância para o projeto atual (0–10)
   - Selecione as 3 com maior pontuação

4. **Retorne ao usuário**:

```
## Skills recomendadas para este projeto

1. **<nome>** — <justificativa de 1 linha>
2. **<nome>** — <justificativa de 1 linha>
3. **<nome>** — <justificativa de 1 linha>

Nenhuma skill cobre <gap identificado>? Use `/criar-skill <nome>` para criar uma.
```

## Regras

- Sempre justifique a recomendação com base no contexto real do projeto
- Se nenhuma skill for relevante, diga claramente e sugira criação
- Máximo 3 recomendações por análise

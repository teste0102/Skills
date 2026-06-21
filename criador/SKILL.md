---
name: "criador"
description: "Gera automaticamente novas skills com estrutura completa (SKILL.md, plugin.json, README.md) e registra no marketplace."
---

# Criador de Skills

Quando `/criar-skill <nome>` é invocado (diretamente ou via Orquestrador):

## Processo

1. **Colete informações** (se não fornecidas):
   - Nome da skill (slug kebab-case)
   - Descrição em uma linha
   - Comportamento principal: o que a skill faz quando invocada?

2. **Valide o nome**:
   - Sem espaços, sem acentos, apenas letras minúsculas e hífens
   - Verifique se já existe em `marketplace.json` — se sim, avise e pare

3. **Crie a estrutura** em `/home/mknexaro/Skills/<nome>/`:

```
<nome>/
├── .claude-plugin/
│   └── plugin.json
├── skills/<nome>/
│   └── SKILL.md
└── README.md
```

4. **Conteúdo dos arquivos**:

**plugin.json**:
```json
{"name":"<nome>","version":"0.1.0","description":"<descrição>","author":{"name":"Sikavial"}}
```

**SKILL.md**:
```markdown
---
name: "<nome>"
description: "<descrição>"
---

# <Título>

Quando `/<nome>` é invocado:

1. <passo 1>
2. <passo 2>

## Regras

- <regra principal>
```

**README.md**:
```markdown
# <Nome> Plugin

<descrição>

Run `/<nome>` to use this skill.
```

5. **Registre no marketplace**:
   - Leia `/home/mknexaro/Skills/.claude-plugin/marketplace.json`
   - Adicione a nova entrada no array `plugins`
   - Salve o arquivo atualizado

6. **Confirme** listando os arquivos criados

## Regras

- Nunca sobrescreva uma skill existente sem confirmação explícita
- Valide o formato antes de salvar
- Sempre atualize o marketplace.json após criar

# Multi-Agent Skills Manager

## Objetivo

Criar um sistema de 4 agentes hospedado no repositório `Skills/` no GitHub para gerenciar skills do Claude Code. O sistema deve ser clonável e funcional em qualquer máquina com Claude Code instalado. Quando o usuário abre um projeto novo e digita um comando, o sistema analisa o contexto e recomenda automaticamente as skills mais relevantes.

---

## Estrutura do Repositório

```
Skills/
├── .claude-plugin/
│   └── marketplace.json           ← registro central de todas as skills e agentes
├── specs/
│   └── multi-agent-skills.md      ← este arquivo
├── agents/
│   ├── orquestrador/
│   │   ├── .claude-plugin/plugin.json
│   │   ├── skills/orquestrador/SKILL.md
│   │   └── README.md
│   ├── criador/
│   │   ├── .claude-plugin/plugin.json
│   │   ├── skills/criador/SKILL.md
│   │   └── README.md
│   ├── curador/
│   │   ├── .claude-plugin/plugin.json
│   │   ├── skills/curador/SKILL.md
│   │   └── README.md
│   └── explorador/
│       ├── .claude-plugin/plugin.json
│       ├── skills/explorador/SKILL.md
│       └── README.md
├── espec/                         ← skill existente (não modificar)
├── build/                         ← skill existente (não modificar)
├── review/                        ← skill existente (não modificar)
└── iterate/                       ← skill existente (não modificar)
```

---

## Requisitos Indispensáveis

### Os 4 Agentes

| Agente | Papel |
|--------|-------|
| **Orquestrador** | Ponto de entrada único. Recebe comandos do usuário, roteia para os agentes corretos, mantém estado geral do sistema |
| **Criador** | Gera automaticamente novos arquivos de skill (`SKILL.md`, `plugin.json`, `README.md`). Age sob comando ou de forma proativa |
| **Curador** | Avalia qualidade das skills, organiza a árvore, detecta duplicatas, mantém `marketplace.json` atualizado |
| **Explorador** | Analisa o contexto do projeto atual e recomenda as skills mais relevantes com justificativa |

### Comportamentos obrigatórios

- O **Explorador** analisa arquivos presentes, linguagem e propósito do projeto e retorna as 3 skills mais relevantes
- O **Criador** age tanto sob comando explícito (`"cria uma skill para X"`) quanto de forma proativa quando detecta ausência de skill adequada
- O **Curador** atualiza o `marketplace.json` após toda criação ou remoção de skill
- O **Orquestrador** é o único ponto de entrada — o usuário nunca chama os outros agentes diretamente

### Integração com skills existentes

As skills `espec`, `build`, `review` e `iterate` já existem e devem ser:
- Registradas no `marketplace.json` sem modificação estrutural
- Reconhecidas e utilizadas pelos agentes como skills disponíveis

---

## Restrições

- Roda 100% dentro do Claude Code (subagentes via Agent SDK)
- Portável via GitHub: clonar o repositório é suficiente para ativar o sistema
- Compatível com a estrutura de plugins existente (`.claude-plugin/plugin.json`, `SKILL.md`)
- Nenhum servidor externo ou dependência além do Claude Code CLI

---

## Casos Extremos

- **Skill duplicada**: o Curador detecta e pergunta ao usuário qual manter antes de remover
- **Nenhuma skill relevante**: o Explorador informa e oferece criar uma nova via Criador
- **Skill criada com formato inválido**: o Criador valida a estrutura antes de salvar
- **Comando ambíguo para o Orquestrador**: pede esclarecimento antes de delegar

---

## Definição de Concluído

O sistema está concluído quando:

1. O repositório é clonado em qualquer máquina com Claude Code
2. O usuário abre um projeto novo e digita um comando (ex: `/explorar`)
3. O Orquestrador delega ao Explorador
4. O Explorador analisa o contexto do projeto e retorna as 3 skills mais relevantes com justificativa
5. O usuário diz `"cria uma skill para X"` e o Criador gera todos os arquivos necessários automaticamente
6. O Curador mantém a árvore organizada e o `marketplace.json` atualizado em tempo real

---
name: "buscar-ml"
description: "Busca produtos no Mercado Livre e retorna lista com preços. Use quando o usuário pedir para buscar ou pesquisar produtos no Mercado Livre."
---

# Buscar Produtos no Mercado Livre

Quando o usuário pedir para buscar produtos no Mercado Livre:

## Processo

1. **Use WebSearch** para buscar:
   - Query: `<termo> mercado livre preço`

2. **Use WebFetch** nos links do mercadolivre.com.br encontrados para extrair preços

3. **Apresente no formato:**

| # | Produto | Preço | Link |
|---|---------|-------|------|
| 1 | Título | R$ X | [Ver](url) |

## Regras
- Busque com WebSearch e depois use WebFetch nos links do ML
- Máximo 5 resultados
- Apresente em português
- Se não conseguir preço, mostre o link para o usuário acessar

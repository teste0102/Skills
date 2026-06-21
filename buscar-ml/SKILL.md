---
name: "buscar-ml"
description: "Busca produtos no Mercado Livre e retorna lista com preços. Use quando o usuário pedir para buscar ou pesquisar produtos no Mercado Livre."
---

# Buscar Produtos no Mercado Livre

Quando o usuário pedir para buscar produtos no Mercado Livre:

## Processo

1. **Use WebSearch** para buscar:
   - Query: `<termo> mercado livre`
   - Filtro: `allowed_domains: ["mercadolivre.com.br"]`

2. **Use WebFetch** nos links do mercadolivre.com.br para extrair:
   - **Preço**: Procure em `<span class="andes-money-amount__fraction">VALOR</span>`
   - **Título**: Tag `<h1>` ou título do produto
   - **Avaliações**: Classe `andes-rating`

3. **Apresente no formato:**

| # | Produto | Preço | Avaliação | Link |
|---|---------|-------|-----------|------|
| 1 | Título | R$ XXX | ⭐ 4.5 | [Ver](url) |

## Seletores HTML do Mercado Livre
- **Preço inteiro**: `<span class="andes-money-amount__fraction">` 
- **Preço centavos**: `<span class="andes-money-amount__cents">`
- **Título**: `<h1 class="ui-pdp-title">`
- **Vendedor**: `<span class="ui-seller-title__label">`

## Regras
- ✅ Filtre WebSearch apenas para mercadolivre.com.br
- ✅ Use os seletores HTML acima para extrair preços com precisão
- ✅ Máximo 5 resultados
- ✅ Ordene por preço (menor para maior)
- ✅ Apresente em português com R$
- ⚠️ Se WebFetch retornar 403, use Bash com curl + parsing JSON como fallback

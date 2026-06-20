---
name: "buscar-ml"
description: "Busca produtos no Mercado Livre e retorna lista com preços. Use quando o usuário pedir para buscar ou pesquisar produtos no Mercado Livre."
---

# Buscar Produtos no Mercado Livre

Quando o usuário pedir para buscar produtos no Mercado Livre:

## Processo

1. **Use WebSearch** para buscar:
2. **Extraia dos resultados:**
   - Título do produto
   - Preço (R$)
   - Link direto
   - Condição (novo/usado)

3. **Apresente no formato:**


## Regras
- Sempre use WebSearch com `site:mercadolivre.com.br`
- Máximo 5 resultados
- Ordene por menor preço quando possível
- Apresente em português

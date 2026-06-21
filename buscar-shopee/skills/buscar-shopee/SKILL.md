---
name: "buscar-shopee"
description: "Busca produtos na Shopee com preços reais usando scraper. Retorna lista completa com valores atualizados."
---

# Buscar Produtos na Shopee

Quando o usuário pedir para buscar produtos na Shopee:

## Processo

1. **Execute o scraper Python:**
```bash
   cd ~/.claude/skills/buscar-shopee
   python3 -c "
   import scraper
   resultados = scraper.run_scraper('default', '<TERMO>', max_pages=1)
   for r in resultados[:5]:
       print(f\"{r['nome']} — R\$ {r['preco']:.2f}\")
       print(f\"  Link: {r['url']}\")
   "
```

2. **Extraia de cada resultado:**
   - `nome` — título do produto
   - `preco` — preço em R$
   - `url` — link direto
   - `loja` — vendedor

3. **Apresente:**

| # | Produto | Preço | Loja | Link |
|---|---------|-------|------|------|
| 1 | Tela A15 | R$ 120,00 | ShopXYZ | [Ver](url) |

## Regras
- Máximo 5 resultados por busca
- Preços atualizados em tempo real
- Ordene por menor preço
- Apresente em português

#!/bin/bash
# Scraper de preços do Mercado Livre - Fallback quando WebFetch falha

TERMO="$1"
MAX_RESULTADOS=5

echo "🔍 Buscando: $TERMO no Mercado Livre..."

# Busca usando curl diretamente na API interna do ML
SEARCH_URL="https://api.mercadolibre.com/sites/MLB/search?q=${TERMO}&limit=${MAX_RESULTADOS}"

curl -s "$SEARCH_URL" | jq -r '.results[] |
  {
    titulo: .title,
    preco: .price,
    moeda: .currency_id,
    link: .permalink
  }' | while read -r item; do

  titulo=$(echo "$item" | jq -r '.titulo')
  preco=$(echo "$item" | jq -r '.preco')
  link=$(echo "$item" | jq -r '.link')

  echo "✓ $titulo | R\$ $preco | $link"
done

echo ""
echo "✅ Busca concluída!"

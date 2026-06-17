---
name: "buscar-ml"
description: "Busca produtos no Mercado Livre via API oficial OAuth e retorna lista ordenada por menor preço."
---

# Buscar Produtos no Mercado Livre

Quando `/buscar-ml <termo>` é invocado:

## Pré-requisito: token OAuth

Execute no terminal para gerar o token (válido por 6 horas):

```bash
curl -s -X POST "https://api.mercadolibre.com/oauth/token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "grant_type=client_credentials&client_id=$ML_CLIENT_ID&client_secret=$ML_CLIENT_SECRET" \
  | python3 -c "import json,sys; print(json.load(sys.stdin)['access_token'])"
```

As variáveis `ML_CLIENT_ID` e `ML_CLIENT_SECRET` devem estar no `~/.bashrc`.

## Processo

1. **Gere o token** conforme acima e armazene na variável `TOKEN`

2. **Monte a URL de busca**:
   ```
   https://api.mercadolibre.com/sites/MLB/search?q=<termo>&sort=price_asc&limit=5
   ```
   Substitua espaços por `+` no termo.

3. **Execute a busca**:
   ```bash
   curl -s -H "Authorization: Bearer $TOKEN" \
     "https://api.mercadolibre.com/sites/MLB/search?q=<termo>&sort=price_asc&limit=5"
   ```

4. **Extraia do JSON** o array `results` e para cada item:
   - `title` — nome do produto
   - `price` — preço (float)
   - `permalink` — link direto
   - `seller.nickname` — nome do vendedor
   - `condition` — `"new"` → Novo / `"used"` → Usado
   - `available_quantity` — estoque

5. **Apresente no formato**:

```
## Resultados no Mercado Livre: <termo>
(ordenado por menor preço)

1. **<título>** — R$ <preço>
   Vendedor: <seller> | Condição: <novo/usado> | Estoque: <qtd>
   🔗 <permalink>

---
Fonte: api.mercadolibre.com | <data>
```

## Regras

- Sempre gere um token novo se o anterior expirou (6h de validade)
- Se a API retornar 403, o IP é de datacenter — use de uma máquina com IP residencial
- Nunca exponha `ML_CLIENT_SECRET` em logs ou outputs
- Máximo 5 resultados por busca

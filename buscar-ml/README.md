# buscar-ml

Busca produtos no Mercado Livre via API pública e retorna lista ordenada por menor preço.

## Uso

```
/buscar-ml <termo>
```

## Exemplos

```
/buscar-ml notebook i5
/buscar-ml iphone 14
/buscar-ml cafeteira elétrica
```

## O que faz

- Consulta a API pública do Mercado Livre (sem autenticação)
- Ordena os resultados por menor preço automaticamente
- Retorna até 5 produtos com título, preço, vendedor, condição e link direto

## Fonte de dados

`https://api.mercadolibre.com/sites/MLB/search`

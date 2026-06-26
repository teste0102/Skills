---
name: "mk-leitor-docs"
description: "Ler e editar arquivos PDF, Excel (.xlsx) e Word (.docx)"
---

# Leitor e Editor de Documentos

## Uso

### LER
```bash
python3 leitor-editor.py ler documento.pdf
python3 leitor-editor.py ler planilha.xlsx
python3 leitor-editor.py ler arquivo.docx
```

### EDITAR EXCEL
```bash
python3 leitor-editor.py editar-xlsx planilha.xlsx "Sheet1" 2 3 "novo valor"
```

### EDITAR WORD
```bash
python3 leitor-editor.py editar-docx arquivo.docx 0 "novo parágrafo"
```

## Funções
- ✅ Ler PDF (extrai texto)
- ✅ Ler XLSX (lê todas as abas)
- ✅ Ler DOCX (lê parágrafos)
- ✅ Editar XLSX (altera células)
- ✅ Editar DOCX (altera parágrafos)

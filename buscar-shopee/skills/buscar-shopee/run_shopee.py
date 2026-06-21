#!/usr/bin/env python3
"""
Script para executar busca no Shopee via scraper
Uso: python3 run_shopee.py "termo de busca"
"""

import sys
import json
from pathlib import Path

# Adiciona scraper.py ao path
sys.path.insert(0, str(Path(__file__).parent))

try:
    from scraper import run_scraper
    
    if len(sys.argv) < 2:
        print(json.dumps({"error": "Uso: python3 run_shopee.py 'termo'"}))
        sys.exit(1)
    
    termo = sys.argv[1]
    
    # Executa scraper
    pasta_destino, driver, caminhos_html = run_scraper('default', termo, max_pages=1)
    
    print(json.dumps({
        "status": "success",
        "termo": termo,
        "pasta": str(pasta_destino),
        "htmls": caminhos_html if isinstance(caminhos_html, list) else [caminhos_html]
    }))
    
    if driver:
        driver.quit()

except ImportError as e:
    print(json.dumps({"error": f"Dependência faltando: {e}"}))
except Exception as e:
    print(json.dumps({"error": str(e)}))

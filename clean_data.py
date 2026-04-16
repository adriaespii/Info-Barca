import json
import re

dest = r'c:\Users\adria\OneDrive\Documentos\Clase\DAW\proyecte\Mister_DAW_PI\src'

# 1) Clean players.json
with open(dest + r'\players.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

barca_players = [p for p in data if 'Barcelona' in p.get('club', '') or p.get('club_id') == 131]
other_players = [p for p in data if 'Barcelona' not in p.get('club', '') and p.get('club_id') != 131][:20]

final_players = barca_players + other_players

with open(dest + r'\players.json', 'w', encoding='utf-8') as f:
    json.dump(final_players, f, ensure_ascii=False, indent=4)

# 2) Clean index.html massive ALL_PLAYERS constant
with open(dest + r'\index.html', 'r', encoding='utf-8') as f:
    html = f.read()

html = re.sub(r'const ALL_PLAYERS = \[.*?\];', 'const ALL_PLAYERS = [];', html, flags=re.DOTALL)
html = re.sub(r'const LEAGUES_DATA = \{.*?\};', 'const LEAGUES_DATA = { "ES1": [{"id": 131, "name": "FC Barcelona", "mit": 85, "league": "ES1"}, {"id": 418, "name": "Real Madrid", "mit": 86, "league": "ES1"}] };', html, flags=re.DOTALL)

with open(dest + r'\index.html', 'w', encoding='utf-8') as f:
    f.write(html)
print('Done data trimming')

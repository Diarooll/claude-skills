# Ferramentas instaladas no Claude Code

Como reinstalar tudo numa máquina nova.

## Superpowers (plugin)
```
claude plugin install superpowers@claude-plugins-official
```
Em `~/.claude/settings.json`, desligar a telemetria:
```json
"env": { "SUPERPOWERS_DISABLE_TELEMETRY": "1" }
```

## Node.js (para projetos React/Vite e componentes do 21st)
Instalado pelo nvm, sem sudo:
```
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install --lts
```

## Brave (ver o site rodando)
Navegador usado para abrir o site e tirar print (não tem Chrome instalado). Instalado via snap (`/snap/bin/brave`).

## Graphify (skill)
Monta um mapa (grafo) do projeto para o Claude consultar sem reler tudo. Uso: `/graphify .` na pasta do projeto.
```
curl -LsSf https://astral.sh/uv/install.sh | sh   # instala o uv
uv tool install graphifyy                          # pacote com dois "y"
graphify install                                   # copia a skill para ~/.claude/skills/graphify
```
A pasta `graphify/` aqui é só uma cópia de backup da skill; o `graphify install` gera ela de novo.

## 21st.dev (servidor MCP)
Mais de 10 mil componentes React/Tailwind prontos. Chave grátis em https://21st.dev/mcp (NUNCA commitar a chave).
```
claude mcp add --scope user --transport http 21st https://21st.dev/api/mcp --header "x-api-key: SUA_CHAVE"
```

## Design e Engineering (plugins da Anthropic)
Vêm sincronizados da conta do claude.ai (aparecem como `design:*` e `engineering:*`). As pastas `design/` e `engineering/` na raiz deste repo são uma cópia de backup das skills (sem os conectores MCP).
Skills usadas no flow de site: `design:ux-copy`, `design:design-critique`, `design:accessibility-review`, `engineering:system-design`, `engineering:deploy-checklist`.
Para usar numa máquina sem a sincronização, carregar as pastas como plugin local:
```
claude --plugin-dir ./design --plugin-dir ./engineering
```

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

#!/usr/bin/env bash
# Instala as skills, o CLAUDE.md global e as memórias deste repo em ~/.claude.
# Uso: git pull && ./instalar.sh  (pode rodar quantas vezes quiser)
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
SKILLS="$CLAUDE_DIR/skills"
MEMORIA="$CLAUDE_DIR/projects/$(printf '%s' "$HOME" | sed 's/[^a-zA-Z0-9]/-/g')/memory"

mkdir -p "$SKILLS" "$MEMORIA"

instalar_pasta() { # origem nome
  mkdir -p "$SKILLS/$2"
  cp -r "$1/." "$SKILLS/$2/"
}

instalar_arquivo() { # arquivo.md nome
  mkdir -p "$SKILLS/$2"
  cp "$1" "$SKILLS/$2/SKILL.md"
}

# Troca o marcador {{REPO}} pelo local real deste repo.
com_caminho() {
  REPO_PATH="$REPO" perl -pe 's/\{\{REPO\}\}/$ENV{REPO_PATH}/g' "$1"
}

# --- Skills
qtd_antes=$(find "$SKILLS" -mindepth 1 -maxdepth 1 | wc -l)

instalar_pasta "$REPO/auditoria-lgpd" auditoria-lgpd
instalar_pasta "$REPO/ideias/julgamento-ideia" julgamento-ideia
instalar_pasta "$REPO/seguranca" security-audit
instalar_pasta "$REPO/ferramentas/graphify" graphify
instalar_arquivo "$REPO/avaliacao-design.md" avaliacao-design
instalar_arquivo "$REPO/sem-cara-de-ia.md" sem-cara-de-ia

for pasta in "$REPO"/skills-externas/*/ "$REPO"/linkedin/*/; do
  instalar_pasta "${pasta%/}" "$(basename "$pasta")"
done

qtd_depois=$(find "$SKILLS" -mindepth 1 -maxdepth 1 | wc -l)
echo "Skills: ok em $SKILLS ($((qtd_depois - qtd_antes)) novas)"

# --- CLAUDE.md global
# Substitui só as seções que vêm deste repo. Outras seções da máquina ficam como estão.
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
if [ -f "$CLAUDE_MD" ]; then
  titulos="$(grep '^# ' "$REPO/config/CLAUDE.md")"
  resto="$(TITULOS="$titulos" awk '
    BEGIN { n = split(ENVIRON["TITULOS"], t, "\n"); for (i = 1; i <= n; i++) gerenciado[t[i]] = 1 }
    /^# / { pular = ($0 in gerenciado) }
    !pular { print }
  ' "$CLAUDE_MD")"
else
  resto=""
fi
{
  if [ -n "$resto" ]; then
    printf '%s\n\n' "$resto"
  fi
  com_caminho "$REPO/config/CLAUDE.md"
} > "$CLAUDE_MD.novo"
# Só guarda backup quando algo muda, para rodar de novo não apagar o backup anterior.
if [ -f "$CLAUDE_MD" ] && ! cmp -s "$CLAUDE_MD" "$CLAUDE_MD.novo"; then
  cp "$CLAUDE_MD" "$CLAUDE_MD.bak"
fi
mv "$CLAUDE_MD.novo" "$CLAUDE_MD"
echo "CLAUDE.md: ok em $CLAUDE_MD"

# --- Voz do LinkedIn (não sobrescreve se a máquina já tiver uma)
mkdir -p "$CLAUDE_DIR/linkedin"
cp -n "$REPO/linkedin/voice.md" "$CLAUDE_DIR/linkedin/voice.md" 2>/dev/null || true

# --- Memórias
touch "$MEMORIA/MEMORY.md"
for arq in "$REPO"/config/memory/*.md; do
  nome="$(basename "$arq")"
  [ "$nome" = "MEMORY.md" ] && continue
  com_caminho "$arq" > "$MEMORIA/$nome"
done
while IFS= read -r linha; do
  [ -z "$linha" ] && continue
  grep -qxF -- "$linha" "$MEMORIA/MEMORY.md" || printf '%s\n' "$linha" >> "$MEMORIA/MEMORY.md"
done < "$REPO/config/memory/MEMORY.md"
echo "Memórias: ok em $MEMORIA"

# --- O que o script não instala
echo
echo "Pronto. Abra uma sessão nova do Claude Code para valer."
if ! command -v claude >/dev/null 2>&1; then
  echo "Atenção: o comando claude não foi encontrado nesta máquina."
fi
echo "Plugins (Superpowers etc.), Node, Brave, uv e a chave do 21st: siga $REPO/ferramentas/README.md"

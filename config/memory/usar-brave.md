---
name: usar-brave
description: Use Brave (snap) to open sites and take screenshots; Chrome is not installed
metadata:
  type: feedback
---

Para abrir sites e tirar prints, usar o Brave (`/snap/bin/brave`), não Chrome/Firefox.

**Why:** o usuário pediu explicitamente; Chrome não está instalado, então `claude-in-chrome` não funciona.
**How to apply:** `brave --headless --hide-scrollbars --virtual-time-budget=5000 --window-size=390,844 --screenshot=$HOME/<pasta>/x.png <url>`. É snap: salvar em pasta não-oculta da home, depois mover. Fluxo completo em {{REPO}}/FLOW.md.

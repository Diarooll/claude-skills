# graphify
- **graphify** (`~/.claude/skills/graphify/SKILL.md`) - any input to knowledge graph. Trigger: `/graphify`
When the user types `/graphify`, use the installed graphify skill or instructions before doing anything else.

# flow
When the user says "claude, vamos criar um site", "vamos criar um app/sistema/projeto", "bora seguir o flow", "o flow de construir um site/projeto" or similar, read `{{REPO}}/FLOW.md` and follow its steps in order, invoking each skill yourself.

# perguntar antes de fazer
Antes de implementar algo novo ou mudar comportamento, use a skill `grilling`, a menos que a tarefa seja pequena e sem ambiguidade. Não adicione nada que não foi pedido: se achar que falta algo, pergunte antes.

# respostas
Responda de forma resumida: vá direto ao ponto, use poucos tópicos curtos e só detalhe quando eu pedir. Escreva em português.

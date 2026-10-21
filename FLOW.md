# Flow para construir um site com as skills

```
julgamento-ideia → Superpowers (planejar) → visual e texto → Superpowers + 21st (construir e ver rodando)
      → revisar (design, acessibilidade, código, Graphify, security-audit) → publicar → [opcional] LinkedIn (mostrar)
```

Não precisa chamar cada ferramenta pelo nome: é só dizer o que quer fazer. A exceção é o julgamento, que pergunta antes de rodar porque gasta mais token.

## Landing page ou app?

| Etapa | Landing page / portfólio | App com login e banco |
|---|---|---|
| `engineering:system-design` | pula | usa |
| Testes (TDD) | só no que tiver lógica (formulário etc.) | sempre |
| `security-audit` | rápido (chaves expostas, formulário) | completo, obrigatório |
| Visual, texto, acessibilidade | capricha | usa |

Quer algo rápido na nuvem sem construir local? Use o **Lovable** no lugar das etapas 3 e 4.

## 1. Ideia → `julgamento-ideia`
Antes de começar, testa se a ideia vale a pena. Termina com SEGUE, AJUSTA ou DESISTE.
Pedir: "julga minha ideia" ou `/julgamento-ideia`.

## 2. Desenho → Superpowers (brainstorming + plano)
Conversa e faz perguntas para definir o que construir. Depois escreve o plano: funcionalidades, arquitetura e tarefas em ordem.
- **Só app:** `engineering:system-design` para decidir backend, banco e login. Pedir: "como eu arquiteto o backend disso?".

## 3. Visual e texto
Antes de codar as telas.
- **`frontend-design`:** define a cara do site (fonte, cores, layout) para não ficar com cara de template. Pedir: "define a direção visual do site".
- **21st:** só a parte visual do frontend (React + Tailwind). Pedir: "uma tela de login do 21st", "um hero com cards do 21st". Não cria funcionalidades nem backend.
- **`design:ux-copy`:** textos de títulos, botões, mensagens de erro. Pedir: "escreve os textos da home".
- **`sem-cara-de-ia` / `li-human`:** passa os textos do site por aqui para não parecerem escritos por IA.
- **Canva (opcional):** logo, imagens, banner.

## 4. Construção → Superpowers + 21st
- **Superpowers:** executa o plano tarefa por tarefa, escreve os testes primeiro e confere que tudo passa antes de dizer que terminou. Em bug, investiga passo a passo em vez de chutar.
- **Ver rodando:** `run` ou `claude-in-chrome` abrem o site e tiram print. Pedir: "abre o site e me mostra como ficou no desktop e no celular".

## 5. Revisão
- **`design:design-critique`:** crítica do visual (hierarquia, espaçamento, consistência). Pedir: "critica o design da home".
- **`design:accessibility-review`:** contraste, navegação por teclado, leitor de tela. Pedir: "audita a acessibilidade".
- **`code-review`:** revisão do código antes do merge. Pedir: `/code-review`.
- **Graphify:** quando o projeto já tiver um tamanho razoável: "faz o mapa do projeto com o graphify" (ou `/graphify .`).
  - Mostra como as partes se ligam (controller → service → repository). Ver em `graphify-out/graph.html`.
  - Atualizar depois de mudanças: `/graphify . --update`.
  - Perguntas: "o que quebra se eu mudar X?", `/graphify query "..."`.
  - Colocar `graphify-out/` no `.gitignore`.
- **`security-audit`:** antes de publicar, ou ao mexer em login, senha, pagamento ou dados de usuário. Procura injeção de SQL, rotas sem autenticação, chaves expostas etc. Não precisa rodar a cada commit.

## 6. Publicar
1. **`superpowers:verification-before-completion`:** roda tudo e confirma que funciona de verdade.
2. **`engineering:deploy-checklist`:** checklist antes de ir pro ar (variáveis de ambiente, domínio, migrations, como voltar atrás). Pedir: "checklist de deploy".
3. **`superpowers:finishing-a-development-branch`:** fecha o branch (merge ou PR).

## 7. (Opcional) Divulgar → skills do LinkedIn
Só se quiser divulgar o projeto. Com ele pronto, `li-post` ou `li-carousel` para mostrar o que foi construído a recrutadores.

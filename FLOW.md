# Flow para construir um projeto com as skills

```
julgamento-ideia → Superpowers (planejar) → Superpowers + 21st (construir)
      → Graphify (entender) → security-audit (proteger) → LinkedIn (mostrar)
```

Não precisa chamar cada ferramenta pelo nome: é só dizer o que quer fazer. A exceção é o julgamento, que pergunta antes de rodar porque gasta mais token.

## 1. Ideia → `julgamento-ideia`
Antes de começar, testa se a ideia vale a pena. Termina com SEGUE, AJUSTA ou DESISTE.
Pedir: "julga minha ideia" ou `/julgamento-ideia`.

## 2. Desenho → Superpowers (brainstorming)
Conversa e faz perguntas para definir o que construir. Depois escreve o plano: funcionalidades, arquitetura e tarefas em ordem.

## 3. Construção → Superpowers + 21st
- **Superpowers:** executa o plano tarefa por tarefa, escreve os testes primeiro e confere que tudo passa antes de dizer que terminou. Em bug, investiga passo a passo em vez de chutar.
- **21st:** só a parte visual do frontend (React + Tailwind). Pedir: "uma tela de login do 21st", "um dashboard com cards do 21st". Não cria funcionalidades nem backend.

## 4. Entender o sistema → Graphify
Quando o projeto já tiver um tamanho razoável: "faz o mapa do projeto com o graphify" (ou `/graphify .`).
- Mostra como as partes se ligam (controller → service → repository). Ver em `graphify-out/graph.html`.
- Atualizar depois de mudanças: `/graphify . --update`.
- Perguntas: "o que quebra se eu mudar X?", `/graphify query "..."`.
- Colocar `graphify-out/` no `.gitignore`.

## 5. Segurança → `security-audit`
Antes de publicar, ou ao mexer em login, senha, pagamento ou dados de usuário. Procura injeção de SQL, rotas sem autenticação, chaves expostas etc. Não precisa rodar a cada commit.

## 6. Divulgar → skills do LinkedIn
Com o projeto pronto, `li-post` ou `li-carousel` para mostrar o que foi construído a recrutadores.

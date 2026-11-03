# Flow para construir um site ou software com as skills

```
julgamento-ideia → Superpowers + grilling (planejar) → visual e texto (taste) → Superpowers + 21st (construir e ver rodando)
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
| `grilling` | opcional | sempre (antes de aprovar o plano) |
| `design-taste-frontend` | modo site | modo telas de app (dashboard, admin, configurações) |

Quer algo rápido na nuvem sem construir local? Use o **Lovable** no lugar das etapas 3 e 4.

## 1. Ideia → `julgamento-ideia`
Antes de começar, testa se a ideia vale a pena. Termina com SEGUE, AJUSTA ou DESISTE.
Pedir: "julga minha ideia" ou `/julgamento-ideia`.

## 2. Desenho → Superpowers (brainstorming + plano)
Entre em **plan mode** antes de começar (Shift+Tab). Assim o Claude só lê e planeja, sem mexer em nada, e você aprova o plano antes de construir.
Conversa e faz perguntas para definir o que construir. Depois escreve o plano: funcionalidades, arquitetura e tarefas em ordem.

**O Claude PERGUNTA, não decide sozinho.** Antes de escrever o plano, ele faz estas perguntas (uma ou duas por vez, com opções e uma recomendada, e mostrando exemplos quando ajudar):
1. **Tema:** sobre o que é o site, para quem, e qual o clima (acolhedor, sério, divertido, luxuoso...).
2. **Cores:** 2 ou 3 paletas para escolher, cada uma com os códigos das cores. Pode trazer as suas também (logo, fachada, referência).
3. **Fontes e estilo:** 2 ou 3 combinações de fonte de título + texto, e o estilo do layout.
4. **Como vai ser feito:** HTML simples ou React + Vite, onde fica a pasta, se vai ter backend.
5. **Ferramentas:** quais usar neste projeto (21st, Canva, Lovable, Graphify...) e quais pular.

Só depois das respostas o plano é escrito, e nele fica marcado o que foi escolha sua e o que foi sugestão do Claude.
- **Só app:** `engineering:system-design` para decidir backend, banco e login. Pedir: "como eu arquiteto o backend disso?".
- **`grilling`:** antes de aprovar o plano, o Claude te interroga sobre ele (casos extremos, o que acontece se der errado, o que ficou vago) até não sobrar furo. Pedir: "me grelha sobre esse plano".

## 3. Visual e texto
Antes de codar as telas.
- **`design-taste-frontend`:** direção de arte baseada em sites premiados: sugere composição, tipografia, paleta e blocos de seção, e depois confere com prints e corrige o que ficou genérico. Serve para site e para telas de app (dashboard, admin). Como na etapa 2, **ele sugere e você escolhe**.
- **`frontend-design` + `sem-cara-de-ia`:** conferem se as cores, fontes e layout escolhidos na etapa 2 não ficaram com cara de IA. Se o Claude quiser mudar algo, ele **pergunta antes** e mostra a alternativa, em vez de trocar por conta própria.
- **21st:** só a parte visual do frontend (React + Tailwind). Precisa de Node (ver `ferramentas/README.md`). No plano grátis são só **2 componentes por dia**: use para o que for mais trabalhoso, não para navbar simples. Pedir: "uma tela de login do 21st", "um hero com cards do 21st". Não cria funcionalidades nem backend.
- **`design:ux-copy`:** textos de títulos, botões, mensagens de erro. Pedir: "escreve os textos da home".
- **`li-human`:** passa os textos do site por aqui para não parecerem escritos por IA (tira travessão, palavras típicas de IA etc.).
- **Canva (opcional):** logo, imagens, banner.

## 4. Construção → Superpowers + 21st
- **Superpowers:** executa o plano tarefa por tarefa, escreve os testes primeiro e confere que tudo passa antes de dizer que terminou. Em bug, investiga passo a passo em vez de chutar.
- **Ver rodando:** usar o **Brave** (é o navegador instalado; não tem Chrome). Pedir: "abre o site no Brave e me mostra como ficou no desktop e no celular". O Claude tira o print assim:
  ```
  brave --headless --hide-scrollbars --virtual-time-budget=5000 --window-size=390,844 --screenshot=$HOME/prints/celular.png http://localhost:5173
  ```
  O Brave é snap: salvar o print numa pasta da home (não em `/tmp` nem em pasta oculta). Use `--window-size=1440,900` para desktop.

## 5. Revisão
- **`avaliacao-design`:** roda `design-critique`, `design-system` e `accessibility-review` de uma vez e entrega um relatório só, com contraste calculado, semântica, tokens e ordem de correção. Faz parte desta etapa, mas **também funciona sozinha a qualquer momento**: no meio da construção, depois de mudar o visual, ou em um projeto que já existe. Só avalia, não altera nada; depois você escolhe quais correções aplicar, aos poucos. Pedir: "avaliacao-design" ou "avalie o design".
- **`design:design-critique`:** crítica do visual (hierarquia, espaçamento, consistência). Pedir: "critica o design da home".
- **`design:accessibility-review`:** contraste, navegação por teclado, leitor de tela. Pedir: "audita a acessibilidade".
- **`code-review`:** revisão do código antes do merge. Pedir: `/code-review`.
- **Graphify:** quando o projeto já tiver um tamanho razoável: "faz o mapa do projeto com o graphify" (ou `/graphify .`).
  - Mostra como as partes se ligam (controller → service → repository). Ver em `graphify-out/graph.html`.
  - Atualizar depois de mudanças: `/graphify . --update`.
  - Perguntas: "o que quebra se eu mudar X?", `/graphify query "..."`.
  - Colocar `graphify-out/` no `.gitignore`.
- **`security-audit`:** antes de publicar, ou ao mexer em login, senha, pagamento ou dados de usuário. Procura injeção de SQL, rotas sem autenticação, chaves expostas etc. Não precisa rodar a cada commit.
- **`auditoria-lgpd`:** antes de abrir o app para usuários de verdade, principalmente se ele guarda dado pessoal ou financeiro. Pesquisa o que a LGPD exige hoje, mapeia os dados que o app trata e entrega um relatório em português simples, com os problemas em ordem de prioridade (P0 a P3). Só lê, não altera nada; depois você escolhe quais correções aplicar, item por item. Complementa o `security-audit`: ele caça falhas técnicas, esta olha política de privacidade, consentimento, exclusão de conta e terceiros. Pedir: "faz a auditoria de LGPD" ou "o app está adequado à LGPD?".

## 6. Publicar
1. **`superpowers:verification-before-completion`:** roda tudo e confirma que funciona de verdade.
2. **`engineering:deploy-checklist`:** checklist antes de ir pro ar (variáveis de ambiente, domínio, migrations, como voltar atrás). Pedir: "checklist de deploy".
3. **`superpowers:finishing-a-development-branch`:** fecha o branch (merge ou PR).

## 7. (Opcional) Divulgar → skills do LinkedIn
Só se quiser divulgar o projeto. Com ele pronto, `li-post` ou `li-carousel` para mostrar o que foi construído a recrutadores.

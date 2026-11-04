# Flow para construir um site ou software com as skills

```
julgamento-ideia → interrogatório + termos (grilling + domain-modeling) → plano → visual e texto (taste) → Superpowers + 21st (construir e ver rodando)
      → revisar (design, acessibilidade, código, Graphify, security-audit) → publicar → [opcional] LinkedIn (mostrar)
```

## Como o Claude executa este flow

Basta dizer **"claude, vamos criar um site"** (ou app, sistema, projeto). O Claude segue as etapas em ordem e chama cada skill sozinho, sem você precisar pedir pelo nome.

- **Três paradas obrigatórias:** ele só avança com o seu "ok" em: (1) fim do interrogatório, (2) plano, (3) publicação.
- **Nada de código antes do plano aprovado.** O que pode ser escrito antes disso é só `GLOSSARY.md`, ADRs e o próprio plano.
- **Nada além do combinado.** Ideia nova que não foi pedida vira pergunta, não código.
- **Etapa pulada é avisada:** ele diz qual pulou e por quê, em uma linha (ver a tabela abaixo).
- **Skills que só rodam se você topar:** `julgamento-ideia` e as do LinkedIn. Ele oferece em uma linha e espera.

## Landing page ou app?

| Etapa | Landing page / portfólio | App com login e banco |
|---|---|---|
| `engineering:system-design` | pula | usa |
| Testes (TDD) | só no que tiver lógica (formulário etc.) | sempre |
| `security-audit` | rápido (chaves expostas, formulário) | completo, obrigatório |
| Visual, texto, acessibilidade | capricha | usa |
| `grilling` + `domain-modeling` | sempre (menos rodadas) | sempre |
| `design-taste-frontend` | modo site | modo telas de app (dashboard, admin, configurações) |

Quer algo rápido na nuvem sem construir local? Use o **Lovable** no lugar das etapas 3 e 4.

## 1. Ideia → `julgamento-ideia`
O Claude oferece em uma linha e só roda se você topar, porque gasta muito token. Testa se a ideia vale a pena e termina com SEGUE, AJUSTA ou DESISTE.

## 2. Interrogatório e termos → `grilling` + `domain-modeling`
O Claude chama as duas skills juntas, sempre, e não usa plan mode (ele precisa poder escrever o `GLOSSARY.md`). Elas substituem as perguntas do `superpowers:brainstorming`, para você não responder tudo duas vezes.

- **`grilling`:** perguntas em rodadas, cada uma com a resposta recomendada (um "sim" aceita), até não sobrar decisão em aberto ou suposição silenciosa. Inclui casos extremos, o que acontece se der errado e o que fica de fora. O que dá para descobrir olhando os arquivos ele descobre sozinho.
- **`domain-modeling`:** questiona termos vagos ("conta" é cliente ou usuário?), testa com cenários concretos e contesta o que contradiz o código. Os termos resolvidos vão para o `GLOSSARY.md` do projeto na hora. Decisões difíceis de reverter, surpreendentes e com alternativas reais viram ADR em `docs/adr/`.
- **Se ficar longo:** diga "chega, pode seguir" e ele lista o que ficou em aberto antes de avançar.
- **Só app:** `engineering:system-design` entra nas rodadas para decidir backend, banco e login.

**O Claude PERGUNTA, não decide sozinho.** O interrogatório segue estas rodadas, nesta ordem, com opções, uma recomendada e exemplos quando ajudar. As opções visuais vêm do `design-taste-frontend` e do `sem-cara-de-ia`. Cada rodada usa as respostas da anterior:
1. **Tipo de projeto:** é algo simples (landing page, portfólio) ou mais complexo, com funcionalidades (login, banco, painel, pagamento)? A resposta define qual coluna da tabela "Landing page ou app?" vale daqui em diante. Se ficar no meio do caminho, as partes com lógica ou dados de usuário seguem a coluna de app.
2. **Tema:** sobre o que é o site, para quem, qual o objetivo principal e qual o clima (acolhedor, sério, divertido, luxuoso...). Sites de que você gosta e de que não gosta.
3. **Cores:** 2 ou 3 paletas para escolher, cada uma com os códigos das cores. Tema claro ou escuro, e cores que são proibidas. Pode trazer as suas também (logo, fachada, referência).
4. **Fontes:** 2 ou 3 combinações de fonte de título + texto, com o estilo de cada uma (serifada, condensada, geométrica, manuscrita...).
5. **Estilo e layout:** composição da página, cantos retos ou arredondados, muito ou pouco espaço em branco, fotos ou ilustrações, e quanta animação.
6. **Conteúdo e funcionalidades:** quais seções e páginas, quem fornece textos e imagens, e o que fica de fora. Se for complexo, também o que cada tipo de usuário pode fazer e o que acontece quando algo dá errado.
7. **Como vai ser feito:** HTML simples ou React + Vite, onde fica a pasta, se vai ter backend.
8. **Ferramentas:** quais usar neste projeto (21st, Canva, Lovable, Graphify...) e quais pular.

**Parada 1:** ele resume o que entendeu, incluindo o que fica de fora, e só avança com o seu "ok".

### Plano → `superpowers:writing-plans`
Com o interrogatório fechado, escreve o plano: funcionalidades, arquitetura e tarefas em ordem, usando os termos do `GLOSSARY.md`. Nele fica marcado o que foi escolha sua e o que foi sugestão do Claude.

**Parada 2:** nada é construído antes de você aprovar o plano.

## 3. Visual e texto
Antes de codar as telas.
- **`design-taste-frontend`:** direção de arte baseada em sites premiados: sugere composição, tipografia, paleta e blocos de seção, e depois confere com prints e corrige o que ficou genérico. Serve para site e para telas de app (dashboard, admin). Aplica o que você **já escolheu na etapa 2**, sem perguntar de novo; só pergunta o que ainda não foi decidido.
- **`frontend-design` + `sem-cara-de-ia`:** conferem se as cores, fontes e layout escolhidos na etapa 2 não ficaram com cara de IA. Se o Claude quiser mudar algo, ele **pergunta antes** e mostra a alternativa, em vez de trocar por conta própria.
- **21st:** só a parte visual do frontend (React + Tailwind). Precisa de Node (ver `ferramentas/README.md`). No plano grátis são só **2 componentes por dia**: use para o que for mais trabalhoso, não para navbar simples. Pedir: "uma tela de login do 21st", "um hero com cards do 21st". Não cria funcionalidades nem backend.
- **`design:ux-copy`:** textos de títulos, botões, mensagens de erro. Pedir: "escreve os textos da home".
- **`li-human`:** passa os textos do site por aqui para não parecerem escritos por IA (tira travessão, palavras típicas de IA etc.).
- **Canva (opcional):** logo, imagens, banner.

## 4. Construção → Superpowers + 21st
- **`superpowers:executing-plans`:** executa o plano tarefa por tarefa.
- **`superpowers:test-driven-development`:** escreve os testes primeiro, onde a tabela acima pede.
- **`superpowers:systematic-debugging`:** em bug, investiga passo a passo em vez de chutar.
- **`superpowers:verification-before-completion`:** confere que tudo passa antes de dizer que terminou.
- **Decisão nova no meio do caminho:** se surgir algo que não foi combinado, ele volta a perguntar (`grilling`) em vez de decidir sozinho. Termo novo vai para o `GLOSSARY.md`.
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
**Parada 3:** ele mostra o resultado da revisão e só publica com o seu "ok".
1. **`superpowers:verification-before-completion`:** roda tudo e confirma que funciona de verdade.
2. **`engineering:deploy-checklist`:** checklist antes de ir pro ar (variáveis de ambiente, domínio, migrations, como voltar atrás). Pedir: "checklist de deploy".
3. **`superpowers:finishing-a-development-branch`:** fecha o branch (merge ou PR).

## 7. (Opcional) Divulgar → skills do LinkedIn
Só se quiser divulgar o projeto. Com ele pronto, `li-post` ou `li-carousel` para mostrar o que foi construído a recrutadores.

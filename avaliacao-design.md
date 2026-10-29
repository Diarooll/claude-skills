---
name: avaliacao-design
description: Fluxo de avaliação de design de um site ou página. Roda design-critique, design-system e accessibility-review em sequência e junta tudo em um relatório único com ordem de prioridade. Use quando o usuário pedir "avaliacao-design", "avalie o design", "veja se está bom" ou quiser checar contraste, acessibilidade e consistência de uma página.
---

# Avaliação de design

Fluxo único que junta três avaliações e entrega um relatório só, em vez de três separados.

## Passo 1: ler o projeto

Ler o HTML, o CSS e o JS da página antes de avaliar. Se houver link do Figma ou screenshot, usar também. Nunca avaliar de memória.

## Passo 2: rodar as três avaliações

Invocar, nesta ordem, via Skill:

1. `design:design-critique`: primeira impressão, usabilidade, hierarquia visual, consistência.
2. `design:design-system`: auditoria de tokens (cores, tipografia, espaçamento, raio, sombra), nomes e estados dos componentes.
3. `design:accessibility-review`: WCAG 2.1 AA (contraste, teclado, foco, leitor de tela, semântica).

## Passo 3: checagens que não podem faltar

- **Contraste:** calcular a razão de cada par texto/fundo e de cada botão contra o fundo. Mínimo 4.5:1 para texto normal, 3:1 para texto grande (24px ou 18.66px bold) e componentes de interface.
- **Semântica:** `lang` correto, `title` descritivo, um `h1`, títulos usados como estrutura e não como estilo.
- **Leitor de tela:** conteúdo que muda por JavaScript tem `aria-live` ou `role="alert"`; botões só com símbolo têm `aria-label`.
- **Tokens:** cor solta no CSS (hex fora do `:root`), token definido e nunca usado, fonte carregada e nunca usada.
- **Layout:** celular em 320px (estouro horizontal), salto de layout quando uma mensagem aparece, `prefers-reduced-motion`.

## Passo 4: relatório único

Entregar em português, em um relatório só, sem repetir o mesmo problema em três seções:

1. **Resumo:** uma frase dizendo se está bom e qual o ponto principal.
2. **Contraste:** tabela com elemento, razão e se passa.
3. **Problemas:** tabela com problema, critério, gravidade (maior, moderado, menor) e correção.
4. **O que funciona:** o que não deve ser mexido.
5. **Ordem sugerida:** grupos pequenos de correção, do mais importante ao menos.

## Regras

- Dizer claramente o que **não** foi testado (navegador, leitor de tela, celular real). Contrastes calculados à mão são aproximados e devem ser descritos assim.
- Só avaliar. Não alterar arquivos neste fluxo.
- Depois do relatório, perguntar se o usuário quer aplicar as correções e aplicar **aos poucos**, um grupo por vez, explicando o que mudou e o que falta. Escolhas de gosto (por exemplo a cor de uma mensagem) ficam para o usuário decidir.
- Ao explicar termos técnicos (`role`, `aria-live`, token), usar linguagem simples e um exemplo do próprio projeto.

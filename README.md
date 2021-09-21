# 1 - O que é código limpo


   Explicando um pouco sobre o que aprendi com o clean code, percebi que a filosofia do clean code consiste em 5 principios:
   
   ***1 - Ordenação:**
   
     Nomear variáveis, funções, arquivos, classes com o nome certo, para que você encontre o que está procurando.
    
   **2 - Cada coisa no seu lugar**
   
     Um pedaço de código deve estar onde você espera que ele esteja, se não estiver mova o para lá.
     
   **3 - Limpeza**
     
     Facilite a leitura do seu código, não mantenha blocos de código comentados.
     
   **4 - Padronização**
   
     O time inteiro faz as mesmas coisas da mesma forma.
     
   **5 - Diciplina**
   
     Siga as regras e seja a mudar conceitos pessoais para se adaptar as regras que o grupo criou.
    

# 2 - A importância dos nomes

A gente coloca nome em: Branches, Pastas, Arquivos, Funções, Classes, no mínimo isso é importante.

    Os nomes devem expressar seu estado e sua funcão de forma clara e objetiva.
    Você deve ler o nome da variável, arquivo ... enfim, ler e entender exatamente o que ela expressa.

# 3 - Softwares bem escritos são funções bem escritas

Dividir para conquistar. Funcões menores com responsábilidades únicas e com um nome que expresse sua lógica contida
são fáceis de se encontrar e de se entender, sem que precisemos entrar em seus detalhes de implementação.

# 4 - Os comentários mentem

Comentários não são 100% mentirosos, mas eles são mentirosos suficientes

    Comentários são mentirosos por que, uma vez que eles não influênciem o comportamento de uma aplicação, eles podem
    ficar desatualizados sem ningúem perceber.
    
    Comentários errados são piores que nenhum comentário, pois eles geram uma expectativa e essa expectativa pode não
    ser atendida. Ou seja a fonte da pode ser encontrada somente no código.

 **Resumindo:** Se você teve que escrever um comentário para explicar o que aquele trecho de código faz, você falhou
 em tentar se comunicar pelo código com outro ser humano.
    
Mas enfím, quando que comentários podem ser benéficos a uma aplicação?

  **1 - Para amplificar algo que pareça inofensivo**

  **2 - Para explicar que aquela implementação foi realmente necessária**

  **3 - Para explicar o 'porque' de ter sido feito tal implementação e não o 'como' foi feito**

  **3 - Para Gerar documentação**
  
  
  # 5 - Resumo da ópera
  
  Escreva códigos que sejam fáceis de serem lidos, entendidos e refatorados.
  
  E foi isso que tentei aplicar no projeto em questão S2.

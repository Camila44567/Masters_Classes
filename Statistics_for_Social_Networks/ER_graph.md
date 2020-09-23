-   O grafo de Erdos-Rényi foi introduzido como um grafo não dirigido.

-   Seu conjunto de vértices é *V* = {1, ..., *N*}.

-   Entre dois vértices *v* e *v*′, *v* ≠ *v*′ quaisquer, colocamos uma
    aresta com probabilidade *p*, onde *p* ∈ \[0, 1\]. Essa decisão é
    tomada independentemente para cada par (não ordenado) de vértices.

-   Essa classe de grafos será designada com a notação *G*(*N*, *p*).

-   Vamos supor que $p = p\_N = \\frac{\\lambda}{N}$, onde *λ* é uma
    constante positiva.

Question 2
==========

Transforme o pseudo-código para a construção de
*G*(*N*, *p*<sub>*N*</sub>) dado no curso em um código efetivo para
simular um grafo desta classe, com $p\_N = \\frac{\\lambda}{N}$ para
diferentes valores de *λ* &gt; 0.

Vide ER\_graph.R

    #Load libraries
    require(ggplot2)

    ## Loading required package: ggplot2

    #Source scripts with functions we're going to use
    source("examples_models.R")

    ## 
    ## Attaching package: 'igraph'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     decompose, spectrum

    ## The following object is masked from 'package:base':
    ## 
    ##     union

    source("ER_graph.R")

Question 3
==========

Observe as diferenças do grafo *G*(*N*, *p*<sub>*N*</sub>) com
*N* = 100, para valores de *λ* &lt; 1, e valores de *λ* &gt; 1.

    #Generate ER graph with varying lambda and get number of edges
    d1 <- get_n_edges(start = 0.001, end = 1, step = 0.01)
    d2 <- get_n_edges(start = 1, end = 10, step = 0.1)

    d <- rbind(d1, d2)

    #plot lambdas by the number of edges generated and add a vertical line at lambda = 1
    ggplot(d, aes(x = lambda, y = n_edges)) +
      geom_point() +
      geom_vline(xintercept = 1) +
      labs(x = "lambda", y = "Number of Edges")

![](ER_graph_files/figure-markdown_strict/unnamed-chunk-2-1.png)

Há um aumento virtualmente linear do número de arestas com o aumento de
*λ*.

Question 4
==========

Considere o modelo do votante, tendo como conjunto de atores
*A* = {1, …, 100} e tendo relações de influência dadas pelo grafo
*G*(100, *λ*/100) da seguinte maneira: O ator a e b se influenciam
mutuamente se *M*(*a*, *b*) = 1. Observe a evolução dessa rede quando
*λ* = 1/2 e *λ* = 5.

    g1 <- ER_graph(N = 100, lambda = 0.5)
    g2 <- ER_graph(N = 100, lambda = 5)

    #number of edges in each
    length(E(g1))

    ## [1] 26

    length(E(g2))

    ## [1] 243

    #initiate opinions of each graph and plot graph
    g1 <- initiate_opinions(g1, 123, 0.5, 0.5)
    plot_opinions(g1)

![](ER_graph_files/figure-markdown_strict/unnamed-chunk-3-1.png)

    g2 <- initiate_opinions(g2, 123, 0.5, 0.5)
    plot_opinions(g2)

![](ER_graph_files/figure-markdown_strict/unnamed-chunk-3-2.png)

    #simulate opinion changes
    l1 <- model_opinions(g1, 123, 1000)
    g1_final <- l1[[1]]
    df1 <- l1[[2]]

    l2 <- model_opinions(g2, 123, 1000)
    g2_final <- l2[[1]]
    df2 <- l2[[2]]

    # Difference between total of +1 and -1 opinions before and after
    # the simulation
    table(V(g1_final)$opinion) - table(V(g1)$opinion)

    ## 
    ## -1  1 
    ## -2  2

    table(V(g2_final)$opinion)- table(V(g2)$opinion)

    ## 
    ##  -1   1 
    ##  21 -21

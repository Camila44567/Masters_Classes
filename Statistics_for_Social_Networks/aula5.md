-   Dado um vértice *v*,
    *D*(*v*) = ∑<sub>*v*′ ∈ *V*, *v*′ ≠ *V*</sub>*M*(*v*, *v*′) é o
    número de vizinhos de *v*.

-   $\\binom{D(v)}{2}$ é o número total de triângulos que podemos
    construir tendo *v* como vértice e tendo como outros dois vértices
    vizinhos de *v*.

-   Isto acontece quando todos os vizinhos de *v* estão conectados por
    arestas entre si (grafo completo).

-   *c*(*v*) é a fração que tem como denominador $\\binom{D(v)}{2}$ e
    como numerador o número de triângulos que realmente existem tendo
    *v* como vértice e vizinhos de *v* como outros dois vértices.

-   *C*(*G*), *o coeficiente de aglomeração do grafo*, é a média dos
    valores de *c*(*v*) para todos os vértices *v* ∈ *V*.

Dado um grafo *G* = (*V*, *E*) e um vértice *v* ∈ *V*,

$$c(v) = \\frac{1}{\\binom{D(v)}{2}} \\sum\_{v\_1, v\_2 \\in V} M(v, v\_1)M(v\_1, v\_2)M(v\_2, v)$$
$$C(G) = \\frac{1}{|V|} \\sum\_{v \\in V} c(v)$$

    library(igraph)
    library(ggplot2)
    source("ER_graph.R")

Question 1
==========

Calcule o coeficiente de aglomeração e o diâmetro do grafo regular.

    #Create a k regular random graph
    g1 <- sample_k_regular(no.of.nodes = 10, k = 3)
    par(mar = c(0, 0, 0, 0)) # Set the margin on all sides to 0
    plot(g1, vertex.label.color = "black", edge.color = "black", 
           vertex.size = 20)

![](aula5_files/figure-markdown_strict/unnamed-chunk-2-1.png)

    #calcular coeficiente de aglomeração (average local clustering coeficient)
    transitivity(g1, type="localaverage")

    ## [1] 0

    #Calcular diâmetro
    diameter(g1)

    ## [1] 3

Question 2
==========

Simule várias vezes *G*(*N*, *p*) com *N*, *p* fixados. Use essas
simulações para estimar o coeficiente de aglomeração e o diâmetro de
*G*(*N*, *p*).

    set.seed(12)

    N <- 100 #numero de vertices
    epochs <- 100 #numero de iterações

    ER_data <- data.frame(iteration = seq(1:epochs),
                          C = vector(length = epochs), 
                          diam = vector(length = epochs))

    #Gerar grafo ER várias vezes
    for (i in seq(1:epochs)) {
      g1 <- ER_graph(N = N, lambda = 10)
      
      #calcular coeficiente de aglomeração (average local clustering coefficient)
      ER_data$C[i] <- transitivity(g1, type="localaverage")

      #Calcular diâmetro
      ER_data$diam[i] <- diameter(g1)
    }

    #plotar os dados de C e C médio
    ggplot(ER_data) +
      aes(x = iteration, y = C) +
      geom_point() +
      geom_hline(yintercept = mean(ER_data$C)) +
      geom_label(x=10, y=0.12, label=paste0("mean(C) = ", signif(mean(ER_data$C), digits = 2)))

![](aula5_files/figure-markdown_strict/unnamed-chunk-3-1.png)

    #plotar os dados de diam e diam médio
    ggplot(ER_data) +
      aes(x = iteration, y = diam) +
      geom_point() +
      geom_hline(yintercept = mean(ER_data$diam)) +
      geom_label(x=10, y=4.5, label=paste0("mean(diam) = ", signif(mean(ER_data$diam), digits = 2)))

![](aula5_files/figure-markdown_strict/unnamed-chunk-3-2.png)

Para *N* = 100 e *p* = *λ*/*N* = 10/100 = 0.1 estimamos o coeficiente de
aglomeração *C* ∼ 0.1 e o diâmetro como *d**i**a**m* = 4.

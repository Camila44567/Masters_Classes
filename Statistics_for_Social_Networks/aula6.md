Caudas Pesadas
==============

Seja *q*(*k*), *k* = 0, 1, 2, … uma distribuição de probabilidade no
conjunto ℕ = {0, 1, 2, …} dos números naturais.

Isso significa que *q*(*k*) ∈ \[0, 1\], para todo *k* ∈ *N* e a série
$\\sum\_{k=0}^{+ \\infty} q(k)$ é somável com
$\\sum\_{k=0}^{+ \\infty} q(k) = 1$.

Se a série é somável, seu resto

*R*(*K*) = ∑<sub>*k* ≥ *K*</sub>*q*(*k*) → 0,
quando *K* →  + ∞.

Dizemos que a cauda da distribuição *q* é **pesada** se *R*(*K*)
decresce para zero muito mais lentamente do que uma distribuição
exponencial.

O peso da cauda dos vértices de *G*(*N*, *p*)
=============================================

Vamos olhar a distribuição de *D*(*v*) em *G*(*N*, *p*), escrevendo
*D*<sub>*N*</sub>(*v*) em vez de *D*(*v*).

**Pulando o rigor matemático por ora (vide slides da aula 6)**

A cauda da *N*(0, 1) decresce exponencialmente.

Conclusão: A cauda de *D*<sub>*N*</sub>(1) decresce rapidamente quando
se afasta de seu valor médio *N*<sub>*p*</sub>. Logo, desse ponto de
vista, ***G*(*N*, *p*) não é um bom modelo para redes sociais.**

Grafos rico fica mais rico
==========================

-   Tanto o conjunto dos vértices, quanto o conjunto das arestas evolui
    ao longo do tempo.

-   Isso o torna um modelo interessante para descrever como uma rede
    social se estabelece e evolui ao longo do tempo.

Vamos trabalhar com tempo *t* evoluindo de maneira discreta,
*t* = 0, 1, 2, ….

Para todo *t* = 0, 1, 2, …,
*G*<sub>*t*</sub> = (*V*<sub>*t*</sub>, *E*<sub>*t*</sub>) é o grafo
produzido pela evolução do sistema até o instante *t* inclusivo. Para
todo *v* ∈ *V*<sub>*t*</sub> denotamos *D*<sub>*t*</sub>(*v*) o grau de
*v* no grafo *G*<sub>*t*</sub>. Também denotamos *M*<sub>*t*</sub> a
matriz de adjacência do grafo *G*<sub>*t*</sub>.

-   Vamos supor por ora que esses grafos são não dirigidos.

### Definição da cadeia de grafos *G*<sub>*t*</sub> = (*V*<sub>*t*</sub>, *E*<sub>*t*</sub>), *t* ≥ 0.

1.  **Inicialização**: Definimos *V*<sub>0</sub> = 1, …, *N*<sub>0</sub>
    com *N*<sub>0</sub> ≥ 2 qualquer fixado e um conjunto de arestas
    *E*<sub>0</sub> de modo que o grau *D*<sub>0</sub>(*v*) ≥ 1 para
    todo *v* ∈ *V*<sub>0</sub>.

2.  Para todo *t* ≥ 1:

    1.  *V*<sub>*t*</sub> = *V*<sub>*t* − 1</sub> ∪ |*V*<sub>*t* − 1</sub>| + 1.
    2.  *E*<sub>*t*</sub> = *E*<sub>*t* − 1</sub> ∪ |*V*<sub>*t* − 1</sub>| + 1, *ξ*<sub>*t*</sub>,
        onde *ξ*<sub>*t*</sub> é um elemento de *V*<sub>*t* − 1</sub>
        escolhido aleatóriamente com a distribuição

$$\\mathbb{P}(\\xi\_t = v) = \\frac{D\_{t-1}(v)}{\\sum\_{v' \\in V\_{t-1} D\_{t-1}(v')}}$$
Os atores que vão entrando sucessivamente nesta rede social vêm do
reservatório infinito {1, 2, …}.

Se *V*<sub>0</sub> = {1, …, *N*<sub>0</sub>}, então *V*<sub>*t*</sub>
terá como atores
{1, …, *N*<sub>0</sub>, *N*<sub>0</sub> + 1, …, *N*<sub>0</sub> + *t*}.

Cada novo ator escolhe um ator já presente na rede com o qual ligar.
Essa escolha é influenciada pelo grau dos atores no instante anterior.
Quanto maior for o grau de um ator no instante anterior, maior será a
sua probabilidade de ser escolhido pelo novo ator que entrou no instante
seguinte.

A probabilidade de escolha de um ator já presente como parceiro do novo
ator é proporcional ao seu grau anterior.

Daí o nome rico fica mais rico.

Question 1
==========

Escreva um código para implementar o grafo rico fica mais rico. Use esse
código para simular a evolução de um sistema começando com
*N*<sub>0</sub> = 2 e *M*<sub>0</sub>(1, 2) = 1.

    library(igraph)
    library(ggplot2)
    source("rich_graph.R")

    set.seed(2)

    g1 <- rich_get_richer_graph(N0 = 2, M0 = c(1,2), t = 100, plot_gV0 = TRUE)

![](aula6_files/figure-markdown_strict/unnamed-chunk-2-1.png)

    #Plot final graph  
    plot(g1, vertex.label = NA, edge.color = "black", 
           vertex.size = 10)

![](aula6_files/figure-markdown_strict/unnamed-chunk-2-2.png) \#
Question 2

A classe de grafos rico fica mais rico foi feita especificamente para
obter vértices com caudas pesadas. Verifique na sua simulação se isso
acontece.

    #Let's generate a larger graph
    g1 <- rich_get_richer_graph(N0 = 2, M0 = c(1,2), t = 1000, plot_gV0 = FALSE)

    #plot degree distribution
    df <- data.frame(degree = table(degree(g1)))

    ggplot(df) + 
      aes(x = degree.Var1, y = degree.Freq) +
      geom_point() +
      labs(x = "Number of vertices", y = "Frequency")

![](aula6_files/figure-markdown_strict/unnamed-chunk-3-1.png) Pela
figura podemos ver que a rede gerada tem caudas pesadas, com poucos
vertices com muitas conexões e muitos vertices com poucas conexões.

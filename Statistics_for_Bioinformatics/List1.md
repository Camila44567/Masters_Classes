Lista 1 Bioestat
================

# Question 1

Considere os dados apresentados no Anexo 1. Há interesse em saber qual é
o  de variação dos dados sob o tratamento \(A\) e sob o tratamento
\(B\). Além disso, há interesse em estimar o valor da verdadeira média
da resposta sob o tratamento \(A\) (e sob o \(B\)).

Calcule os seguintes intervalos:  Qual é a utilidade destes intervalos?
Interprete-os. Faça suposições que achar necessárias.

``` r
Anexo1 <- data.frame(Trat = c(rep("A", 10),rep("B", 10)),
                    Resp = c(89.7, 81.4, 84.5, 84.8, 87.3, 
                             79.7, 85.1, 81.7, 83.7, 84.5, 
                             84.7, 86.1, 83.2, 91.9, 86.3, 
                             79.3, 82.6, 89.1, 83.7, 88.5))
                             

#interval A
A <- Anexo1[Anexo1$Trat=="A",]$Resp

mean(A) - 2*sd(A)
```

    ## [1] 78.4364

``` r
mean(A) + 2*sd(A)
```

    ## [1] 90.0436

``` r
#interval B
B <- Anexo1[Anexo1$Trat=="B",]$Resp

mean(B) - 2*sd(B)
```

    ## [1] 78.23935

``` r
mean(B) + 2*sd(B)
```

    ## [1] 92.84065

Os intervalos calculados para as médias dos tratamentos são:

  - Tratamento \(A\) \(\to\) \([78.44, \; 90.04]\)
  - Tratamento \(B\) \(\to\) \([78.24, \; 92.84]\)

Ao estimar a média em cima das nossas amostras (que notamos são bem
pequenas), é mais interessante, e com menor erro, reportar um intervalo
de possíveis médias do que um único valor. De forma análoga ao intervalo
de confiança, nosso intervalo irá summarizar a variabilidade da nossa
variável aleatória.

Esses intervalos nos informam conjuntos de valores que encontram-se a
até dois desvios padrões da média amostral (tanto para baixo quanto
para cima). Se os nossos dados fossem normais (é impossível aferir a
normalidade pois o número de amostras é insuficiente), poderíamos supor
que os valores abarcados por esses intervalos representam cerca de 95%
da área abaixo da curva normal. Isso seria porque a média somada com
duas vezes o desvio padrão é igual ao percentil 97,5 e a média subtraída
de 2 vezes o desvio padrão é igual ao percentil 2,5. Assim, podemos
dizer que a média mais ou menos dois desvios padrões é o intervalo que
contém 95% dos dados da amostra. Logo, os intervalos estimariam quase
toda a variação possível para as médias, o que é útil para apresentar a
dispersão dos dados dos tratamentos.

# Question 2

Calcule os seguintes intervalos: 

Qual é a utilidade de cada um destes intervalos? Interprete-os. Faça
suposições que achar necessárias. Com base neste intervalo decida se a
média do tratamento B é maior que a de A.

``` r
#interval A
mean(A) - 2*sd(A)/sqrt(length(A))
```

    ## [1] 82.40474

``` r
mean(A) + 2*sd(A)/sqrt(length(A))
```

    ## [1] 86.07526

``` r
#interval B
mean(B) - 2*sd(B)/sqrt(length(B))
```

    ## [1] 83.23133

``` r
mean(B) + 2*sd(B)/sqrt(length(B))
```

    ## [1] 87.84867

``` r
#interval difference
d_bar = mean(B) - mean(A)

d_bar - 2*sqrt((sd(A)^2 + sd(B)^2)/10)
```

    ## [1] -1.64926

``` r
d_bar + 2*sqrt((sd(A)^2 + sd(B)^2)/10)
```

    ## [1] 4.24926

Os intervalos calculados para os tratamentos são:

  - Tratamento \(A\) \(\to\) \([82.40, \; 86.08]\)
  - Tratamento \(B\) \(\to\) \([83.23, \; 87.85]\)
  - Diferença \(A\) e \(B\) \(\to\) \([-4.25, \; 1.65]\)

Nesse exercício, ao dividir o desvio padrão pela raiz do número de
variáveis, temos então o erro padrão da média. O erro padrão é mais
apropriado para se utilizar para os intervalos, pois ele mede a provável
diferença da média estimada para a média populacional. O desvio padrão é
apenas a dispersão dos dados em torno da média.

Intervalos de confiança são uteis para construirmos um conjunto de
valores em que temos quase certeza que o valor real do estimador de
interesse (média, mediana, diferença entre as médias etc) está contido
nesse conjunto. O intervalo de confiança permite que observemos tanto o
efeito do tamanho amostral como da incerteza associada a nossa
estimativa, uma vez que ambos afetam o tamanho do intervalo.

Para o primeiro caso, assumindo que o tamanho amostral dos tratamentos A
e B são representativos e que foram amostradas de forma aleatória e
independente, podemos construir nossos intervalos de confiança. Vamos
assumir também uma distribuição normal para esses dados. Usando um nível
de confiança de cerca de 95% (dois desvios padrões em uma distribuição
normal), observamos que o tamanho do intervalo de confiança para o
tratamento A é menor do que o do tratamento B. Isso já é um indicativo
de que o tratamento B tem valores com maior variação se comparado ao
tratamento A. Além disso, o intervalo de confiança do tratamento A é
menor, fazendo com que ele seja mais confiável. Logo, esses intervalos
são úteis para saber o quão confiável é uma estimativa pontual (média
amostral, por exemplo) com relação ao valor real dessa estimativa (média
populacional, por exemplo), justamente por indicar um conjunto de
valores em que o valor real pode estar contida.

Para o segundo caso, estamos calculando um intervalo para a diferença
entre as médias (\(\bar{d}\)) dos tratamentos. Assumindo uma amostragem
aleatória e independente, uma variância igual em ambas as populações e
que essa população segue uma distribuição t (devido ao baixo \(n\)
amostral), podemos dizer se a diferença entre as médias de ambos os
tratamentos é ou não significativa por meio de um intervalo de
confiança. Como o intervalo calculado para a diferença entre as médias
inclui o valor zero (nenhuma diferença entre as médias), podemos supor
que a diferença entre essas médias não são estatisticamente diferentes,
portanto não podemos supor que a média do tratamento \(B\) é realmente
maior do que a do tratamento \(A\).

# Exercício 3

Seja \(\mu_D = \mu_A - \mu_B\) verdadeira diferença entre as médias dos
tratamentos \(A\) e \(B\). Vamos agora obter o intervalo de confiança
bootstrap para \(\mu_D\). Para isso, utilizando os recursos do
aplicativo R, realize os seguintes passos:

Com base neste intervalo decida se a média do tratamento B é maior que a
de A.

``` r
#calculate
d <- mean(A) - mean(B)

s_d <- sqrt((var(A) + var(B))/10) #s_d

#Boostrap function
ex3 <- function(A, B) {
  resample_A <- sample(A, replace = TRUE)
  resample_B <- sample(B, replace = TRUE)
  
  d_b <- mean(resample_A) - mean(resample_B)
  
  s_d_b <- sqrt((var(resample_A) + var(resample_B))/10)
  
  t_b <- (d_b - d)/s_d_b
  
  return(t_b)
}

#repeat bootstrap 1000 times and get t_b distribution
set.seed(1)
t_b <- vector()
for (i in seq(1:1000)) {
  t_b <- append(t_b, ex3(A,B))
}

#Percentiles
percentis = quantile(t_b, c(.025, .975)) 

#Bootstrap confidence intervals
d + percentis[1]*s_d
```

    ##      2.5% 
    ## -4.284031

``` r
d + percentis[2]*s_d
```

    ##    97.5% 
    ## 1.896296

O intervalo de confiança bootstrap é: \([-4.28, \; 1.90)].\)

Dado que esse intervalo inclui o valor zero (nulo), podemos supor que a
diferença entre as médias não são estatisticamente significantes. Logo,
temos que a média do tratamento B não é necessariamente maior do que a
do tratamento A quando observamos o intervalo da diferença entre as
médias calculado por meio de bootstrap.

\#Exercício 4

Considere agora os dados apresentados no Anexo 2.

Há interesse em conhecer o verdadeiro valor da pulsação média (\(\mu\))
de estudantes em repouso. Com base nos dados do Anexo 2, construa um
intervalo de confiança para \(\mu\) com coeficiente de \(95\%\) de
confiança. Qual é o comprimento do intervalo? Qual é a margem de erro
desse intervalo?

``` r
dadosPulse <- read.csv2("Pulse.csv")

margem_erro = 1.96*sd(dadosPulse$P1)/sqrt(length(dadosPulse$P1))

CI_lower = mean(dadosPulse$P1) - margem_erro
CI_lower
```

    ## [1] 70.62

``` r
CI_upper = mean(dadosPulse$P1) + margem_erro
CI_upper
```

    ## [1] 75.11913

``` r
CI_upper - CI_lower
```

    ## [1] 4.499128

``` r
margem_erro
```

    ## [1] 2.249564

Assumindo uma distribuição normal para os dados de pulso dos estudantes
em repouso, podemos usar o valor de \(1.96\) na tabela z que corresponde
a área de \(95\%\) abaixo da curva normal.

O intervalo calculado foi: \([70.62, \; 75.12]\), unidade em
batimentos/min.

O  deste intervalo é de cerca de \(4.5\) batimentos/min e apresenta uma 
cerca de \(2.25\) batimentos/min.

# Question 5

Suponha que 100 experimentos independentes sejam realizados e que o
verdadeiro valor da pulsação média (\(\mu\)) de estudantes em repouso
seja de \(72\) batimentos/min. Usando o aplicativo R, explore os
recursos da library  e encontre intervalos de \(95\%\) de confiança para
\(\mu\) em amostras de tamanho \(92\). Em sua simulação, em quantos
experimentos o intervalo obtido incluiu o verdadeiro valor de \(\mu\)?
Em quantos experimentos é esperado que o intervalo inclua o verdadeiro
valor de \(\mu\)?

Rodando vária vezes o seguinte comando:

``` r
library(RcmdrPlugin.TeachingDemos)
```

    ## Loading required package: rgl

    ## Loading required package: TeachingDemos

    ## Loading required package: tkrplot

    ## Loading required package: tcltk

    ## Registered S3 methods overwritten by 'lme4':
    ##   method                          from
    ##   cooks.distance.influence.merMod car 
    ##   influence.merMod                car 
    ##   dfbeta.influence.merMod         car 
    ##   dfbetas.influence.merMod        car

    ## 
    ## Attaching package: 'RcmdrPlugin.TeachingDemos'

    ## The following objects are masked from 'package:TeachingDemos':
    ## 
    ##     run.cor.examp, slider

``` r
ci.examp(mean.sim = 72, sd = 11, n = 92, reps = 100, conf.level = 
           0.95, method = "t")
```

![](List1_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

Em 95 experimentos o valor da média populacional foi incluído. É
esperado que em \(95\) dos \(100\) experimentos os intervalos de
confiança calculados para cada uma das amostragens apresentem o valor
da média populacional (\(\mu\)) dentro de seus limites. Isso significa
que com um nível de confiança de \(95\%\), esperamos que a cada \(100\)
experimentos feitos e seus intervalos calculados, \(95\) deles
apresentem o valor da média populacional dentro de seus limites, e que
apenas \(5\) não apresentem esse valor dentro do intervalo. Na Figura
acima vemos a saída de uma das rodadas.

# Exercício 6

Diferentes pesquisadores adotaram os seguintes modelos estatísticos na
análise dos dados Pulse.  Considerando premissas clássicas (erros
independentes, normais, média \(0\) e variância constante) e usando os
recursos do aplicativo R, ajuste os modelos \(M1\), \(M2\), \(M3\) e
\(M4\). Apresente razões que poderiam ter levado cada pesquisador a
escolher tal modelagem dos dados. Interprete os coeficientes de
regressão. Comente os resultados (valores dos resíduos; significância
dos coeficientes; coeficiente de determinação (\(R^2\)); estatística F
(\(H_0: \beta’s=0 x H_1\): pelo menos um \(\beta\) não nulo). Qual
modelo você escolheria? Justifique. Nota: Veremos no curso, alternativas
de ajuste dos modelos \(M2\) e \(M3\) via ANOVA e ANCOVA.

``` r
P1 <- dadosPulse$P1
P2 <- dadosPulse$P2

#Ajuste do modelo M1
#y=b0+b1P1c+e
P1c<-P1-mean(P1)
plot(P2~P1c)
```

![](List1_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

``` r
m1 <- lm(P2~P1c,dadosPulse)
summary(m1)
```

    ## 
    ## Call:
    ## lm(formula = P2 ~ P1c, data = dadosPulse)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -20.477  -8.434  -5.168   4.314  41.178 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  80.0000     1.4114  56.682  < 2e-16 ***
    ## P1c           0.9568     0.1289   7.422 6.22e-11 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 13.54 on 90 degrees of freedom
    ## Multiple R-squared:  0.3797, Adjusted R-squared:  0.3728 
    ## F-statistic: 55.09 on 1 and 90 DF,  p-value: 6.218e-11

``` r
names(m1)
```

    ##  [1] "coefficients"  "residuals"     "effects"       "rank"         
    ##  [5] "fitted.values" "assign"        "qr"            "df.residual"  
    ##  [9] "xlevels"       "call"          "terms"         "model"

``` r
m1$coefficients
```

    ## (Intercept)         P1c 
    ##  80.0000000   0.9567994

``` r
plot(m1$fitted.values,m1$residuals)
lines(lowess(m1$fitted.values,m1$residuals),col="red")
```

![](List1_files/figure-gfm/unnamed-chunk-7-2.png)<!-- -->

``` r
plot(P2~P1c)
abline(m1)
```

![](List1_files/figure-gfm/unnamed-chunk-7-3.png)<!-- -->

``` r
#Ajuste do modelo M2
#y=b0+b2Ran+e
Ran <- dadosPulse$Ran

plot(P2~Ran)
```

![](List1_files/figure-gfm/unnamed-chunk-7-4.png)<!-- -->

``` r
plot(P2~factor(Ran))
```

![](List1_files/figure-gfm/unnamed-chunk-7-5.png)<!-- -->

``` r
m2<-lm(P2~Ran)
summary(m2)
```

    ## 
    ## Call:
    ## lm(formula = P2 ~ Ran)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -34.514 -10.316  -2.316   7.684  47.486 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  112.713      5.098  22.109  < 2e-16 ***
    ## Ran          -20.198      3.015  -6.699 1.77e-09 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 14.04 on 90 degrees of freedom
    ## Multiple R-squared:  0.3327, Adjusted R-squared:  0.3253 
    ## F-statistic: 44.88 on 1 and 90 DF,  p-value: 1.768e-09

``` r
m2$coefficients #igual às médias dos grupos
```

    ## (Intercept)         Ran 
    ##    112.7128    -20.1985

``` r
mean(P2[Ran=="0"]) #intercept
```

    ## [1] NaN

``` r
mean(P2[Ran=="1"]) #intercept + Ran
```

    ## [1] 92.51429

``` r
plot(m2$fitted.values,m2$residuals)
lines(lowess(m2$fitted.values,m2$residuals),col="red")
```

![](List1_files/figure-gfm/unnamed-chunk-7-6.png)<!-- -->

``` r
plot(P2~Ran)
abline(m2)
```

![](List1_files/figure-gfm/unnamed-chunk-7-7.png)<!-- -->

``` r
#Ajuste do modelo M3
#y=b0+b1P1c+b2Ran+e

library(car)
```

    ## Loading required package: carData

``` r
Ran <- recode(Ran,"1='1';2='0'")
Ran
```

    ##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0
    ## [39] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    ## [77] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

``` r
plot(P2~P1c, pch=23, bg=c('red', 'blue')[factor(Ran)])
```

![](List1_files/figure-gfm/unnamed-chunk-7-8.png)<!-- -->

``` r
m3<-lm(P2~P1c+Ran)
summary(m3)
```

    ## 
    ## Call:
    ## lm(formula = P2 ~ P1c + Ran)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -25.3037  -3.9749  -0.2817   3.1931  29.6459 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) 72.72504    1.30162  55.873  < 2e-16 ***
    ## P1c          0.91247    0.09366   9.743 1.09e-15 ***
    ## Ran         19.12274    2.11209   9.054 2.90e-14 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 9.822 on 89 degrees of freedom
    ## Multiple R-squared:  0.6771, Adjusted R-squared:  0.6698 
    ## F-statistic: 93.31 on 2 and 89 DF,  p-value: < 2.2e-16

``` r
m3$coefficients
```

    ## (Intercept)         P1c         Ran 
    ##  72.7250440   0.9124706  19.1227414

``` r
plot(m3$fitted.values,m3$residuals)
lines(lowess(m3$fitted.values,m3$residuals),col="red")
```

![](List1_files/figure-gfm/unnamed-chunk-7-9.png)<!-- -->

``` r
b0<-m3$coefficients[1]
b0
```

    ## (Intercept) 
    ##    72.72504

``` r
names(b0)<-NULL
b0
```

    ## [1] 72.72504

``` r
b1<-m3$coefficients[2]
names(b1)<-NULL
b2<-m3$coefficients[3]
names(b2)<-NULL

plot(P2~P1c, pch=23, bg=c('red', 'blue')[factor(Ran)])
abline(b0,b1, col="red")
abline((b0+b2),b1,col="blue")
```

![](List1_files/figure-gfm/unnamed-chunk-7-10.png)<!-- -->

``` r
#Ajuste do modelo M4
#y=b0+b1P1c+b2Ran+b3(P1c*Ran)+e
P1cRan<-P1c*Ran
plot(P2~P1c, pch=23, bg=c('red', 'blue')[factor(Ran)])
```

![](List1_files/figure-gfm/unnamed-chunk-7-11.png)<!-- -->

``` r
m4<-lm(P2~P1c+Ran+P1cRan)
summary(m4)
```

    ## 
    ## Call:
    ## lm(formula = P2 ~ P1c + Ran + P1cRan)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -27.0252  -4.0728  -0.5624   2.8070  29.0471 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  72.6966     1.3045  55.729  < 2e-16 ***
    ## P1c           0.8490     0.1216   6.984 5.22e-10 ***
    ## Ran          19.0829     2.1165   9.016 3.80e-14 ***
    ## P1cRan        0.1570     0.1912   0.821    0.414    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 9.84 on 88 degrees of freedom
    ## Multiple R-squared:  0.6796, Adjusted R-squared:  0.6686 
    ## F-statistic: 62.21 on 3 and 88 DF,  p-value: < 2.2e-16

``` r
m4$coefficients
```

    ## (Intercept)         P1c         Ran      P1cRan 
    ##  72.6965672   0.8489790  19.0828811   0.1570483

``` r
plot(m4$fitted.values,m4$residuals)
lines(lowess(m4$fitted.values,m4$residuals),col="red")
```

![](List1_files/figure-gfm/unnamed-chunk-7-12.png)<!-- -->

``` r
b0<-m4$coefficients[1]
b0
```

    ## (Intercept) 
    ##    72.69657

``` r
names(b0)<-NULL
b0
```

    ## [1] 72.69657

``` r
b1<-m4$coefficients[2]
names(b1)<-NULL
b2<-m4$coefficients[3]
names(b2)<-NULL
b3<-m4$coefficients[4]
names(b3)<-NULL
plot(P2~P1c, pch=23, bg=c('red', 'blue')[factor(Ran)])
abline(b0,b1, col="red")
abline((b0+b2),(b1+b3),col="blue")
```

![](List1_files/figure-gfm/unnamed-chunk-7-13.png)<!-- -->

### Modelo 1

Esse é um modelo linear bem simples e que assume apenas um preditor
(\(P1c\)) para a variável de resposta (\(Y\)). Podemos observar no
modelo que quando o valor de \(P1\) for igual a média, teremos que a
variável resposta receberá o valor do intercepto (coeficiente linear ou
\(\beta_0\)) do nosso modelo. Quando fazemos esse ajuste, descobrimos
\(\beta_0 = 80\), logo um estudante que possui o valor de \(P1\) igual a
média de P1 – zerando assim o termo \(\beta_1 \cdot P1c\) - terá como
variável resposta o valor de 80 batimentos/min. Esse valor estimado para
o coeficiente linear (\(\beta_0\)) é, também, significante
estatisticamente, dado que o seu valor-p (\(2 \cdot 10^{-16}\)) ficou
bem abaixo do valor crítico de \(0.1\%\). Além do coeficiente linear, a
estimativa de \(0.9558\) para o coeficiente angular (\(\beta_1\)) também
apresenta significância estatística (p-valor = \(6.22 \cdot 10^{-11}\)).
O valor desse coeficiente nos mostra que a cada aumento de uma unidade
em \(P1c\) o valor da média de \(Y\) será incrementado em \(0.9558\)
unidades.

Embora os parâmetros do modelo estejam bem ajustados, o coeficiente de
regressão linear (\(R^2\)) é baixo (\(0.3797\)). Isso significa que
cerca de \(38\%\) da variação da variável resposta (\(Y\)) pode ser
explicada por nossa variável explicativa (\(P1c\)), logo existem
diferenças relevantes entre os valores observados (\(Y\)) e os usados
para ajustar o modelo (\(P1c\)). Olhando para a dispersão dos resíduos,
observamos um padrão aleatório, indicando que apesar do baixo valor do
coeficiente de regressão, este modelo representa bem os dados. Por fim,
temos que o nosso teste F apresenta um valor abaixo
(\(6.218 \cdot 10^{-11}\)) do valor crítico, indicando que o nosso
modelo ajustasse melhor aos nossos dados do que um modelo sem variáveis
explicativas.

### Modelo 2

Esse modelo linear assume apenas um preditor (\(Ran\)) que pode assumir
dois valores: \(0\) (repouso) e \(1\) (corrida). Logo, sempre que
\(Ran = 0\) (estudante não foi submetido a corrida de 1 minuto na
esteira), teremos em nosso modelo que a variável resposta \(Y\) será
igual ao coeficiente linear \(\beta_0\), estimado com um valor de
\(72.316\) de acordo com os nossos dados. O valor para esse coeficiente
linear é estatisticamente significante (\(2 \cdot 10^{-16}\)),
adequando-se bem ao modelo. Quando o estudante é submetido a corrida
(\(Ran = 1\)) observamos que o valor do coeficiente linear é
incrementado em \(20.198\), sendo esse o valor estimado para o
coeficiente angular (\(\beta_1\)) de nosso modelo. Assim como o
coeficiente anterior, este também apresentou significância estatísticas
para o nosso modelo. O coeficiente de regressão linear (\(R^2\))
apresenta um valor baixo: \(0.3327\). Logo, cerca de \(33\%\) da
variação da variável resposta (\(Y\)) pode ser explicada pela variável
explicativa (\(Ran\)). A dispersão dos residuos, apesar do baixo \(R^2\)
apresenta um padrão disperso, nos informando que este modelo representa
bem os nossos dados. Por fim, observamos que a estatística F também
apresenta um valor (\(1.768 \cdot 10^{-09}\)) abaixo do p-crítico.
Permitindo que rejeitemos a hipótese nula de que um modelo sem variáveis
explicativas adequam-se melhor aos dados.

### Modelo 3

O modelo 3 é um modelo aditivo, levando em conta as variáveis
explicativas presentes tanto no modelo 1 (\(P1c\)) quanto no modelo 2
(\(Ran\)). O caso em que tanto o \(\beta_1\) e o \(\beta_2\) assumem o
valor zero, faz com que a variável resposta \(Y\) assuma o valor do
coeficiente linear \(\beta_0\). O valor estimado para esse parâmetro foi
de \(72.72504\), sendo também estatisticamente significante
(\(2 \cdot 10^{-16}\)) quando diante do valor crítico. Assumindo o caso
em que o estudante não foi selecionado para correr na esteira
(\(Ran = 0\)), o valor da variável resposta será a soma do coeficiente
linear com o termo \(\beta_1 \cdot P1c\),tendo sido o coeficiente
\(\beta_1\) estimado em \(0.91247\) de acordo com os dados fornecidos ao
nosso modelo.

O caso contrário é quando o estudante correu na esteira (\(Ran = 1\)),
porém a sua medida de \(P1\) é igual a média de \(P1\)
(\(P1c = P1 – média (P1)\)), zerando o termo \(\beta_1*P1c\) e
fazendo com que o valor da variável resposta seja a soma entre o
coeficiente linear e o termo \(\beta_2 \cdot Ran\), sendo que o
coeficiente \(\beta_2\) foi estimado com um valor de \(19.12274\). Ambos
os coeficientes \(\beta_1\) e \(\beta_2\) são estatisticamente
significantes (\(1.09\cdot 10^{-15}\) e \(2.90 \cdot 10^{-14}\)) diante
do valor crítico estipulado para o teste t.

Dito isso, temos nesse caso que conseguimos traçar duas retas para
explicarem os nossos dados. Uma reta que adequasse bem ao grupo de
estudantes que não correram (reta vermelha) assim como aqueles que
correram (reta azul).

Esse modelo apresenta \(R^2 = 0.6771\). Isso significa podemos explicar
cerca de \(68\%\) da variação da variável resposta (\(Y\)) pelas
variáveis explicativas \(P1c\) e \(Ran\). Além disso, olhando para a
dispersão dos resíduos, elas parecem seguir um padrão aleatório que
indica que nosso modelo não possui nenhum viés que possa estar
interferindo na predição da variável resposta (\(Y\)). Por fim, a
estatística F apresenta um p-valor de \(2.2 \cdot 10^{-16}\), sendo
abaixo do valor crítico, podemos rejeitar a hipótese nula de que um
modelo sem variáveis explicativas é mais adequado aos dados.

### Modelo 4

Esse modelo é do tipo integrativo. Temos duas variáveis explicativas
(\(P1c\) e \(Ran\)) e a interação entre essas duas variáveis
(\(P1c \cdot Ran\)) formando a terceira variável explicativa. O caso em
que todos os termos são nulos faz com que a variável resposta (\(Y\))
assuma o valor estimado do coeficiente linear (\(\beta_0 = 72.6966\)),
tendo esse significância estatística (\(2 \cdot 10^{-16}\)) diante do
p-crítico de \(5\%\) do teste t. Para os casos das variáveis
explicativas \(P1c\) e \(Ran\), este modelo comporta-se como o modelo 3,
porém com diferenças nos valores estimados dos coeficientes que
acompanham essa variáveis (\(\beta_1 = 0.8490\) e
\(\beta_2 = 19.0829\)). Ambos os coeficientes são estatisticamente
significantes. O caso da terceira variável explicativa
(\(P1c \cdot Ran\)) é interessante, pois o valor estimado de seu
coeficiente (\(\beta_3 = 0.1570\)) não é estatisticamente significante
(\(p-valor = 0.414\)) para o nosso modelo. Isso significa que esta
variável explicativa não agrega informação ao nosso modelo, portanto,
sendo dispensável para a predição do valor observado. O coeficiente de
regressão linear (\(R^2\)) deste modelo não aumenta muito se comparado
ao do modelo anterior. O valor encontrado de \(0.6796\) para o
coeficiente de regressão linear indica que cerca de \(68\%\) do erro da
variável resposta (\(Y\)) pode ser explicada pelas variáveis
explicativas. Além disso, observando os comportamentos dos resíduos, é
possível traçar uma distribuição aleatória. Permitindo a inferência de
que não existem vieses aparentes em nosso modelo. Por fim, o valor da
estatística F (\(2.2 \cdot 10^{-16}\)) fica abaixo do p-crítico de
\(5\%\), permitindo que rejeitemos a hipótese nula de que um modelo sem
variáveis explicativas seria mais adequado aos dados.

### Comparando os modelos

O modelo mais adequado seria o modelo 3. Tanto o modelo 1 quanto 2
apresentam limitações, uma vez que consideram apenas uma variável
explicativa, fazendo com que eles não sejam capazes de explicar bem o
erro apresentado pela variável resposta (\(Y\)). Isso pode ser observado
de acordo com os baixos valores do coeficiente de regressão linear para
ambos os modelos. A combinação desses dois modelos no modelo 3 (modelo
aditivo) melhora bastante o coeficiente de regressão linear, assim como
podemos observar um padrão aleatório na distribuição dos resíduos,
demonstrando que aparentemente não existem vieses sobre o nosso modelo.
Além disso, podemos observar que esse modelo adequasse bem a situação de
corrida (\(Ran=1\)) qual os estudantes foram expostos. Por fim, apesar
do modelo 4 apresentar um pequeno ganho com relação ao coeficiente de
regressão linear a despeito do modelo 3, observamos que a variável
explicativa \(P1c \cdot Ran\) não agrega informação a modelagem. Isso
pode ser observado pelo alto valor-p que o coeficiente \(\beta_3\)
apresentou para sua estimativa, superando o p-crítico e fornecendo
evidências para que possamos descartar este termo de nosso modelo.

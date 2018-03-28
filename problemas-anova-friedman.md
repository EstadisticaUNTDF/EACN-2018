# Práctico de Pruebas no paramétricas para muestras relacionadas





Es posible realizar el equivalente no paramétrico de un anova simple con bloques.
Hay al menos dos formas de hacerlo en *R*. Una es con la función 
`friedman.test()` del paquete `stats`. Tiene una interfaz de vectores y otra
de formula. La de vectores tiene tres argumentos, `y` la variable de respuesta,
`groups` la variable tratamiento, y `blocks` los bloques. La interfaz de formula
usa la ya conocida forma `y ~ groups` pero para indicar los bloques usa una 
barra recta de esta manera `y ~ groups | blocks`.




```r
pasto
```

```
##    Parcela Pasto.1 Pasto.2 Pasto.3 Pasto.4
## 1        1   14.00   10.50    7.00    3.50
## 2        2   14.00    7.00   10.50    3.50
## 3        3   10.50    5.25    5.25   14.00
## 4        4   10.50    3.50    7.00   14.00
## 5        5   14.00    7.00    3.50   10.50
## 6        6    7.00    7.00    7.00   14.00
## 7        7    3.50   10.50    7.00   14.00
## 8        8    7.00   14.00    3.50   10.50
## 9        9   12.25    3.50    7.00   12.25
## 10      10   14.00    3.50   10.50    7.00
## 11      11   14.00    7.00   10.50    3.50
## 12      12   12.25    3.50    7.00   12.25
```

```r
pasto <- gather(pasto, key = "Pasto", value = "performance", -Parcela)

friedman.test(performance ~ Pasto | Parcela, data = pasto)
```

```
## 
## 	Friedman rank sum test
## 
## data:  performance and Pasto and Parcela
## Friedman chi-squared = 8.0973, df = 3, p-value = 0.04404
```

```r
out <- pasto %$% friedman(Parcela, Pasto, performance, group = FALSE, console = TRUE)
```

```
## 
## Study: performance ~ Parcela + Pasto 
## 
## Pasto,  Sum of the ranks
## 
##         performance  r
## Pasto.1        38.0 12
## Pasto.2        23.5 12
## Pasto.3        24.5 12
## Pasto.4        34.0 12
## 
## Friedman's Test
## ===============
## Adjusted for ties
## Critical Value: 8.097345
## P.Value Chisq: 0.04404214
## F Value: 3.192198
## P.Value F: 0.03621547 
## 
## Post Hoc Analysis
## 
## Comparison between treatments
## Sum of the ranks
## 
##                   difference pvalue signif.    LCL   UCL
## Pasto.1 - Pasto.2       14.5 0.0149       *   3.02 25.98
## Pasto.1 - Pasto.3       13.5 0.0226       *   2.02 24.98
## Pasto.1 - Pasto.4        4.0 0.4834          -7.48 15.48
## Pasto.2 - Pasto.3       -1.0 0.8604         -12.48 10.48
## Pasto.2 - Pasto.4      -10.5 0.0717       . -21.98  0.98
## Pasto.3 - Pasto.4       -9.5 0.1017         -20.98  1.98
```

La función imprime el resultado en la pantalla. Pero si no lo guardamos no es
posible seguir trabajando con él. Por eso, al guardarlo, podemos ver la misma
información que vemos arribal y algunos datos extra con la diferencia mínima
significativa.


```r
out
```

```
## $statistics
##      Chisq Df    p.chisq        F DFerror        p.F  t.value      LSD
##   8.097345  3 0.04404214 3.192198      33 0.03621547 2.034515 11.48168
## 
## $parameters
##       test name.t ntr alpha
##   Friedman  Pasto   4  0.05
## 
## $means
##         performance rankSum      std  r Min  Max    Q25    Q50    Q75
## Pasto.1   11.083333    38.0 3.526415 12 3.5 14.0 9.6250 12.250 14.000
## Pasto.2    6.854167    23.5 3.375140 12 3.5 14.0 3.5000  7.000  7.875
## Pasto.3    7.145833    24.5 2.413170 12 3.5 10.5 6.5625  7.000  7.875
## Pasto.4    9.916667    34.0 4.372348 12 3.5 14.0 6.1250 11.375 14.000
## 
## $comparison
##                   difference pvalue signif.    LCL   UCL
## Pasto.1 - Pasto.2       14.5 0.0149       *   3.02 25.98
## Pasto.1 - Pasto.3       13.5 0.0226       *   2.02 24.98
## Pasto.1 - Pasto.4        4.0 0.4834          -7.48 15.48
## Pasto.2 - Pasto.3       -1.0 0.8604         -12.48 10.48
## Pasto.2 - Pasto.4      -10.5 0.0717       . -21.98  0.98
## Pasto.3 - Pasto.4       -9.5 0.1017         -20.98  1.98
## 
## $groups
## NULL
## 
## attr(,"class")
## [1] "group"
```

Podemos usar los datos que nos da para calcular a mano el valor crítico con la 
distribución *q*:


```r
alpha <- 0.05
c <- nrow(out$means)
Z <- abs(qnorm(alpha/(c*(c-1))))
r <- unique(out$means$r)
VC <- Z * sqrt(r*c*(c+1)/6)
VC
```

```
## [1] 16.6858
```


Con el paquete

```r
library(PMCMR)
```

```
## PMCMR is superseded by PMCMRplus and will be no longer maintained. You may wish to install PMCMRplus instead.
```

```
## 
## Attaching package: 'PMCMR'
```

```
## The following object is masked from 'package:agricolae':
## 
##     durbin.test
```

```r
posthoc.friedman.nemenyi.test(performance ~ Pasto | Parcela, data = pasto)
```

```
## 
## 	Pairwise comparisons using Nemenyi multiple comparison test	
##              with q approximation for unreplicated blocked data 
## 
## data:  performance and Pasto and Parcela 
## 
##         Pasto.1 Pasto.2 Pasto.3
## Pasto.2 0.10    -       -      
## Pasto.3 0.14    1.00    -      
## Pasto.4 0.92    0.34    0.44   
## 
## P value adjustment method: none
```


## Problemas

1. Un ecólogo desea determinar si cuatro índices de importancia relativa empleados
para análisis de la dieta evalúan en forma similar la importancia relativa de
las presas. Para ello utilizó datos de dieta del lobo marino, calculó todos
los índices y los expresó en porcentaje. ¿Son equivalentes estos índices para
estudiar la importancia relativa de las presas?. Los resultados obtenidos
fueron:


--------------------------------------------------------
   Presa      Indice.1   Indice.2   Indice.3   Indice.4 
------------ ---------- ---------- ---------- ----------
  Merluza       34.6      35.09      34.43       35.1   

   Pulpo       20.24      20.12      20.46      19.71   

  Calamar      22.93      22.24      23.75      21.96   

   Raneya       5.48       5.16       4.89       4.02   

  Anchoíta      3.39       3.54       3.19       2.84   

 Nototenia      2.39       2.43       3.59       2.94   

 Pampanito      6.68       6.47       5.99       6.47   

  Abadejo       0.1        0.71       0.9        1.76   

 Cangrejos      0.7        1.82       0.7        1.27   

 Langostino     1.4        1.92       1.6        0.78   

   Salmón       1.5        0.3        0.3        1.27   

 Chanchita      0.6        0.2        0.2        1.86   
--------------------------------------------------------

Table: Porcentaje de consumo de presas según cuatro índices.




2. En un estudio veterinario se desea determinar la efectividad de distintas drogas
para minimizar el nivel de parasitosis intestinales. Para ello se tomaron al
azar camadas de ratones y a diferentes individuos de cada camada se les aplicó
al azar una de las drogas. Posteriormente, se alimentó a los ratones con comida
infestada y luego de un mes fueron sacrificados, realizándose la necropsia para
determinar el número de helmintos hallados en el intestino. ¿Existe un efecto de
las drogas sobre el nivel de parasitosis de los ratones? Los resultados fueron:


```r
parasitosis %>% pander(caption = "Número de helmitos en intestino de ratones 
                       tratados con cuatro antiparasitarios distintos.")
```


------------------------------------------------
 Camada   Droga.1   Droga.2   Droga.3   Droga.4 
-------- --------- --------- --------- ---------
   1        20        13        23        26    

   2        22        12        23        15    

   3        31        24        36        65    

   4        18         9        10        62    

   5        25        23        50        70    

   6        17         7        25        60    

   7        29        11        28        68    

   8        26        21        15        15    

   9        26        23        51        38    

   10       29        15        31        13    

   11       24        15        45        46    

   12       19         6        24        42    
------------------------------------------------

Table: Número de helmitos en intestino de ratones 
                       tratados con cuatro antiparasitarios distintos.





3. Un ingeniero agrónomo desea determinar si cuatro fertilizantes tienen igual
efecto en la producción de soja. Para ello seleccionó al azar 12 parcelas
con características de suelo diferentes, aplicando al azar cada uno de los
fertilizantes en distintos sectores de iguales dimensiones de cada parcela.
La producción de soja en toneladas obtenida en cada parcela con cada tipo de
fertilizante fue:


```r
soja %>% pander(caption = "Rendimiento en toneladas por parcela en 
                parcelas fertilizadas con cuatro fertilizantes.")
```


-----------------------------------------------------------------------------
 Parcela   Fertilizante.1   Fertilizante.2   Fertilizante.3   Fertilizante.4 
--------- ---------------- ---------------- ---------------- ----------------
    1           320              314              165              202       

    2           244              277              171              121       

    3           229              244              128              124       

    4           301              301              209              212       

    5           293              311              182              208       

    6           260              292              153              197       

    7           293              300              200              152       

    8           295              316              130              212       

    9           232              235              178              165       

   10           310              281              181              201       

   11           322              349              247              218       

   12           315              306              160              219       
-----------------------------------------------------------------------------

Table: Rendimiento en toneladas por parcela en 
                parcelas fertilizadas con cuatro fertilizantes.
¿Cuál fertilizante conviene utilizar?




## Problema 4

Un biólogo pesquero desea establecer si el descarte de especies asociadas (by-
catch) en la pesquería de merluza varía estacionalmente. Para ello realizó un
seguimiento de 12 barcos de la flota pesquera comercial, determinando para cada
uno de ellos el porcentaje en biomasa del descarte realizado en cada estación
del año. ¿Existe una variación estacional en el descarte realizado por la flota
merlucera? Sus resultados fueron:


```r
pesca %>% pander(caption = "Porcentaje de descarte en las cuatro estaciones.")
```


-----------------------------------------------
 Barco   Primavera   Verano   Otono   Invierno 
------- ----------- -------- ------- ----------
   1        32         25      43        43    

   2        27         16      30        38    

   3        27         30      38        37    

   4        26         31      51        52    

   5        28         32      52        44    

   6        21         23      41        38    

   7        21         21      44        48    

   8        24         37      41        46    

   9        33         29      45        54    

  10        27         23      45        41    

  11        35         22      44        43    

  12        31         35      43        44    
-----------------------------------------------

Table: Porcentaje de descarte en las cuatro estaciones.



# Pruebas para varias muestras pareadas





Existen diversos tipos de pruebas no paramétricas para comparar k muestras
relacionadas. Se considera un bloque a una unidad experimental homogénea que
puede ser particionada en k elementos o una serie de k unidades experimentales
que se encuentran vinculadas entre sí de tal forma que la respuesta de cada una
de ellas a un tratamiento dado no es independiente de las demás. Un bloque puede
estar constituido por diferentes animales de una misma camada (base genética
común y diferente de cualquier otra camada), un mismo individuo sometido a k
tratamientos diferentes, una parcela de terreno dividida en k sub-parcelas
(idéntico tipo de suelo para las k-sub-parcelas), etc.

De esta manera, el diseño experimental subyacente a las pruebas no paramétricas
para k muestras relacionadas es el diseño de bloques al azar. Este diseño
consiste en comparar una serie de *c* tratamientos. Para ello, se toman *r*
bloques que son particionados en *c* partes y a cada una de ellas se le asigna
al azar cada uno de los *c* tratamientos.

Si los diferentes bloques utilizados fueran homogéneos entre sí, el diseño
experimental puede reducirse a un diseño análogo al del ANOVA de un factor de la
estadística paramétrica. La tabla básica de datos para estas pruebas no
paramétricas es de la forma:

|                  | Tratamientos |           |          |            |               |
|------------------|--------------|-----------|----------|------------|---------------|
| Bloques          | 1            | 2         | $\ldots$ | $c$        | Total de fila |
| 1                | $X_{11}$     | $X_{12}$  | $\ldots$ | $X_{1c}$   | $R_{1}$       |
| 2                | $X_{21}$     | $X_{22}$  | $\ldots$ | $X_{2c}$   | $R_{2}$       |
| $\vdots$         | $\vdots$     | $\vdots$  | $\ddots$ | $\vdots$   | $\vdots$      |
| $r$              | $X_{r1}$     | $X_{r2}$  | $\ldots$ | $X_{rc}$   | $R_{r}$       |
| Total de columna | $C_{1}$      | $C_{2}$   | $\ldots$ | $C_{c}$    | $N$           |

## Prueba de Friedman para varias muestras relacionadas


La prueba de Friedman es la versión no paramétrica del ANOVA de dos vías con una
única observación por celda cuando el diseño es el de bloques al azar.

En este caso, se asignan rangos dentro de cada bloque [$R(X_{ij})$] de
tal manera que la menor observación tiene el rango 1 y así sucesivamente hasta
llegar a la mayor observación que se corresponde con el rango *c*. En caso de
empates, se promedian los rangos correspondientes. Este procedimiento se realiza
en cada bloque, obteniéndose una tabla de rangos de la forma:

|                            | Tratamientos |             |          |                   |
|----------------------------|--------------|-------------|----------|-------------------|
| Bloques                    | 1            | 2           | $\ldots$ | c                 |
| 1                          | $R(X_{11})$  | $R(X_{12})$ | $\ldots$ | $R(X_{1c})$       |
| 2                          | $R(X_{21}$)  | $R(X_{22})$ | $\ldots$ | $R(X_{2c})$       |
| $\vdots$                   | $\vdots$     | $\vdots$    | $\ddots$ | $\vdots$          |
| r                          | $R(X_{r1})$  | $R(X_{r2})$ | $\ldots$ | $R(X_{rc})$       |
| Suma de rangos ($R_{j}$)   | $R_{1}$      | $R_{2}$     | $\ldots$ | $R_{c}$           |

### Estadístico


La prueba de Friedman presenta dos estadísticos diferentes ($\chi_{F}^{2}$ y
$F_{F}$). Estos estadísticos, calculados con la corrección por empates, se
obtienen como:

$$
{A_{1} = \sum_{i = 1}^{r}{\sum_{j = 1}^{c}\left\lbrack R\left( X_{ij} \right) \right\rbrack^{2}} }
\\{C_{1} = \frac{\text{rc}\left( c + 1 \right)^{2}}{4}}\\{\chi_{F}^{2} = \frac{\left( c - 1 \right)\sum_{j = 1}^{c}\left( R_{j} - \frac{r\left( c + 1 \right)}{2} \right)^{2}}{A_{1} - C_{1}}}\\{F_{F} = \frac{\left( r - 1 \right)\chi_{F}^{2}}{r\left( c - 1 \right) - \chi_{F}^{2}}}
$$

El $\chi_{F}^{2}$ se distribuye en forma aproximada según una $\chi^{2}$ con
$c - 1$ grados de libertad. Sin embargo, aún con muestras relativamente
grandes, esta aproximación no es buena. Por esta razón es preferible utilizar el
estadístico $F$ el cuál se distribuye aproximadamente según una distribución de
Fisher con $\nu_1=(c-1)$ y $\nu_2=(r-1)(c-1)$ grados de libertad.

### Supuestos


1.  Los *r* bloques son mutuamente independientes. Esto significa que los
    resultados obtenidos en un bloque no influencian los resultados de los otros
    bloques.

2.  Dentro de cada bloque se asignan los rangos a los resultados de los *c*
    tratamientos de acuerdo a algún criterio de interés.

### Hipótesis


$H_{0}$: los *c* tratamientos tiene idéntico efecto.

$H_{a}$: al menos uno de los *c* tratamientos presenta un efecto diferente de
los demás.

Los criterios de decisión para la prueba son:

Si $\chi_{F}^{2} \geq \chi_{c - 1;1 - \alpha}^{2}$ ó $F_{F} \geq F_{\nu_{1} =
\left( c - 1 \right);\nu_{2} = \left( r - 1 \right)\left( c - 1 \right);1 -
\alpha\ }$ entonces Rechazo $H_{0}$.

Si $\chi_{F}^{2} < \chi_{c - 1;1 - \alpha}^{2}$ ó $F_{F} < F_{\nu_{1} =
\left( c - 1 \right);\nu_{2} = \left( r - 1 \right)\left( c - 1 \right);1 -
\alpha\ }$ entonces No Rechazo $H_{0}$.

### Comparaciones múltiples


Si la prueba de Friedman resultó significativa, es pertinente realizar
contrastes para determinar cuáles son los tratamientos que difieren entre sí.
Para ello se realizan comparaciones de a pares entre los *c* tratamientos. Se
considera que dos tratamientos son significativamente diferentes si se verifica
la siguiente desigualdad:

$$
\left| R_{j} - R_{i} \right| \geq t_{\nu = \left( r - 1 \right)\left( c - 1 \right);1 - \alpha\backslash 2}\sqrt{\frac{2\left( rA_{1} - \sum_{j = 1}^{c}R_{j}^{2} \right)}{\left( r - 1 \right)\left( c - 1 \right)}}
$$

Otro método de contraste que es más sencillo de calcular, pero más conservativo
que el anterior, es el que se define con la siguiente desigualdad:

$$
\left| R_{j} - R_{i} \right| \geq \frac{q_{\infty;c;\alpha}}{\sqrt{2}}\sqrt{\frac{c(c + 1)}{6\ n}}
$$

Para ambos tipos de contrastes, α es el nivel de significación de la prueba y
debe ser el mismo que se empleó para la prueba de Friedman.

**Ejemplo.** En un estudio sobre diferentes métodos posibles para detener el
proceso de desertificación, se intenta evaluar si cuatro variedades de pasto son
igualmente efectivas para fijar el suelo. Para ello se seleccionaron al azar
distintas parcelas con diferentes niveles de desertificación y cada una de ellas
fue dividida en cuatro sectores. Cada sector fue plantado con una de las
variedades de pasto, realizándose esta asignación aleatoriamente. Luego de un
tiempo razonable se evaluó con una escala apropiada el porcentaje de suelo
cubierto por cada variedad de pasto, considerándose que cuanto mayor sea este
índice mejor es la *performance* de la variedad de pasto para fijar el suelo.

Los resultados obtenidos fueron:

| Parcela | Pasto 1 | Pasto 2 | Pasto 3 | Pasto 4 |
|---------|---------|---------|---------|---------|
| 1       | 14      | 10.5    | 7       | 3.5     |
| 2       | 14      | 7       | 10.5    | 3.5     |
| 3       | 10.5    | 5.25    | 5.25    | 14      |
| 4       | 10.5    | 3.5     | 7       | 14      |
| 5       | 14      | 7       | 3.5     | 10.5    |
| 6       | 7       | 7       | 7       | 14      |
| 7       | 3.5     | 10.5    | 7       | 14      |
| 8       | 7       | 14      | 3.5     | 10.5    |
| 9       | 12.25   | 3.5     | 7       | 12.25   |
| 10      | 14      | 3.5     | 10.5    | 7       |
| 11      | 14      | 7       | 10.5    | 3.5     |
| 12      | 12.25   | 3.5     | 7       | 12.25   |

Empleando la prueba de Friedman, los cálculos realizados pueden esquematizarse
como:

| Rangos             | PASTO1  | PASTO2 | PASTO3 | PASTO4 |
|--------------------|---------|--------|--------|--------|
| 1                  | 4       | 3      | 2      | 1      |
| 2                  | 4       | 2      | 3      | 1      |
| 3                  | 3       | 1.5    | 1.5    | 4      |
| 4                  | 3       | 1      | 2      | 4      |
| 5                  | 4       | 2      | 1      | 3      |
| 6                  | 2       | 2      | 2      | 4      |
| 7                  | 1       | 3      | 2      | 4      |
| 8                  | 2       | 4      | 1      | 3      |
| 9                  | 3.5     | 1      | 2      | 3.5    |
| 10                 | 4       | 1      | 3      | 2      |
| 11                 | 4       | 2      | 3      | 1      |
| 12                 | 3.5     | 1      | 2      | 3.5    |
| *r*                | 12      |        |        |        |
| *c*                | 4       |        |        |        |
| $A_1$              | 356.500 |        |        |        |
| $C_1$              | 300.000 |        |        |        |
| $R_j$              | 38.000  | 23.500 | 24.500 | 34.000 |
| $(R_j-r(c+1)/2)^2$ | 64.000  | 42.250 | 30.250 | 16.000 |
| $\chi^2_F$         | 8.097   |        |        |        |
| gl                 | 3       |        |        |        |
| Valor p            | 0.044   |        |        |        |
| $F_F$              | 3.192   |        |        |        |
| $\nu_1$            | 3       |        |        |        |
| $\nu_2$            | 33      |        |        |        |
| Valor p            | 0.036   |        |        |        |

En R:

Esta prueba puede realizarse en R. Existen dos funciones:

-   friedman.test() en el paquete stats, que viene por defecto con la
    instalación de R.

-   friedman() en el paquete agricolae, hay que instalar el paquete pero ofrece,
    además del test, las comparaciones entre tratamientos.

-   posthoc.friedman.conover.test() en el paquete PMCMR realiza la comparación
    de a pares usando la distribución *t*.

-   posthoc.friedman.nemeyi.test() en el paquete PMCMR realiza la comparación de
    a pares usando la distribución *q*, de .

En ambos casos los resultados de la prueba son iguales. Abajo está el resultado
de friedman()


```r
pasto <- gather(pasto, key = "Pasto", value = "performance", -Parcela)

pasto %$% friedman(Parcela, Pasto, performance, group = FALSE, console = TRUE)
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

Y aquí el resultado de `friedman.test()` :


```r
friedman.test(performance ~ Pasto | Parcela, data = pasto)
```

```
## 
## 	Friedman rank sum test
## 
## data:  performance and Pasto and Parcela
## Friedman chi-squared = 8.0973, df = 3, p-value = 0.04404
```

La función devuelve los dos tipos de estadísticos con su probabilidad asociada.
En ambos casos la probabilidad resulta menor a $\alpha$ por lo que se concluye
que existen diferencias significativas entre las especies de pasto. Entonces,
resulta de interés saber que pasto es el mejor. La función también nos da el
resultado del primer tipo de contraste, es decir del contraste *t*:


```r
library(PMCMR)

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


No nos da el segundo tipo de contraste, pero a partir de los datos que devuelve
la función resulta sencillo calcularlo.

Utilizando ambos tipos de contrastes los resultados son:

|             |        |   |      |           | 38     | 23.5   | 24.5   | 34     |
|-------------|--------|---|------|-----------|--------|--------|--------|--------|
| Contraste *t* |        |   | VC   | 11.481687 | PASTO1 | PASTO2 | PASTO3 | PASTO4 |
| t           | 2.035  |   | 38   | PASTO1    |        | S      | S      | ns     |
| gl          | 33     |   | 23.5 | PASTO2    | 14.5   |        | ns     | ns     |
| ES          | 5.643  |   | 24.5 | PASTO3    | 13.5   | 1      |        | ns     |
| VC          | 11.482 |   | 34   | PASTO4    | 4      | 10.5   | 9.5    |        |
|             |        |   |      |           |        |        |        |        |
|             |        |   |      |           | 38     | 23.5   | 24.5   | 34     |
| Contraste *q* |        |   | VC   | 16.685835 | PASTO1 | PASTO2 | PASTO3 | PASTO4 |
| Z           | 2.638  |   | 38   | PASTO1    |        | ns     | ns     | ns     |
| 1-α         | 0.996  |   | 23.5 | PASTO2    | 14.5   |        | ns     | ns     |
| ES          | 6.325  |   | 24.5 | PASTO3    | 13.5   | 1      |        | ns     |
| VC          | 16.686 |   | 34   | PASTO4    | 4      | 10.5   | 9.5    |        |

El método 1 de contrastes permite determinar que el Pasto 1 presenta una mayor
eficiencia para fijar el suelo que los Pastos 2 y 3, mientras que el resto de
las comparaciones resultan no significativas. En base a estos resultados, el
Pasto 1 sería la variedad a elegir para fijar los suelos en zonas
desertificadas.

Se puede resaltar que el método 2 de contrastes fue incapaz de detectar estas
diferencias.

# Ordenación en Espacios Reducidos

En la Ciencias Naturales, generalmente, se poseen varias variables por cada
objeto o unidad. Pero en un diagrama de dispersión es solo posible ver dos
dimensiones, como máximo se podrán ver tres. Cuando queremos ver cuáles son las
tendencias de variación en los objetos con respecto a todas las variables, estos
gráficos se quedan cortos. Podríamos ver cada para de combinaciones, pero
resulta tedioso y en general no es muy iluminador. Además, que podemos perdernos
algunas relaciones interesantes entre varias variables que se manifiestan en más
de dos dimensiones.

Lo métodos para ordenación en espacio reducido permiten extraer información
sobre la calidad de la proyección y el estudio de las relaciones tanto entre las
variables como entre objetos.

Existen varios métodos de ordenación resumidos en la tabla de abajo, más otros
no incluidos que no vamos a ver en este curso.

| Método                                                                                             | Distancia Preservada          | Variables                                                                                                                       |
|----------------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| Análisis de Componentes Principales                                                                | Distancia Euclídea            | Datos Cuantitativos, Relaciones lineales (cuidado con los doble-ceros)                                                          |
| Análisis de Coordenadas Principales, Escalamiento (multidimensional) métrico, escalamiento clásico | Cualquier medida de distancia | Cuantitativos, semicuantitativos, cualitativos, o mezclados                                                                     |
| Análisis de Correspondencias                                                                       | Distancia $\chi^{2}$        | No-negativos, datos cuantitativos dimensionalmente homogéneos o binarios; abundancia de especies, o datos de presencia/ausencia |

Los métodos de ordenación pueden usarse para delinear grupos de objetos cuando
la estructura de los datos no es continua (las variables si deben ser
continuas). En particular, la ordenación puede ser usada siempre para
complementar los análisis de agrupamientos. Esto es así porque mientras en
análisis de agrupamiento investiga las relacionas finas entre objetos; la
ordenación investiga la variabilidad entera de los datos y extrae los gradientes
generales.

En general, se usa la ordenación para estudiar las posiciones relativas de los
objetos en un espacio reducido, es decir pasar de un espacio multidimensional a
dos o tres dimensiones. Cuando la proyección de los datos en un espacio reducido
representa una gran proporción de la variabilidad las distancias entre los
objetos sean similares a la que existen en un espacio multidimensional. Cuando
las proyecciones no son tan eficientes, la distancia entre los objetos es menor
que en el espacio multidimensional. Se pueden dar dos casos: (1) que los objetos
estén a distancias *proporcionalmente* similares en los dos espacios, entonces
la proyección seguirá siendo útil (2) que las posiciones relativas de los
objetos cambien entre los dos espacios, entonces la proyección es inútil. Por lo
tanto, a veces es útil considera la ordenación aun cuando esta represente una
pequeña parte de la variación total.



## Análisis de componentes principales


Supongamos que tenemos una distribución multivariada normal, el primer eje
principal es la línea que atraviesa la mayor dimensión del elipsoide de densidad
que describe la densidad. De la misma manera, los siguientes ejes principales
(ortogonales entre sí, es decir en ángulo recto e incorrelados, y sucesivamente
más cortos) atraviesan las siguientes dimensiones del elipsoide
$p$-dimensional. Por lo tanto, pueden encontrarse un número $p$ de ejes
principales de una matriz de datos de $p$ variables.

Las relaciones entre las variables pueden representarse con una matriz cuadrada
$\mathbf{S}_{p \times p}$:

$$
\mathbf{S} = \begin{bmatrix}
\sigma_{11} & \sigma_{12} & \cdots & \sigma_{1p} \\
\sigma_{21} & \sigma_{22} & \cdots & \sigma_{2p} \\
 \vdots & \vdots & \ddots & \vdots \\
\sigma_{p1} & \sigma_{p2} & \cdots & \sigma_{pp} \\
\end{bmatrix}
$$

Donde la diagonal es la varianza de una variable y fuera de ellas se encuentran
las covarianzas

Los ejes principales de una matriz de dispersión $\mathbf{S}$ pueden
encontrarse resolviendo la ecuación:

$$
\left( \mathbf{S} - \lambda_{k}\mathbf{I} \right)\mathbf{u}_{k} = 0
$$

Cuya ecuación característica es:

$$
\left| \mathbf{S} - \lambda_{k}\mathbf{I} \right| = 0
$$

Se usa para computar los autovalores. Los autovectores $\mathbf{u}_{k}$
asociados a los $\lambda_{k}$ se encuentran poniendo los distintos valores de
$\lambda_{k}$ en la primera ecuación. Estos autovectores son los ejes
principales de la matriz de dispersión $\mathbf{S}$. Los componentes
principales tienen las siguientes propiedades:

1.  Dado que cualquier matriz de dispersión $\mathbf{S}$ es simétrica, sus
    ejes principales $u_{k}$ son ortogonales entre sí. Es decir, que
    representan direcciones linealmente independientes en el elipsoide de
    densidad de la distribución de objetos.

2.  Los autovalores $\lambda_{k}$ de una matriz de dispersión $\mathbf{S}$
    dan la cantidad de varianza que corresponde a cada uno de los sucesivos ejes
    principales.

3.  Dadas las dos primeras propiedades, el análisis de componentes principales
    puede resumir, en unas pocas dimensiones, la mayor parte de la variabilidad
    de una matriz de dispersión con un gran número de variables. También provee
    de una medida de la variabilidad explicada por cada uno de esos pocos ejes
    principales independientes.

Un ejemplo sencillo usando solo dos variables, algo que en la práctica nunca
sucede, pero resulta útil como ejemplo

$Y = \begin{bmatrix} 2 & 1 \\ 3 & 4 \\ 5 & 0 \\ 7 & 6 \\ 9 & 2 \\
\end{bmatrix}$ luego de centrar con las medias de las columnas $\lbrack y
- \overline{y} \rbrack = \begin{bmatrix}  - 3.2 & - 1.6 \\  -
2.2 & 1.4 \\  - 0.2 & - 2.6 \\ 1.8 & 3.4 \\ 3.8 & - 0.6 \\ \end{bmatrix}$

Calculando la matriz de dispersión:

$$
S = \frac{1}{n - 1}\left\lbrack y - \overline{y} \right\rbrack^{'}\left\lbrack y - \overline{y} \right\rbrack = \begin{bmatrix}
8.2 & 1.6 \\
1.6 & 5.8 \\
\end{bmatrix}
$$

La ecuación característica correspondiente es:

$$
\left| S - \lambda_{k}I \right| = \left| \begin{bmatrix}
8.2 & 1.6 \\
1.6 & 5.8 \\
\end{bmatrix} - \begin{bmatrix}
\lambda_{k} & 0 \\
0 & \lambda_{k} \\
\end{bmatrix} \right| = 0
$$

Tiene dos autovalores, $\lambda_{1} = 9$ y $\lambda_{2} = 2$. La varianza
total es la misma, pero particionada de otra manera. La suma de la varianza en
la diagonal de $\mathbf{S}$ es $8.2 + 5.8 = 14$, y la suma de los dos
autovalores es $(9 + 5) = 14$. El primer componente principal tiene el 64.3%
de la varianza ($\lambda_{1} = 9)$ y el segundo el resto, 35.7%. Hay tantos
autovalores como variables, pero cada autovalor tiene cada vez menos varianza.
Con los valores de $\lambda_{k}$ podemos calcular los autovectores con la
ecuación:

$$
\left( \mathbf{S} - \lambda_{k}\mathbf{I} \right)\mathbf{u}_{k} = 0
$$

Una vez que los vectores son normalizados (i.e. la longitud es uno,
$\mathbf{u}^{'}\mathbf{u} = 1$) se convierten en columnas de la matriz
$\mathbf{U}$:

$$
U = \begin{bmatrix}
0.8944 & - 0.4472 \\
0.4472 & 0.8944 \\
\end{bmatrix}
$$

Los signos de la matriz son totalmente arbitrarios, si se multiplica por -1 se
consigue una imagen especular que es igual de buena representando los datos.

Los autovectores son ortogonales entre sí (incorrelados). Podemos comprobarlo
con su producto cruzado $\mathbf{u}_{1}^{'}\mathbf{u}_{2} = \left( 0.8944
\times \left( - 0.4472 \right) \right) + \left( 0.4472 \times 0.8944 \right) =
0$. Además, los elementos de $\mathbf{U}$ son los cosenos del ángulo entre
las variables originales. Usando esta propiedad, se puede ver que los ejes
principales especifican una rotación de los ejes de $\left(
\operatorname{}{0.8944} \right) = 2634^{'}$.

Los elementos de los autovectores también son pesos (*loadings*) de las
variables originales. Por lo tanto, la posición del objeto $x_{i}$ en el
primer eje principal está dada por la siguiente función o combinación linear:

$$
f_{i1} = \left( y_{i1} - {\overline{y}}_{1} \right)u_{11} + \ldots + \left( y_{ip} - {\overline{y}}_{p} \right)u_{p1} = \left\lbrack y - \overline{y} \right\rbrack_{i}\mathbf{u}_{1}
$$

Los valores de $\left( y_{ij} - {\overline{y}}_{j} \right)$
son los valores del objeto $i$ en las variables $j$ centrados y los valores
de $u_{i1}$ son lo pesos de las variables en el primer autovector. Las
posiciones de los objetos con respecto a los ejes principales están dadas en la
matriz F de variables transformadas. Es llamada *matriz de valores de
componentes*:

$$
\mathbf{F} = \left\lbrack y - \overline{y} \right\rbrack\mathbf{U}
$$

Para el ejemplo esto sería:

$$
\mathbf{F} = \begin{bmatrix}
 - 3.2 & - 1.6 \\
 - 2.2 & 1.4 \\
 - 0.2 & - 2.6 \\
1.8 & 3.4 \\
3.8 & - 0.6 \\
\end{bmatrix}\begin{bmatrix}
0.8944 & - 0.4472 \\
0.4472 & 0.8944 \\
\end{bmatrix} = \begin{bmatrix}
 - 3.578 & 0 \\
 - 1.342 & 2.236 \\
 - 1.342 & - 2.236 \\
3.130 & 2.236 \\
3.130 & - 2.236 \\
\end{bmatrix}
$$

En este caso simple, con solo dos variables, los componentes principales son una
representación perfecta de la variabilidad y es solo una rotación de estas dos
variables. Cuando hay más de dos variables, como es usual, el análisis de
componentes principales también realiza una rotación del sistema de
variables-ejes, pero en un espacio multidimensional. En este caso, los
componentes principales I y II definen un plano que permite la representación de
la mayor variabilidad. Los objetos son proyectados en este plano de tal forma
que conserven, lo más posible, las distancias euclídeas que tienen en el espacio
multidimensional de las variables originales.

La posición relativa de los objetos en el espacio p-dimensional rotado de los
componentes principales son las mismas que en el espacio p-dimensional de las
variables originales. Esto significa que **las distancias euclídeas entre los
objetos se conservan a través de la rotación de los ejes**. Esta es una de las
propiedades más importantes de análisis de componentes principales.

La calidad de la representación en un espacio euclídeo reducido con m
dimensiones puede ser estudiada con la relación

$$
\left( \sum_{k = 1}^{m}{\ \lambda_{k}} \right)/\left( \sum_{k = 1}^{p}{\ \lambda_{k}} \right)
$$

Esta relación es equivalente al coeficiente de determinación ($R^{2}$) en el
análisis de regresión.

El análisis componentes principales se pueden usar para estudiar el rol de las
variables en la conformación de los componentes principales. Esto se puede ver
en varias maneras: matriz de autovectores, proyección en un espacio reducido
(matriz $\mathbf{U}\mathbf{\Lambda}^{1/2}$), y proyección en un espacio
reducido (matriz **U**)

1.  La matriz de autovectores – Como la matriz U contiene los autovectores
    normalizados, la diagonal $\mathbf{U}'\mathbf{U}$ es igual 1 y los
    elementos fuera de la marginal es igual 0 porque los autovectores son
    ortogonales entre sí.

$$
\mathbf{U}^{'}\mathbf{U} = \mathbf{I}
$$

Por lo tanto, las variables tienen longitud de unidad en el espacio
multidimensional y están a 90° entre sí (ortogonales) dado que los autovectores
son ortogonales entre sí. Esto es así porque el análisis de componentes es una
rotación en el espacio multidimensional. Además, al normalizar los autovectores
normaliza los ejes de las variables:

$$
\begin{aligned}
  \mathbf{U} = 
    &\begin{bmatrix}
      u_{11}\hphantom{0000} & \hphantom{00}\cdots & \hphantom{000000}u_{1p}\hphantom{000000} \\\\
      \vdots\hphantom{0000} & \  & \hphantom{00000}\vdots\hphantom{000000} \\\\
      u_{p1}\hphantom{0000} & \hphantom{00}\cdots & \hphantom{000000}u_{pp}\hphantom{000000} \\
    &\end{bmatrix}
    \begin{matrix}
      \sqrt{\sum u_{1k}^{2}} = 1 \\\\
      \vdots \\\\
      \sqrt{\sum u_{pk}^{2}} = 1 \\
    \end{matrix} \\
    &\begin{matrix}
      \sqrt{\sum u_{j1}^{2}} = 1 & \cdots&& \sqrt{\sum u_{jp}^{2}} = 1 & \\
    &\end{matrix} \\
\end{aligned}
$$

Otra forma de estudiar la relación entre los predictores consiste en escalar los
autovectores de tal forma que los cosenos de los ángulos entre los ejes de las
variables sean **proporcionales** a su *covarianza*. Se logra escalando cada
autovector $k$ a una longitud igual a su desvío estándar
$\sqrt{\lambda_{k}}$. La *distancia euclídea* entre objetos **no se conserva**
de esta manera.

Usando la matriz diagonal de autovalores $\mathbf{\Lambda}$ se puede computar
la nueva de autovectores $\mathbf{U}\mathbf{\Lambda}^{\frac{1}{2}}$:

$$
\mathbf{U}\mathbf{\Lambda}^{\frac{1}{2}}\mathbf{=}\begin{bmatrix}
0.8944 & - 0.4472 \\
0.4472 & 0.8944 \\
\end{bmatrix}\begin{bmatrix}
\sqrt{9} & 0 \\
0 & \sqrt{5} \\
\end{bmatrix} = \begin{bmatrix}
2.6633 & - 1.000 \\
1.3416 & 2.000 \\
\end{bmatrix}
$$

En este escalamiento, la relación entre las variables es la misma que en la
matriz de dispersión $\mathbf{S}$

$$
\begin{aligned}
  {\mathbf{U}\mathbf{\Lambda}^{\frac{1}{2}}} = 
    &\begin{bmatrix}
      \hphantom{00}u_{11}\sqrt{\lambda_{1}}\hphantom{0000000} & \hphantom{000}\cdots & \hphantom{000000}u_{1p}\sqrt{\lambda_{p}}\hphantom{000000000} \\\\
      \vdots\hphantom{0000} & \  & \hphantom{00000}\vdots\hphantom{00000000} \\\\
      u_{p1}\sqrt{\lambda_{1}}\hphantom{0000} & \hphantom{000}\cdots & \hphantom{000000}u_{pp}\sqrt{\lambda_{p}}\hphantom{000000000} \\
    &\end{bmatrix}
    \begin{matrix}
      \sqrt{\sum\left( u_{1k}\sqrt{\lambda_{k}} \right)^{2}} = s_{1} \\
      \\
      \vdots \\
      \\
      \sqrt{\sum\left( u_{pk}\sqrt{\lambda_{k}} \right)^{2}} = s_{p} \\
    \end{matrix} \\
    &\begin{matrix}
      \sqrt{\sum\left( u_{j1}\sqrt{\lambda_{1}} \right)^{2}} = \sqrt{\lambda_{1}} & \cdots & \sqrt{\sum\left( u_{jp}\sqrt{\lambda_{p}} \right)^{2}} = \sqrt{\lambda_{p}} \\
    &\end{matrix} \\
\end{aligned}
$$

1.  Proyección de las variables en un espacio reducido (matriz
    $\mathbf{U}\mathbf{\Lambda}^{\frac{1}{2}}$): Lo interesante no es todo el
    espacio multidimensional, sino la proyección simplificada del mismo en un
    espacio reducido, en general dos dimensiones. Los elementos
    $u_{jk}\sqrt{\lambda_{k}}$ de los autovectores, escalados en
    $\sqrt{\lambda_{k}}$, son coordenadas de la proyección de las $j$
    variables en los diferentes ejes $k$. Se grafican como **flechas** ya que
    son **ejes**. Sus proyecciones son más cortas o iguales que sus longitudes
    en el espacio multidimensional.

Los ángulos entre las variables son proyecciones de sus verdaderos ángulos de
covarianza. Por lo tanto, es importante solo considerar variables que estén bien
representadas en el plano de proyección. Una forma de evaluarlo es verificando
la longitud de la proyección. En un espacio reducido la longitud de la
proyección del eje de la variable es $s_{j}\sqrt{d/p\ }$. Esta expresión
define la *contribución en equilibrio de la variable* en los varios ejes del
espacio multidimensional.

Esta medida nos sirve para comparar con la longitud de la variable y ver si su
contribución en mayor o menor de lo esperado bajo la hipótesis de contribuciones
iguales en todos los ejes principales. Para nuestro ejemplo, la longitud de las
variables:

$$
\text{longitud de la primera variable} = \sqrt{{2.6833}^{2} + \left( - 1.000 \right)^{2}} = 2.8636
$$

$$
\text{longitud de la segunda variable} = \sqrt{{1.3516}^{2} + {2.000}^{2}} = 2.4083
$$

Como el ejemplo tiene solo dos variables, las longitudes son iguales a las
contribuciones en equilibrio:

$$
\text{proyeccion en equilibrio de la variable 1} = s_{1}\sqrt{2/2} = \sqrt{8.2}\sqrt{2/2} = 2.8636
$$

$$
\text{proyeccion en equilibrio de la variable 2} = s_{2}\sqrt{2/2} = \sqrt{5.8}\sqrt{2/2} = 2.4083
$$

La matriz de correlación $\mathbf{R}$ está conectada a la matriz de dispersión
$\mathbf{S}$ por la diagonal de matriz de desvíos estándar $\mathbf{D}(s)$.
El coseno del ángulo $\alpha_{jl}$ entre dos variables $y_{j}$ e
$y_{l}$ en el espacio multidimensional, está por lo tanto relaciona a la
correlación ($r_{jl}$); puede demostrarse que $\cos\left(
\alpha_{jl} \right) = r_{jl}$. Este ángulo es igual a la
covarianza, porque la estandarización cambió las longitudes de las variables a
la unidad. En el ejemplo, la correlación entre las dos variables es igual a
$\frac{1.6}{\sqrt{8.2 \times 5.8}} = \ 0.232$ . El ángulo correspondiente es
$\operatorname{}{0.232} = 7635'$.

Igualmente, el ángulo entre la variable $j$ y el eje principal $k$, en el
espacio multidimensional, es el arco coseno de la correlación entre la variable
$j$ y el eje principal $k$. Esta correlación es el elemento $jk$ de
la nueva matriz de autovectores:

$$
u_{jk}\sqrt{\lambda_{k}}/s_{j}
$$

Es decir que la correlación es calculada pesando cada elemento de los
autovectores por la relación del desvío estándar del eje principal al de la
variable. Para el ejemplo, los desvíos estándar $s_{1} = 2.8636\ s_{2} =
2.4083$:

$$
\left\lbrack \frac{u_{jk}\sqrt{\lambda_{k}}}{s_{j}} \right\rbrack = \begin{bmatrix}
0.9370 & - 0.3492 \\
0.5571 & 0.8305 \\
\end{bmatrix}\begin{bmatrix}
2026' & 11026' \\
5609' & 3351' \\
\end{bmatrix}
$$

Una consecuencia importante de esto es que las variables con **correlación más
alta**, en valor absoluto, son las que **más contribuyen** a cada autovector.
Sin embargo, no se puede hacer la prueba estadística de Pearson para los
coeficientes de correlación porque los componentes principales son combinaciones
lineales de las variables.

Cuando los ejes de las variables de $\mathbf{U}\mathbf{\Lambda}^{\frac{1}{2}}$
están estandarizados a longitud unidad sus proyecciones en el espacio principal
**no es recomendada** porque los autovectores re-escalados no son necesariamente
ortogonales y pueden tener cualquier longitud.

La matriz de las proyecciones de los ejes de las variables de la matriz puede
ser examinada con respecto a los siguientes puntos:

-   Las proyecciones de las coordenadas de los ejes de las variables especifican
    la posición de los ápices de ese eje de variable en el espacio reducido. Se
    recomienda usar flechas para representarlos.

-   La proyección de los $u_{jk}\sqrt{\lambda_{k}}$ del eje de la
    variable $j$ en el eje principal $k$ muestra su covarianza con respecto
    al eje principal, y su signo.

-   Verificar variables cuyas **longitudes proyectadas alcancen o excedan** los
    valores de sus respectivas contribuciones en equilibrio. Los ejes de
    variables que sean claramente más cortos que esto contribuyen poco a la
    formación del espacio reducido bajo estudio y, por lo tanto, contribuyen
    poco a la estructura que se puede ser encontrada para los objetos en ese
    espacio reducido.

-   La **correlación** entre las variables está dada por el **ángulo** entre los
    ejes de las variables y **no** por la proximidad entre los ápices de los
    ejes. Hay que tener en cuenta que, la proyección de los ejes en el espacio
    reducido puede no ser la representación completa de la correlación espacio
    multidimensional. Puede ser mejor agrupar variables, en el espacio reducido
    del gráfico, con respecto al espacio multidimensional, realizando un método
    *de análisis de agrupamiento*.

-   Los objetos pueden ser proyectados en ángulo recto sobre los ejes de las
    variables de acuerdo a sus valores en esas variables. Sin embargo, las
    distancias entre los objetos **no son aproximaciones de sus distancias
    euclídeas**.

1.  Proyección de las variables en un espacio reducido (matriz $\mathbf{U}$):
    Difiere de lo anterior en los autovectores no han sido escalados a las
    longitudes de sus desvíos estándar. Los ángulos entre los ejes de las
    variables y los ejes principales son proyecciones de sus ángulos de
    rotación. Por ejemplo:

$$
U = \begin{bmatrix}
0.8944 & - 0.4472 \\
0.4472 & 0.8944 \\
\end{bmatrix}\begin{bmatrix}
2634' & 11634' \\
6326' & 2634' \\
\end{bmatrix}
$$

En esta proyección no es posible interpretar las correlaciones entre las
variables ya que siempre son ortogonales en esta representación, donde los
autovectores están escalados a 1.

La proyección de $u_{jk}$ de una variable $j$ en el eje principal
$k$ es **proporcional** a la **covarianza** de ese descriptor con el eje
principal. Se puede comparar la proyección de diferentes ejes de variables en el
mismo eje principal. Se puede probar que una proyección isogonal (con ángulos
iguales) de $p$ ejes ortogonales de longitud uno da una longitud de
$\sqrt{\frac{d}{p}}$ en cada eje de un espacio $d$-dimensional.

Se puede dibujar un *círculo de equilibrio de las variables* como referencia
para evaluar la contribución de cada variable a la conformación del espacio
reducido.

| Variable centrada $j$                   | Escalado de los autovectores                                            |                                                            |
|-------------------------------------------|-------------------------------------------------------------------------|------------------------------------------------------------|
|                                           | $\sqrt{\lambda_{k}}$                                                    | 1                                                          |
| Longitud total                            | s_{j}                                                                   | 1                                                          |
| Ángulos en el espacio reducido            | Proyección de las covarianzas (correlaciones)                           | 90°, rotaciones rígidas del sistema de ejes                |
| Longitud de la contribución en equilibrio | $s_{j}\sqrt{d/p}$                                                      | Círculo con radio $\sqrt{\frac{d}{p}}$                   |
| Proyección en el eje principal $k$      | $u_{jk}\sqrt{\lambda_{k}}$ (la covarianza con el componente k) | $u_{jk}$ (proporcional a la covarianza con $k$) |
| Correlación con el eje principal $k$    | $u_{jk}\sqrt{\lambda_{k}}/s_{j}$                                | $u_{jk}\sqrt{\lambda_{k}}/s_{j}$                   |

### Biplots


Se le llama biplot al gráfico de componentes principales en donde se grafican al
mismo tiempo los ejes de las variables y los objetos en el espacio reducido.
Existen dos tipos de gráficos biplots según el escalamiento que se use:

-   los de *distancia* se hacen con la yuxtaposición de la matriz $\mathbf{U}$
    (los autovectores escalados a longitud unidad) y $\mathbf{F}$ (donde cada
    componente principal $k$ está escalado a la varianza = $\lambda_{k}$),

-   los de *correlación* usan la matriz
    $\mathbf{U}\mathbf{\Lambda}^{\frac{1}{2}}$ para las variables (cada
    autovector escalado a longitud $\sqrt{\lambda_{k}}$) y la matriz
    $\mathbf{G} = \mathbf{F}\mathbf{\Lambda}^{\frac{1}{2}}$ para los objetos,
    cuyas columnas tienen varianzas de unidad.

Las principales propiedades de los biplot de distancias son:

1.  La distancia entre los objetos del biplot **son aproximaciones** de sus
    distancias euclídeas en el espacio multidimensional.

2.  La proyección del objeto en ángulo recto sobre la variable da la posición
    aproximada del objeto en esa variable.

3.  Dado que las variables tienen longitud 1 en el espacio multidimensional, la
    longitud de su proyección sobre el espacio reducido indica **cuanto
    contribuye** a la formación de ese espacio.

4.  Los ángulos entre los vectores de las variables no tienen interpretación

En los biplots de correlación:

1.  Las distancias entre los objetos del biplot **no son aproximaciones** de sus
    distancias euclídeas en el espacio multidimensional.

2.  La proyección del objeto en ángulo recto sobre la variable da la posición
    aproximada del objeto en esa variable.

3.  Dado que la longitud de las variables es $s_{j}$ en un espacio
    multidimensional completo, la longitud de la proyección de la variable en el
    espacio reducido es una aproximación de su **desvío estándar**.

4.  Lo **ángulos** entre las variables reflejan su **correlación**.

En cualquiera de los dos casos, los objetos o variables pueden ser multiplicados
por una constante para producir un gráfico claro.

## Componentes principales de una matriz de correlación


También puede realizar este análisis sobre una matriz $\mathbf{R}$ de
correlación, ya que las correlaciones son las covarianzas estandarizadas de las
variables. La suma de autovalores de $S$ es igual a la suma de varianzas,
mientras que la suma de autovalores de $\mathbf{R}$ es igual $p$, por lo que
los autovalores y por lo tanto los autovectores son diferentes. Esto se debe a
que las distancias entre los objetos no son las mismas en los dos casos.

En el caso de las correlaciones, las variables están estandarizadas. Por lo
tanto, las distancias entre los objetos son independientes de las unidades de
medición, por otro lado, las que están en el espacio original de medida cambian
de acuerdo a su cambio en unidad de medida. Cuando todas las variables son del
mismo orden de magnitud y tienen las mismas unidades conviene usar la matriz
$\mathbf{S}$. En ese caso, los autovectores y los coeficientes de correlación
entre las variables y los componen proporcionan información complementaria. El
primero da la ponderación de las variables y el segundo cuantifica su
importancia relativa. Cuando las variables son de naturaleza diferente, puede
ser necesario usar la matriz $\mathbf{R}$ en vez de $\mathbf{S}$.

¿Cuándo usar una $\mathbf{S}$ o $\mathbf{R}$?

-   Si uno quiere agrupar los objetos en el espacio reducido ¿El agrupamiento
    debe hacerse con respecto a las variables originales, por lo tanto,
    preservando sus diferencias en magnitud? ¿O las variables deberían
    contribuir de igual forma al agrupamiento de los objetos, independientemente
    de su varianza? En el segundo caso uno debería proceder con la matriz de
    correlación

Otra forma de ver esto es:

-   Considere que la distancia euclídea es la que se conserva entre los objetos
    con el análisis de componente principales. ¿Qué es más interesante de
    interpretar en términos de la configuración espacial de las distancias
    euclídeas? La covarianza (los datos crudos) o las correlaciones (los datos
    estandarizados)

Igual que con el caso anterior, el análisis de componentes principales es una
rotación del sistema de ejes. Pero, como ahora las variables están
*estandarizadas*, los objetos no están posicionados de la misma forma que si las
variables fuesen solo *centradas*.

Las conclusiones de lo visto anteriormente no cambian, solo hay que reemplazar
matriz de dispersión $\mathbf{S}$ por matriz de correlación $\mathbf{R}$,
covarianza por correlación y $s_{jl}$ por $r_{jl}$. Por lo
tanto, las varianzas y desvíos estándar son iguales a 1. Lo que da lugar a
ciertas propiedades especiales para la matriz
$\mathbf{U}\mathbf{\Lambda}^{\frac{1}{2}}$. Primero, $\mathbf{D}\left( s
\right) = \mathbf{I}$, por lo que $\mathbf{U}\mathbf{\Lambda}^{\frac{1}{2}} =
\mathbf{D}\left( s \right)^{- 1}\mathbf{U}\mathbf{\Lambda}^{\frac{1}{2}}$, esto
significa que los coeficientes $u_{jk}\sqrt{\lambda_{k}}$ son los
coeficientes de correlación entre las variables $j$ y los componentes $k$.
La contribución en equilibrio, en el espacio reducido de
$\mathbf{U}\mathbf{\Lambda}^{\frac{1}{2}}$, es $s_{j}\sqrt{\frac{d}{p}} =
\sqrt{\frac{d}{p}}$ ($s_{j} = 1$). Por lo tanto, es posible juzgar si la
contribución de una variable es mayor o menor a lo esperado comparando la
longitud de las proyecciones a un círculo de equilibrio con radio
$\sqrt{\frac{d}{p}}$.

Las propiedades principales de un variable estandarizada se dan en la tabla de
abajo.

| Variable estandarizada $j$              | Escalado de los autovectores                                            |                                                            |
|-------------------------------------------|-------------------------------------------------------------------------|------------------------------------------------------------|
|                                           | $\sqrt{\lambda_{k}}$                                                    | 1                                                          |
| Longitud total                            | 1                                                                       | 1                                                          |
| Ángulos en el espacio reducido            | Proyección de las correlaciones                                         | 90°, rotaciones rígidas del sistema de ejes                |
| Longitud de la contribución en equilibrio | $\sqrt{d/p}$                                                           | Círculo con radio $\sqrt{\frac{d}{p}}$                   |
| Proyección en el eje principal $k$      | $u_{jk}\sqrt{\lambda_{k}}$ (la covarianza con el componente k) | $u_{jk}$ (proporcional a la covarianza con $k$) |
| Correlación con el eje principal $k$    | $u_{jk}\sqrt{\lambda_{k}}$                                      | $u_{jk}\sqrt{\lambda_{k}}$                         |

## ¿Cuantos componentes son significativos?


Una propiedad de los componentes es que cada uno representa una cantidad cada
vez menor de la varianza total. Por lo tanto, un problema es cuantos componentes
son significativos en términos biológicos. La misma pregunta vista de otra
manera es, cuantas dimensiones tendría que tener el espacio reducido. La mejor
manera de ver esto es con diagrama de Shepard. Sin embargo, dado que el análisis
de componentes principales es una forma de partición de la varianza uno podría
realizar una prueba formal para la varianza asociada con los sucesivos ejes
principales.

Existen varias pruebas clásicas para contestar esta pregunta, pero el problema
que tienen es que requieren normalidad en las variables, una condición que rara
vez se cumple por datos ecológicos.

Hay una regla empírica que sugiere que solo se deben interpretar los componentes
principales si su autovalor $\lambda$ es mayor que la media de los
$\lambda$. Este es llamado el criterio Kaiser-Guttman.

Otra forma, también empírica, es comparar los valores decrecientes de los
autovalores con los valores de modelo de bastón roto. Considere que la varianza
es un recurso embebida en un bastón de longitud 1. Si los componentes
principales dividieran la varianza al azar entre los ejes principales, las
fracciones de la varianza explicada por los ejes principales tendría la misma
longitud relativa que las piezas obtenidas al romper el bastón en puntos al azar
en tantas piezas como ejes. Si un bastón de unidad es roto en al azar en $p =
2,\ 3,\ \ldots$ piezas, los valores esperados (E) de las longitudes relativas
de las piezas sucesivamente menores (j) están dados por la ecuación:

$$
E\left( \text{pieza}_{j} \right) = \frac{1}{p}\sum_{x = j}^{p}\frac{1}{x}
$$

Los valores esperados son iguales a la media de las longitudes que fuesen
obtenidas al romper el bastón al azar muchas veces y calcular la media de la
pieza más grande, la segunda más grande, etc. No tendría sentido interpretar los
ejes principales que explican una fracción de la varianza menor o igual que la
predicha por el modelo del bastón roto. Puede comprobarse que ejes deben
interpretarse consultando una tabla y seleccionando los autovalores que son
mayores que las predicciones del modelo. O comparar la suma de los autovalores
de 1 hasta $k$ con la suma de los valores de 1 hasta $k$ en el modelo. Esta
prueba generalmente selecciona los primeros dos o tres componentes principales.

## Mal uso de los componentes principales


Los errores más comunes son: uso de las variables para las cuales la covarianza
no tiene sentido y la interpretación de la relación entre variables, en el
espacio reducido, basa en las posiciones relativas de los ápices de los ejes en
vez de los ángulos entre ellas.

El análisis de componentes principales fue definido originalmente para el
estudio de datos con distribución multinormal, por lo que para usarlo
óptimamente es necesario normalizar los datos. Las desviaciones de la normalidad
no afectan necesariamente el análisis. Hay que tener cuidado con las
distribuciones sesgadas, los primeros ejes principales solo van a separar los
pocos objetos con valores extremos del resto, en vez de mostrar los ejes
principales de variación de todos los objetos en estudio.

El método debe ser usado con una matriz de varianzas o correlaciones con las
siguientes propiedades: a) la matriz S o R ha sido calculada entre variables b)
que son cuantitativos y c) para las cuales estimadores validos de la covarianza
pueden ser obtenidos. Esto se viola bajo las siguientes condiciones:

1.  Una matriz de dispersión no puede ser estimada cuando el número de
    observaciones n es menor o igual al número de variables p. El número de
    objetos de ser mayor a p para obtener estimadores validos de la matriz de
    dispersión. Sin embargo, los primeros ejes principales son poco afectados
    por cuando la matriz no es rango completo. Por lo que no debería haber
    interpretaciones incorrectas de las ordenaciones en espacio reducido.

2.  Algunos autores han transpuesto las matriz original y computado
    correlaciones entre objetos en vez de entre variables. Esto no tiene sentido
    porque el análisis produce información tanto de los objetos como de las
    variables. Además, la covarianza entre objetos no tiene sentido. Y la
    correlación implica estandarización de los vectores, y solo tiene sentido
    para datos dimensionalmente homogéneos.

3.  Las covarianzas y correlaciones solo están definidas para variables
    cuantitativas. Sin embargo, el análisis de componentes principales es muy
    robusto a variaciones de precisión de los datos. Las variables pueden ser
    recodificadas en pocas clases sin cambiar notablemente los resultados. Los
    coeficientes de correlación usando datos semicuantitativos son equivalentes
    al coeficiente de correlación de rangos de Spearman.

4.  Cuando se calcula en conjuntos de datos con muchos doble ceros, los
    coeficientes de covarianza o correlación dan ordenaciones que producen
    estimadores inadecuados de las distancias entre objetos. Con este tipo de
    datos solo se debe usar componentes principales en gradientes pequeños.

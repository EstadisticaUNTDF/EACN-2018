


# ANOVA

## Algunos conceptos importantes

**Factor**: Un factor es una variable independiente a ser estudiada en una
investigación. Ejemplo: Temperatura, Dieta

**Nivel**: El nivel de un factor es una forma particular de ese factor. Ejemplo:
Temperatura: 0ºC, 10ºC y 20ºC. Dieta: Con aditivos proteicos y Sin aditivos
proteicos

**Estudios Uní y Multifactoriales:** Estudios de un factor, únicamente un factor
es de interés. En estudios Multifactoriales, dos o más factores son investigados
simultáneamente. Ejemplo: Un factor: cantidades de suplemento de proteínas de
una clase determinada. Más de un factor: cantidades y clases de suplementos de
proteínas.

**Factores Experimentales y de Clasificación:** En cualquier investigación
basada sobre datos observacionales, los factores bajo estudio son factores de
clasificación. Un factor de clasificación corresponde a la característica de las
unidades bajo estudio y no las que están bajo control del investigador, no
pueden ser manipuladas experimentalmente. Por otro lado, un factor experimental
es aquel donde los niveles del factor son asignados al azar a las unidades
experimentales.

**Factores cualitativos y cuantitativos:** Un factor cualitativo es aquel donde
los niveles difieren con respecto a un atributo cualitativo. Por otro lado, un
factor cuantitativo es aquel que es descrito por una cantidad numérica sobre una
escala.

**Tratamientos:** Es el procedimiento cuyo efecto se mide y se compara con otros
tratamientos. En estudios unifactoriales un tratamiento corresponde a un nivel
de un factor. En estudios Multifactoriales, un tratamiento corresponde a una
combinación de niveles de factores.

## Diseño de Estudios de ANOVA


**Elección del tratamiento:** La elección de los tratamientos a ser incluidos en
una investigación es básicamente una decisión del investigador. En una
investigación científica, los tratamientos incluidos deberían poder suministrar
conocimientos sobre el mecanismo subyacente al fenómeno bajo estudio.

**Definición del tratamiento:** Al seleccionar un conjunto de tratamientos, es
importante definir cada tratamiento cuidadosamente y considerarlo con respecto a
cada uno de los demás tratamientos para asegurarse, en lo posible, que el
conjunto dé respuestas eficientes relacionadas con los objetivos del
experimento.

**Tratamiento Control o Testigo:** Un tratamiento control consiste en la
aplicación de procedimientos idénticos a las unidades experimentales que
aquellos usados con los otros tratamientos, excepto por los efectos bajo
investigación.

Un tratamiento control es requerido cuando la efectividad general de los
tratamientos bajo estudio no es conocida, o cuando la efectividad general de los
tratamientos es conocida pero no es consistente bajo todas las condiciones.

**Unidad experimental o unidad básica de estudio:** Es la unidad de material a
la cual se aplica un tratamiento. Es la mínima unidad de muestreo. No siempre
coincide con la unidad de muestreo. Ejemplo: se aplica un tratamiento en una
maceta y se muestrean tres hojas de cada maceta.

**Observación individual:** Son las mediciones que se hacen en cada una de las
unidades experimentales.

**Muestra:** Es el conjunto de observaciones individuales, se expresa en
términos de observaciones individuales y no de unidades experimentales, es la
única información que uno posee.

## Planificación De Experimentos


Las inferencias que pueden hacerse, a partir de los resultados de un
experimento, dependen de la forma en que fue hecho el experimento. Es una buena
práctica hacer un proyecto de los propósitos de cualquier experimento. Este
proyecto constará de tres partes:

**Enumeración de las finalidades:** debe incluir una determinación del campo
sobre el cual se harán las generalizaciones, o, en otras palabras, la población
respecto de la cual se espera hacer inferencias.

**descripción del experimento:** Se ha usado el término tratamiento para
denominar los diferentes procesos cuyos efectos van a ser medidos y comparados.
En la selección de los tratamientos es importante definir claramente cada uno de
ellos y entender el papel que jugará para alcanzar los objetivos del
experimento.

**bosquejo del método de análisis de los resultados:** Las características del
experimento que deben ser tenidas en cuenta en la enumeración de finalidades
son: el número de repeticiones, los tipos de material experimental que se van a
usar, las mediciones que se van a hacer. Finalmente, el bosquejo debería
describir, con algún detalle, el método propuesto para sacar conclusiones de los
resultados.

## Usos Del ANOVA


Los estudios de un solo factor son utilizados para comparar efectos de
diferentes niveles de un factor, para determinar el “mejor” nivel del factor y
la semejanza. En estudios multifactoriales, el ANOVA es empleado para determinar
si los diferentes factores interactúan, que factores son claves; cuales
combinaciones de factores son las “mejores”, etc.

## MODELO I DE ANOVA. NIVELES DEL FACTOR FIJOS


### Distinción Entre Modelos I Y II de ANOVA


El modelo I de ANOVA se aplica en casos tales como una comparación de un número
determinado de tratamientos, y donde las conclusiones se restringen a aquellos
niveles del factor incluidos en el estudio. También se conoce como modelo de
efectos fijos. El modelo II de ANOVA se aplica a un tipo diferente de situación,
donde las conclusiones se extenderán a una población de niveles del factor del
cual los niveles bajo estudio son una muestra. Es decir que se trata de un
modelo de efectos aleatorios.

### Ideas Básicas


Los elementos básicos del modelo I de ANOVA para un estudio de un factor son muy
simples. Correspondiendo a cada nivel del factor, hay una distribución de
probabilidades de respuestas. El modelo I de ANOVA supone:

1.  Cada una de las distribuciones en probabilidades es **normal**

2.  Cada distribución en probabilidad tiene la **misma varianza** (desviación
    estándar).

3.  Las observaciones para cada nivel del factor son observaciones
    **aleatorias** de la correspondiente distribución y son **independientes**
    de las observaciones de cualquier otro nivel del factor.

<div class="figure">
<img src="anova_files/figure-epub3/distr-normales-1.png" alt="Densidad de distribuciones de cuatro distribuciones normales con igual varianza y distinta media"  />
<p class="caption">(\#fig:distr-normales)Densidad de distribuciones de cuatro distribuciones normales con igual varianza y distinta media</p>
</div>

La Figura \@ref(fig:distr-normales) ilustra estas condiciones: la normalidad de la distribución en
probabilidades y la variabilidad constante. Las distribuciones en probabilidad
difieren sólo con respecto a sus medias. El análisis de los datos de las
muestras de las distribuciones en probabilidades de los niveles de los factores
se desarrolla usualmente en dos pasos:

Determinar si las medias de los niveles de los factores son las mismas.

Si las medias de los niveles del factor no son las mismas, examinar como
difieren y cuales son las consecuencias de las diferencias.

## Comprobación de los Supuestos


Los modelos de ANOVA son razonablemente robustos, aunque se produzcan ciertos
alejamientos del supuesto de normalidad.

### Prueba para igualdad de varianzas

#### Prueba de Bartlett

Las hipótesis son


$$
\begin{aligned}
 H_{0} &: \sigma_{1}^{2} = \sigma_{2}^{2} = \ldots = \sigma_{i}^{2} = \ldots = \sigma_{I}^{2} \\
 H_{a} &: \text{no todos}\ \text{los}\ \sigma_{i}^{2}\ \text{son}\ \text{iguales}
\end{aligned}
$$

Sean $S_{1}^{2},\ldots,S_{I}^{2}$indican las varianzas muestrales de $I$
poblaciones normales, y $Gl_{i}$ indica los grados de libertad asociados con
la varianza muestral $S_{i}^{2}$.

Bartlett ha demostrado que una función de $\left\lbrack \ln\left( C\text{MD}
\right) - ln(MGD) \right\rbrack$, ($M\text{GD}$: media geométrica pesada;
$C\text{MD}$: cuadrado medio dentro) para grandes tamaños muestrales, sigue
aproximadamente la distribución $\chi^{2}$ con $(I-1)$ grados de libertad
cuando las varianzas poblacionales son iguales. La prueba estadística es:

$$
B = \frac{GL_{t}}{C}\left\lbrack \ln\left( CM_D \right) - ln(M\text{MGD}) \right\rbrack
$$

, donde

$$
C = 1 + \frac{1}{3\left( I - 1 \right)}\left\lbrack \left( \sum_{i = 1}^{I}\frac{1}{GL_{i}} \right) - \frac{1}{GL_{T}} \right\rbrack
$$

El término C es siempre mayor que 1.

La prueba estadística se reduce a:

$$
B = \frac{1}{C}\left\lbrack (GL_{t})\ln\left( CM_D \right) - \sum_{i = 1}^{I}\left( GL_{i} \right)lnS_{i}^{2} \right\rbrack
$$

se calcula el estadístico $B$. La regla de decisión es:

Si $B < \chi_{(1 - \alpha;I - 1)}^{2}$, no se rechaza $H_{0}$

Si $B > \chi_{(1 - \alpha;I - 1)}^{2}$, se rechaza $H_{0}$

Esta aproximación se considera apropiada cuando los grados de libertad son
mayores o iguales que cuatro.

Cuando la prueba se usa para un modelo de ANOVA de un factor se tiene:

$GL_{i} = n_{i} - 1$ y $GL_{T} = \sum_{i = 1}^{I}\left( n_{i} - 1 \right) = N
- I$

La prueba de Bartlett es bastante sensible a la falta de normalidad. Si las
varianzas muestrales son menores que la unidad, sus logaritmos serán negativos.
Por lo tanto, es conveniente utilizar un código multiplicativo para hacer las
varianzas mayores que la unidad. Este código no afecta en modo alguno a la
prueba estadística.

#### Prueba de Levene Modificada

Las hipótesis son

$$
\begin{aligned}
H_{0} &:\sigma_{1}^{2} = \sigma_{2}^{2} = \ldots = \sigma_{i}^{2} = \ldots = \sigma_{I}^{2}\\
H_{a} &:\text{no todos}\ \text{los}\ \sigma_{i}^{2}\ \text{son}\ \text{iguales}
\end{aligned}
$$

Primero se calcula la desviación absoluta de las $Y_ij$ observaciones de sus
respectivas medianas del nivel del factor $\tilde{Y_{i}}$

$$
d_{ij} = \left| Y_{ij} - \tilde{Y_{i}} \right|
$$

Entonces la prueba de Levene determina si los valores esperados de las
desviaciones absolutas son iguales. Si las varianzas son iguales entonces los
valores esperados de las desviaciones absolutas también serán iguales. La prueba
de Levene usa el estadístico $F^{*}$

$$
F_{L}^{*} = \frac{CM_{ET}}{CM_D}
$$

donde

$$
CM_{ET} = \frac{\sum n_{i}\left( \overline{d}_{i\bullet}\  - \overline{d}_{\bullet\bullet} \right)^{2}}{I - 1}
$$

$$
CM_D = \frac{\sum\sum\left( \overline{d}_{ij}\  - \overline{d}_{i\bullet}\right)^{2}}{N - 1}
$$

$$
\overline{d}_{i\bullet} = \sum_{j}^{}\frac{d_{ij}}{n_{i}}
$$

$$
\overline{d}_{\cdot \cdot } = \frac{\sum_{}^{}{\sum_{}^{}{d_{ij}}}}{N}
$$

Si las varianzas son iguales y los tamaños muestrales no son extremadamente
pequeños, $\mathbf{F}_{\mathbf{L}}^{\mathbf{*}}$ sigue aproximadamente una
distribución $F$ con $(I - 1)$ y $(N - I)$ grados de libertad.

### Prueba de Kolmogorov - Smirnov (modificación de Lilliefors) para estudiar Normalidad

Dada una muestra aleatoria, se calcula su media y su varianza muestral, luego se
calculan los datos normalizados $Z_{i}$. Se ordenan los datos de menor a
mayor, se calculan las frecuencias acumuladas observadas, las esperadas para los
$Z_{i}$, y luego se calculan las diferencias, en valor absoluto entre las
frecuencias acumuladas observadas y las esperadas. Se define $D_{max} =
max\left| F_{i} - \hat{F_{i}} \right|$ este estadístico se compara con el valor
de tablas $d_{max}$ al nivel de significación $\alpha$.

### Residuos

El residuo $\varepsilon_{ij}$ es definido como la diferencia entre el valor observado y el
ajustado:

$$
\varepsilon_{ij} = y_{ij} - \overline{y}_{i\bullet}
$$

Así, un residuo representa la desviación de una observación individual de la
respectiva media estimada del nivel del factor. A veces es útil trabajar con los
residuos estandarizados, que se expresan como:

$$
\varepsilon_{\ _{ij}}^{\otimes} = \frac{\varepsilon_{ij} - \overline{\varepsilon}}{\sqrt{CM_D}}
$$

Los residuos “*semistudentizados*”, los residuos “*studentizados*”, y los
residuos “*studentizados borrados*” son a menudo útiles para diagnosticar los
alejamientos del modelo de ANOVA.

Los residuos “*semistudentizados*” se calculan como:

$$
\varepsilon_{\ _{ij}}^{*} = \frac{\varepsilon_{ij}}{\sqrt{CM_D}}
$$

Los residuos “*studentizados*” se calculan como:

$$
r_{ij} = \frac{\varepsilon_{ij}}{S\left( \varepsilon_{ij} \right)}
$$

donde

$$
S\left( \varepsilon_{ij} \right) = \sqrt{\frac{CM_D\left( n_{i} - 1 \right)}{n_{i}}}
$$

Finalmente, los residuos “*studentizados borrados*” se calculan

$$
t_{ij} = \varepsilon_{ij}\left\lbrack \frac{N - I - 1}{SC_D\left( 1 - \frac{1}{n_{i}} \right)\varepsilon_{ij}^{2}} \right\rbrack^{\frac{1}{2}}
$$

### Gráficos de Residuos

Estos gráficos son muy importantes para el diagnóstico de problemas con el modelo.
Incluye:

1. *Residuos vs. las medias de tratamientos*: Dado que las valores ajustados
de cada nivel de factor se corresponde a la media, todos los valores
de los residuales de ese nivel se alinearán en sobre esa media (Figura
\@ref(fig:graficos-residuales)-a). Si no hay problemas con el modelo, entonces
los residuales deberían tener la misma dispersión.

2.Residuos vs. el tiempo u otra secuencia: Si los datos fueron tomados de forma
aleatoria no debería verse un patrón definido (Figura
\@ref(fig:graficos-residuales)-b). 

3. Gráficos de puntos de los residuos: Este gráfico es similar al primero.
Denuevo, en todos lo niveles del factor los residuales deberían tener la misma
dispersión alrededor del cero(Figura \@ref(fig:graficos-residuales)-c). Además,
dado que están graficados los residuales estandarizados, cualquier residual
mayor 3 debería ser investigado por ser muy extremo.

4. Gráficos de probabilidad normal de los residuos: También llamado gráfico
cuantil-cuantil o *qqplot* (Figura \@ref(fig:graficos-residuales)-d). Aquí
se grafican los cuantiles de una normal teórica vs los cuantiles muestrales.
Idealmente, deberían seguir una línea recta de pendiente 1 y ordenada 0.


(ref:graficos-residuales) Gráficos de residuales para modelos de ANOVA. a - residuales vs valores predichos. b - residuales vs orden de toma de datos. c - residuales vs niveles del factor. d - gráfico de probabilidad normal.

<div class="figure">
<img src="anova_files/figure-epub3/graficos-residuales-1.png" alt="(ref:graficos-residuales)" width="100%" />
<p class="caption">(\#fig:graficos-residuales)(ref:graficos-residuales)</p>
</div>

#### Diagnóstico de los alejamientos de los supuestos del Modelo de ANOVA

**Heterogeneidad de Varianzas**: El Modelo de ANOVA requiere que los términos
del error tengan varianzas constantes para todos los niveles del factor. Cuando
los tamaños de las muestras son iguales o no difieren mucho, esta suposición
puede ser estudiada usando los residuos, los residuos “studentizados” o los
residuos “semistudentizados”. Gráficos de los residuos vs. las medias de los
niveles del factor o los gráficos de puntos de los residuos son útiles. Cuando
los tamaños de las muestras difieren mucho, los residuos “studentizados”
deberían ser usados en estos gráficos. La constancia de la varianza del error se
ve en estos gráficos pues los puntos tienen aproximadamente la misma dispersión
alrededor del cero para cada nivel.

La Figura \@ref(fig:hetero) muestra un caso en el que las varianzas de los errores no
son constantes. En este caso los términos del error del nivel *c* del factor
tienen una varianza mayor que los otros dos niveles del factor.

(ref:hetero) Residuales vs Valores Ajustados o predichos. Este gráfico muestra que los residuales uno de los niveles muestra mayor dispersión que el resto de los datos.

<div class="figure">
<img src="anova_files/figure-epub3/hetero-1.png" alt="(ref:hetero)" width="50%" /><img src="anova_files/figure-epub3/hetero-2.png" alt="(ref:hetero)" width="50%" />
<p class="caption">(\#fig:hetero)(ref:hetero)</p>
</div>


Cuando los tamaños de las muestras, para los diferentes niveles del factor son
grandes, los histogramas de los residuos para cada tratamiento, son una manera
efectiva de examinar la constancia de la varianza de los términos del error.

**Falta de independencia en los términos del error:** En todos aquellos casos en
que los datos son obtenidos en una secuencia de tiempo, un gráfico de secuencia
de residuos es aconsejable para examinar si los términos del error están
correlacionados. La Figura \@ref(fig:indpen) muestra un caso en el cual los 
residuos aparecen altamente correlacionados. Esto puede pasar porque el operario
tiende a sobreestimar a medida que pasa el tiempo o también porque los equipos
se descalibran.

(ref:indpen) Residuales vs Orden. Los residuales muestran falta de independencia al haber una correlación entre ellos.

<div class="figure">
<img src="anova_files/figure-epub3/indpen-1.png" alt="(ref:indpen)" width="75%" />
<p class="caption">(\#fig:indpen)(ref:indpen)</p>
</div>


La siguiente Figura \@ref(fig:varianza-decrece) muestra un caso donde la varianza decrece con el tiempo.

(ref:varianza-decrece) Residuales vs Orden. Los residuales muestran que la varianza decrece, ya que al principio son mayores y al final son menores

<div class="figure">
<img src="anova_files/figure-epub3/varianza-decrece-1.png" alt="(ref:varianza-decrece)" width="75%" />
<p class="caption">(\#fig:varianza-decrece)(ref:varianza-decrece)</p>
</div>



Cuando los datos son ordenados en alguna a otra secuencia lógica, tal como una
secuencia geográfica, también debe verificarse si existe correlación entre los
términos del error de acuerdo a este orden.

**Otros usos del análisis de residuos**: Este tipo de análisis se puede usar
para detectar “outliers”. También es útil para determinar si modelo de ANOVA de
un factor es el adecuado; pues puede determinar la omisión de alguna variable
importante que explica las observaciones. También puede ser usado para
determinar la falta de normalidad de los términos del error. Esto se realiza
graficando los cuantiles de los residuales observados vs los esperados.

## Transformaciones


### Transformaciones para estabilizar las Varianzas

Varianza *proporcional a* $\mu_{i}$ : El estadístico muestral
$\mathbf{S}_\mathbf{i}^\mathbf{2}\mathbf{/}{\overline{\mathbf{Y}}}_{\mathbf{i}}$
tenderá a ser constante. Este tipo de situaciones a menudo se encuentra cuando
la variable observada es un número entero. Para estos casos, una transformación
raíz cuadrada es útil para estabilizar la varianza:

$Y^{'} = \sqrt{Y}$o $Y^{'} = \sqrt{Y + \frac{1}{2}}$ o$Y^{'} = \sqrt{Y} +
\sqrt{Y + 1}$

*Desviación estándar proporcional a* $\mu_{i}$:
$\mathbf{S}_\mathbf{i}\mathbf{/}\overline{\mathbf{Y}_\mathbf{i}}$tiende
a ser contante para los diferentes niveles del factor. Una transformación útil
para estabilizar la varianza es la transformación logarítmica:

$Y^{'} = \log Y$*o*$Y^{'} = \log{(Y + 1)}$

*Desviación estándar proporcional a* $\mu_{i}^{2}$:
$\mathbf{S}_\mathbf{i}^{\mathbf{2}}\mathbf{/}\overline{\mathbf{Y}}_{\mathbf{i}}^{\mathbf{2}}$En
este caso tiende a ser constante. la transformación apropiada es la recíproca:

$$
Y^{'} = \frac{1}{Y}
$$

*La variable dependiente es una proporción*: Una transformación apropiada para
este caso es la transformación angular o arcoseno:

$$
Y^{'} = \text{arcsen}\sqrt{Y}
$$

### Transformaciones para corregir la falta de normalidad

La transformación que ayuda a corregir la heterogeneidad de varianzas usualmente
también es efectiva para hacer que las distribuciones de los términos del error
sean más normales.

### Efectos Del Alejamiento De Los Supuestos Del Modelo


#### Normalidad 

Para el modelo I de ANOVA, la falta de normalidad no es importante, en tanto ese
alejamiento no sea extremo. La kurtosis es más importante que la asimetría en
términos de efectos sobre las inferencias (Figura \@ref(fig:kurtosis)).

La prueba F es poco afectada por la falta de normalidad, ya sea en términos del
nivel de significación o de la potencia de la prueba. Para el Modelo II de
ANOVA, la falta de normalidad tiene serias implicaciones.


<div class="figure">
<img src="anova_files/figure-epub3/kurtosis-1.png" alt="Funciones de densidad para curvas asimétrica, mesocúrtica, leptocúrtica, platicúrtica"  />
<p class="caption">(\#fig:kurtosis)Funciones de densidad para curvas asimétrica, mesocúrtica, leptocúrtica, platicúrtica</p>
</div>


#### Heterogeneidad de varianzas

Para el modelo de efectos fijos, la prueba de F es ligeramente afectada si los
tamaños muestrales son iguales o no difieren mucho. La prueba de F y los
análisis relacionados son robustos frente a la heterogeneidad de varianzas
cuando los tamaños muestrales son aproximadamente iguales.

Para el modelo de efectos aleatorios, la heterogeneidad de varianzas puede tener
efectos pronunciados sobre las inferencias acerca de los componentes de la
varianza, aun con tamaños muestrales iguales.

#### Independencia de los términos del error

La falta de independencia puede tener serios efectos sobre las inferencias en el
análisis de la varianza, para el modelo de efectos fijos y para el de efectos
aleatorios.

## Formulación Del Modelo I De ANOVA. 


Denotaremos por I el número de niveles del factor bajo estudio, y denotaremos
cualquiera de estos niveles por el subíndice $i\ (i\  = \ 1,\ 2,\ \ldots,\
I)$. El número de casos para el i-ésimo nivel del factor es simbolizado por
$n_{i}$, y el número total de casos en el estudio es denotado por $N$,
donde:

$$
N = \sum_{i = 1}^{I}n_{i}
$$

Además, $Y_{ij}$ denotará la j-ésima observación para el i-ésimo nivel del
factor. Dado que el número de casos para el i-ésimo nivel del factor es denotado
por $n_{i}$, tendremos $j\  = \ 1,\ 2,\ \ldots,\ n_{i}$.

El modelo I de ANOVA se puede plantear como sigue:

$$
y_{ij} = u_{i} + \varepsilon_{ij}
$$

donde:

-   $y_{ij}$ es el valor de la j-ésima observación para el i-ésimo nivel del
    factor o tratamiento.

-   $\mu_{i}$ es un parámetro

-   $\varepsilon_{ij}$ son variables independientes $N(0,\sigma^{2})$

-   $i = 1,\ 2,\ldots,I;j = 1,\ 2,\ \ldots,\ n_{i}$

### Características importantes del modelo

El valor observado de $Y$ en el j-ésimo ensayo del i-ésimo nivel del factor o
tratamiento es la suma de dos componentes: a) un término constante $\mu_{i}$,
y b) un término del error aleatorio $\varepsilon_{ij}$.

Dado que $E\left( \varepsilon_{ij} \right) = 0$, se sigue que:

$$
E\left( Y_{ij} \right) = \mu_{i}
$$

Dado que $\mu_{i}$ es una constante, se sigue que:

$$
V\text{ar}\left( Y_{ij} \right) = V\text{ar}\left( \varepsilon_{ij} \right) = \sigma^{2}
$$

Así como cada $\varepsilon_{ij}$ esta normalmente distribuido, también lo está
cada $Y_{ij}$.

Se asume que los términos del error son independientes

El modelo de ANOVA puede ser re-enunciado como:

$$
Y_{ij}\sim N(\mu_{i},\sigma^{2})
$$

### Interpretación De Las Medias De Los Niveles Del Factor

**Datos observacionales**: la media del nivel del factor $\mu_{i}$ corresponde
a las medias para las diferentes poblaciones del nivel del factor.

**Datos Experimentales**: la media del nivel del factor $\mu_{i}$ representa
la media de la respuesta que debería obtenerse si el i-ésimo tratamiento fuera
aplicado a todas las unidades en la población de las unidades experimentales
sobre las cuales se harán las inferencias.

### Ajustando El Modelo

Supongamos que tenemos $I$ tratamientos o niveles de un factor y que aplicamos
cada uno de ellos a un grupo de unidades experimentales.Los datos se podrían
consignar de la siguiente forma:



|  Tratamientos                                    | $T_{1}$                                  | $T_{2}$                                  | $\ldots$ | $T_{i}$                                            | $\ldots$ | $T_{I}$                                            |                                                                                                |
|--------------------------------------------------|----------------------------------------|----------------------------------------|---------|--------------------------------------------------|---------|--------------------------------------------------|------------------------------------------------------------------------------------------------|
|                                                  | $y_{1\mathbf{1}}$                       | $y_{2\mathbf{1}}$                       | $\ldots$ | $y_{i1}$                                           | $\ldots$ | $y_{I1}$                                           |                                                                                                |
|                                                  | $y_{1\mathbf{2}}$                       | $y_{2\mathbf{2}}$                       | $\ldots$ | $y_{i2}$                                           | $\ldots$ | $y_{I2}$                                           |                                                                                                |
|                                                  | $\vdots$                                | $\vdots$                                | $\ddots$ | $\vdots$                                          | $\ldots$ | $\vdots$                                          |                                                                                                |
|                                                  | $y_{1j}$                                 | $y_{2j}$                                 | $\ldots$ | $y_{i\mathbf{j}}$                                 | $\ldots$ | $y_{I\mathbf{j}}$                                 |                                                                                                |
| $\sum_{j = \mathbf{1}}^{n_{i}}y_{i\mathbf{j}}$ | $\sum_{j = \mathbf{1}}^{n_{1}}y_{1j}$ | $\sum_{j = \mathbf{1}}^{n_{2}}y_{2j}$ | $\ldots$ | $\sum_{j = \mathbf{1}}^{n_{i}}y_{i\mathbf{j}}$ | $\ldots$ | $\sum_{j = \mathbf{1}}^{n_{I}}y_{I\mathbf{j}}$ | $\sum_{j = \mathbf{1}}^{I}y_{i\mathbf{j}}$                                                   |
|                                                  | $n_{1}$                                  | $n_{2}$                                  | $\ldots$ | $n_{i}$                                            | $\ldots$ | $n_{I}$                                            | $\sum_{i = \mathbf{1}}^{I}n_{i} = N$                                                          |
| $\overline{y_{i\bullet}}$                  | $\overline{y_{1.}}$        | $\overline{y_{2.}}$        | $\ldots$ | $\overline{y_{i\bullet}}$                  | $\ldots$ | $\overline{y_{I.}}$                  | $\frac{\sum_{i\mathbf{j}}^{N}y_{i\mathbf{j}}}{N} = \overline{y_{\bullet\bullet}}$ |
|                                                  | $S_{1}^{2}$                             | $S_{2}^{2}$                             | $\ldots$ | $S_{i}^{2}$                                       | $\ldots$ | $S_{I}^{2}$                                       |                                                                                                |

donde

$T_{i}$ es el tratamiento o nivel del factor $i$; con $i\  = \ 1,\ 2,\ldots,I$

$y_{ij}$ es la observación sobre la unidad experimental$\ j$ con el
tratamiento $i$; $\ j\  = \ 1,2,\ \ldots,\ n_{i}\$.

$N$ tamaño de la muestra

${\overline{y}}_{i \bullet}$ es la media muestral de cada
tratamiento.

$n_{i}$ es el número de observaciones con el tratamiento $i$

${\overline{y}}_{\bullet \bullet}$ es la media total, para todas
las observaciones.

$S_{i}^{2}$ es la varianza muestral para el tratamiento $i$

### Estimadores De Mínimos Cuadrados

De acuerdo al criterio de mínimos cuadrados la suma de los cuadrados de las
desviaciones de las observaciones alrededor de sus valores esperados puede ser
minimizada con respecto a los parámetros. Para un modelo de ANOVA, tenemos que:

$$
E\left( Y_{ij} \right) = \mu_{i}
$$

Así, la cantidad a ser minimizada es:

$$
\sum_{i}^{}{\sum_{j}^{}\left( y_{ij} - \mu_{i} \right)^{2}}
$$

Esta expresión se puede escribir como:

$$
\sum_{j}^{}\left( y_{1j} - \mu_{1} \right)^{2} + \sum_{j}^{}\left( y_{2j} - \mu_{2} \right)^{2} + \ldots + \sum_{j}^{}\left( y_{Ij} - \mu_{I} \right)^{2}
$$

La media muestral minimiza una suma de desviaciones al cuadrado


\begin{equation}
  \hat{\mu_{i}} = \overline{y}_{i\bullet}
  (\#eq:minimoscuadrados)
\end{equation}


#### Comentarios

1.  Los estimadores de mínimos cuadrados \@ref(eq:minimoscuadrados) son también
    estimadores de máxima verosimilitud para el error normal
    ($\varepsilon_{ij}$) del modelo de ANOVA.

2.  Para derivar el estimador de mínimo cuadrados de $u_{i}$ , es necesario
    minimizar, con respecto a $u_{i}$, el i-ésimo componente de la suma de
    cuadrados en:

$$
\sum_{j}^{}\left( y_{ij} - \mu_{i} \right)^{2}
$$

Diferenciando con respecto a $\mu_{i}$, se obtiene:

$$
\frac{\partial\sum_{j}^{}\left( y_{ij} - \mu_{i} \right)^{2}}{\partial\mu_{i}} = \sum_{}^{}{- 2\left( y_{ij} - \mu_{i} \right)}
$$

Esta derivada se iguala a cero y se reemplaza el parámetro $\mu_{i}$ por su
estimador:

$$
- 2\sum_{j = 1}^{n_{i}}\left( y_{ij} - \mu_{i} \right) = 0
$$

$$
\sum_{j = 1}^{n_{i}}y_{ij} = n_{i}\hat{\mu_{i}}
$$

$$
\hat{\mu_{i}} = \overline{Y}_{i\bullet}
$$

## Partición De La Suma De Cuadrados Total


La variabilidad total de las observaciones $y_{ij}$, sin usar la
información sobre los niveles del factor, es medida en términos de la desviación
de cada observación $y_{ij}$ alrededor de la media total
${\overline{y}}_{\bullet\bullet}$:

$$
y_{ij} - {\overline{y}}_{\bullet\bullet}
$$

Cuando se utiliza la información sobre los niveles del factor, las desviaciones
son aquellas de cada observación $y_{ij}$ alrededor de su respectiva
media estimada ${\overline{y}}_{\text{i}\bullet}$:

$$
y_{ij} - {\overline{y}}_{\text{i}\bullet}
$$

La diferencia entre la desviación total y la desviación anterior refleja la
diferencia entre la media estimada del nivel del factor y la media total:

$$
{(y}_{ij} - {\overline{y}}_{\bullet\bullet}) - (y_{ij} - {\overline{y}}_{i}) = {\overline{y}}_{\text{i}\bullet} - {\overline{y}}_{\bullet\bullet}
$$

Así, la desviación total $y_{ij} - {\overline{y}}_{\bullet\bullet}$ puede
ser vista como la suma de dos componentes:

La desviación de la media estimada del nivel del factor alrededor de la media
total.

La desviación de $y_{ij}$ alrededor de la media de su nivel del factor.
Esta desviación es simplemente el residuo $\varepsilon_{ij}$ .

Elevando al cuadrado se obtiene:

$$
\sum_{i}^{}{\sum_{j}^{}\left( y_{ij} - {\overline{y}}_{\bullet\bullet} \right)^{2}} = \sum_{i}^{}{n_{i}\left( {\overline{y}}_{\text{i}\bullet} - {\overline{y}}_{\bullet\bullet} \right)^{2}} + \sum_{i}^{}{\sum_{j}^{}\left( y_{ij} - {\overline{y}}_{\text{i}\bullet} \right)^{2}}
$$

El primer miembro de igualdad representa la variabilidad total de las
$y_{ij}$ observaciones y es denotado como la *suma de cuadrados total
(*$SCT$*)*:

$$
SC_T = \sum_{i}^{}{\sum_{j}^{}\left( y_{ij} - {\overline{y}}_{\bullet\bullet} \right)^{2}}
$$

El primer término del segundo miembro de la igualdad será indicado como
$SCE$, la *suma de cuadrados entre* tratamientos:

$$
SC_E = \sum_{i}^{}{n_{i}\left( y_{\text{i}\bullet} - {\overline{y}}_{\bullet\bullet} \right)^{2}}
$$

El segundo término se indica como $SCD$, la *suma de cuadrados dentro* de
tratamientos o la *suma de cuadrados del error*.

$$
SC_D = \sum_{i}^{}{\sum_{j}^{}\left( y_{ij} - {\overline{y}}_{\text{i}\bullet} \right)^{2}} = \sum_{i}^{}{\sum_{j}^{}\varepsilon_{ij}^{2}}
$$

Así, podemos escribir:

$$
SCT\  = \ SCE\  + \ SCD
$$

La suma total de los cuadrados para el modelo de análisis de la varianza se
compone en consecuencia de dos partes.

### Fórmulas computatorias

$$
\begin{matrix}
SC_T = \sum_{i}^{}{\sum_{j}^{}{y_{ij}^{2} - N{\overline{y}}_{\bullet\bullet}^{2}}} \\
SC_E = \sum_{i}^{}{n_{i}y_{\text{i}\bullet}^{2} - N{\overline{y}}_{\bullet\bullet}^{2}} \\
SC_D = \sum_{i}^{}{\sum_{j}^{}{y_{ij}^{2} - n_{i}{\overline{y}}_{\text{i}\bullet}^{2}}} = SC_T - SC_E \\
\end{matrix}
$$

## Grados De Libertad


Correspondiendo a la descomposición de la suma de cuadrados total, se puede
obtener los grados de libertad asociados.

La $SCT$ tiene $(N -\ 1)$ grados de libertad asociados. Hay en conjunto N
desviaciones $Y_{ij} - {\overline{Y}}_{\bullet\bullet}$ , pero un grado de
libertad se pierde debido a que las desviaciones no son independientes a causa
de que la suma de ellas debe ser cero. 

$\sum_{i}^{}{\sum_{j}^{}\left(y_{ij} - {\overline{y}}_{\bullet\bullet} \right)} = 0$

La $SCE$ (entre tratamientos) tiene $(I -\ 1)$ grados de libertad
asociados. Hay I desviaciones de las medias de los niveles de los factores
${\overline{Y}}_{\text{i}\bullet} - {\overline{Y}}_{\bullet\bullet}$, pero un grado de
libertad se pierde porque las desviaciones no son independientes a causa de que
la suma pesada debe ser cero. $\sum_{i}^{}{n_{i}\left( y_{\text{i}\bullet} -
{\overline{y}}_{\bullet\bullet} \right) = \ 0}$.

La $SCD$ tiene $(N -\ I)$ grados de libertad asociados. Esto puede verse
considerando el componente de la $SCD$ para el i-ésimo nivel del factor:

$$
\sum_{j}^{}\left( y_{ij} - {\overline{y}}_{\text{i}\bullet} \right)^{2}
$$

La expresión es equivalente a la suma de cuadrados total considerando sólo el
i-ésimo nivel del factor. Así, hay $n_{i}\  - \ 1$ grados de libertad
asociados con esta suma de cuadrados. De esta forma la $SCD$ es una suma de
sumas de cuadrados, los grados de libertad asociados son la suma de los grados
de libertad de sus términos:

$$
(n_{1}\  - \ 1)\  + \ (n_{2}\  - \ 1)\  + \ \ldots\  + \ (n_{I}\  - \ 1)\  = \ N-\ I
$$

Los grados de libertad, al igual que la suma de cuadrados, son aditivos.

## Cuadrados Medios


Los cuadrados medios se obtienen dividiendo la suma de cuadrados por sus grados
de libertad asociados. Se tiene:

$$
\begin{matrix}
CM_E = \frac{SC_E}{I - 1} \\
 \\
CM_D = \frac{SC_D}{N - I} \\
\end{matrix}
$$

$CM_E$, es el cuadrado medio entre los tratamientos.

$CM_D$, es el cuadrado medio dentro de los tratamientos o del error.

### Esperanza de los Cuadrados Medios

Los valores esperados del $CM_D$ y $CM_E$ pueden ser vistos como:

$$
E\left( CM_D \right) = \sigma^{2}
$$


\begin{equation}
E\left( CM_E \right) = \sigma^{2} + \frac{\sum_{}^{}{n_{i}\left( \mu_{i} - \mu_{\bullet} \right)^{2}}}{I - 1}
  (\#eq:eCM-E)
\end{equation}



donde

$$
\mu_{\bullet} = \frac{\sum_{}^{}{n_{i}\mu_{i}}}{N}
$$

1.  El $CM_D$ es un estimador insesgado de la varianza del error llamado
    $\varepsilon_{ij}$, tanto si las medias $u_{i}$ son iguales como
    si no.

2.  Cuando todas las medias $\mu_i$ de los niveles del factor son iguales y por lo
    tanto iguales a la media pesada $\mu_{\bullet}$, entonces$\ E(CM_E) = \sigma^{2}$ dado
    que el segundo término se vuelve cero. Cuando las medias de los niveles del
    factor no son iguales, el $CM_E$ tiende en promedio a ser mayor que el $CM_D$,
    dado que el segundo término de la Ecuación \@ref(eq:eCM-E) será positivo. Esto es
    intuitivamente razonable, como se ilustra en la figura para cuatro tratamientos.
    En la situación planteada se asume que todos los tamaños muestrales son iguales,
    o sea$\ n_{i} = n$. Cuando todos los $\mu_{i}$ son iguales, entonces todos lo
    $\overline{Y}_{i\bullet}$ siguen la misma distribución en el muestreo, con
    una media$\mu_{c}$ y una varianza $\sigma^{2}/n$. Cuando las $\mu_{i}$ no son
    iguales, por otro lado, las$\ {\overline{Y}}_{\text{i}\bullet}$ siguen diferentes
    distribuciones en el muestreo, cada una con la misma variabilidad 
    $\sigma^{2}/n$ pero centradas sobre medias diferentes $\mu_{i}$ 
    (Figura \@ref(fig:distr-normales)).

En consecuencia, los ${\overline{Y}}_{\text{i}\bullet}$ tenderán a diferir unos de
otros tanto si los $\mu_i$ difieren como si son iguales, y en consecuencia la
$SCE$ tenderá a ser mayor cuando las medias de los niveles de los factores
no son las mismas que cuando ellas son iguales. Esta propiedad de la $SCE$
es utilizada en la construcción de la prueba estadística para determinar si las
medias de los niveles del factor son iguales o no. Si la $SCE$ y la
$SCD$ son de la misma magnitud, esto sugiere que las medias µi de los
niveles del factor son iguales. Si la $SCE$ es substancialmente mayor que la
$SCD$, esto sugeriría que los $\mu_i$ no son iguales.

### Comentarios

1.  Para encontrar el valor esperado del $CM_D$, se ve que puede ser
    expresado como sigue:

$$
\begin{matrix}
CM_D\  = \frac{1}{N - I}\sum_{i}^{}{\sum_{j}^{}\left( Y_{ij} - {\overline{Y}}_{\text{i}\bullet} \right)^{2}} \\
 = \frac{1}{N - I}\sum_{i}^{}\left\lbrack \left( n_{i} - 1 \right)\frac{\sum_{j}^{}\left( Y_{ij} - {\overline{Y}}_{\text{i}\bullet} \right)^{2}}{\left( n_{i} - 1 \right)} \right\rbrack \\
\end{matrix}
$$

  Indicamos la varianza muestral de las observaciones para el i-ésimo nivel del
  factor como $s_{i}^{2}$:

$$
s_{i}^{2} = \frac{\sum_{j}^{}\left( Y_{ij} - {\overline{Y}}_{\text{i}\bullet} \right)^{2}}{n_{i} - 1}
$$

  Por lo tanto, el $CM_D$ puede ser expresado de la siguiente forma:

$$
CM_D = \frac{1}{N - I}\sum_{i}^{}{\left( n_{i} - 1 \right)s_{i}^{2}}
$$

  Dado que la varianza muestral es un estimador insesgado de la varianza
  poblacional, la cual es $\sigma^{2}$ para todos los niveles del factor, se
  obtiene:

$$
\begin{aligned}
E\left( CM_D \right)& = \frac{1}{N - I}\sum_{i}^{}{\left( n_{i} - 1 \right)E\left( s_{i}^{2} \right)} \\
& = \frac{1}{N - I}\sum_{i}^{}{\left( n_{i} - 1 \right)\sigma^{2}} \\
& = \sigma^{2} \\
\end{aligned}
$$

2.  Se puede derivar el valor esperado de la $CM_E$ para el caso
    especial en que todos los tamaños muestrales ni son los mismos, o sea 
    $n_i = n$. El resultado general para este caso especial:

$$
E\left( CM_E \right) = \sigma^{2} + \frac{n\sum_{}^{}\left( \mu_{i} - \mu_{\bullet} \right)^{2}}{I - 1}\text{ cuando}\ n_{i} = n
$$

  De esta forma, cuando todos los tamaños muestrales de los niveles del factor
  son $n$, el $CM_E$ se vuelve:

$$
CM_E = \frac{n\sum_{}^{}\left( {\overline{Y}}_{\text{i}\bullet} -
{\overline{Y}}_{\bullet\bullet} \right)^{2}}{I - 1}\text{ cuando }n_{i} = n
$$

  Para derivar el $E(CM_D)$, se considera el modelo:

$$
Y_{ij}\  = \ u_{i}\  + \ \varepsilon_{ij}
$$

  Promediando el $Y_{ij}$ para el i-ésimo nivel del factor, se
  obtiene:

$$
{\overline{Y}}_{i \bullet} = \mu_{i} + {\overline{\varepsilon}}_{i \bullet}
$$

donde ${\overline{\varepsilon}}_{i \bullet}$ es el promedio de los
$\varepsilon_{ij}$ para el i-ésimo nivel del factor:

$$
{\overline{\varepsilon}}_{\text{i}\bullet} = \frac{\sum_{j}^{}\varepsilon_{ij}}{n}
$$

  Promediando los $Y_{ij}$ sobre todos los niveles del factor, se
  obtiene:

$$
{\overline{Y}}_{\bullet\bullet} = \mu_\bullet + {\overline{\varepsilon}}_{\bullet \bullet}
$$

  donde $\mu_{\bullet}$ para $n_{i} = n$:

$$
\mu_{\bullet} = \frac{n\sum_{}^{}\mu_{i}}{\text{nI}} = \frac{\sum_{}^{}\mu_{i}}{I}\text{ donde}\ n_{i} = n
$$

  y ${\overline{\varepsilon}}_{\bullet\bullet}$ es el promedio de todos los
  $\varepsilon_{ij}$ :

$$
{\overline{\varepsilon}}_{\bullet\bullet} = \frac{\sum_{}^{}{\sum_{}^{}\varepsilon_{ij}}}{\text{nI}}
$$

  Cuando los tamaños muestrales son iguales, se tiene:

$$
{\overline{Y}}_{\bullet \bullet} = \frac{\sum_{}^{}Y_{\text{i}\bullet}}{I}\ \ \ \ {\overline{\varepsilon}}_{\bullet \bullet} = \frac{\sum_{}^{}\varepsilon_{\text{i}\bullet}}{I}
$$

  Operando se obtiene:

$$
{\overline{Y}}_{\text{i}\bullet} - {\overline{Y}}_{\bullet \bullet} = \left( \mu_{i} + {\overline{\varepsilon}}_{\text{i}\bullet} \right) - \left( \mu_{\bullet} + {\overline{\varepsilon}}_{\bullet \bullet} \right) = \left( \mu_{i} - \mu_{\bullet} \right) + \left( {\overline{\varepsilon}}_{\text{i}\bullet} - {\overline{\varepsilon}}_{\bullet \bullet} \right)
$$

  Elevando al cuadrado y sumando sobre los niveles del factor, se obtiene:

$$\sum_{}^{}\left( {\overline{Y}}_{\text{i}\bullet} - {\overline{Y}}_{\bullet \bullet}
\right)^{2} = \sum_{}^{}\left( \mu_{i} - \mu_{\bullet} \right)^{2} +
\sum_{}^{}\left( {\overline{\varepsilon}}_{\text{i}\bullet} -
{\overline{\varepsilon}}_{\bullet \bullet} \right)^{2} + 2\sum_{}^{}\left(
\mu_{i} - \mu_{\bullet \bullet} \right)\left(
{\overline{\varepsilon}}_{\text{i}\bullet} - {\overline{\varepsilon}}_{\bullet
\bullet} \right)$$

  Se desea encontrar el $E\left\{ \sum_{}^{}\left( {\overline{Y}}_{\text{i}\bullet}
  - {\overline{Y}}_{\bullet \bullet} \right)^{2} \right\}$, y por lo tanto se
  necesita encontrar el valor esperado de cada uno de los términos de la
  derecha:

3.  Dado que $\sum_{}^{}\left( \mu_{i} - \mu_{\bullet} \right)^{2}$ es una
    constante, su valor esperado es:

$$
E\left\{ \sum_{}^{}\left( \mu_{i} - \mu_{\bullet} \right)^{2} \right\} = \sum_{}^{}\left( \mu_{i} - \mu_{\bullet} \right)^{2}
$$

4.  Antes de encontrar el valor esperado del segundo término de la derecha,
    consideremos la expresión:

$$
\frac{\sum_{}^{}\left( {\overline{\varepsilon}}_{\text{i}\bullet} - \overline{\varepsilon}_{\bullet\bullet} \right)^{2}}{I - 1}
$$

  Esto es una varianza muestral, dado que
  ${\overline{\varepsilon}}_{\bullet\bullet}$ es la media muestral de los I
  términos ${\overline{\varepsilon}}_{\text{i}\bullet}$. Se sabe que la varianza
  muestral es un estimador insesgado de la varianza de la variable, en este
  caso de ${\overline{\varepsilon}}_{\text{i}\bullet}$. Pero
  ${\overline{\varepsilon}}_{\text{i}\bullet}$ es la media de n términos
  independientes del error $\varepsilon_{ij}$. Así:

$$
\text{Var}\left( {\overline{\varepsilon}}_{\text{i}\bullet} \right) = \frac{\text{Var}\left( \varepsilon_{ij} \right)}{n} = \frac{\sigma^{2}}{n}
$$

  Por lo tanto:

$$
E\left\{ \frac{\sum_{}^{}\left( {\overline{\varepsilon}}_{i\bullet} - {\overline{\varepsilon}}_{\bullet\bullet} \right)^{2}}{I - 1} \right\} = \frac{\sigma^{2}}{n}
$$

  en consecuencia:

$$
E\left\{ \sum_{}^{}\left( {\overline{\varepsilon}}_{\text{i}\bullet} - {\overline{\varepsilon}}_{\bullet \bullet} \right)^{2} \right\} = \frac{\left( I - 1 \right)\sigma^{2}}{n}
$$

5.  Dado que tanto ${\overline{\varepsilon}}_{\text{i}\bullet}$ como
    ${\overline{\varepsilon}}_{\bullet\bullet}$ son medias de los
    $\varepsilon_{ij}$ , los cuales tiene un valor esperado, se sigue
    que:

$$
E\left( {\overline{\varepsilon}}_{\text{i}\bullet} \right) = 0\ E\left( {\overline{\varepsilon}}_{\bullet \bullet} \right) = 0
$$

  por tanto:

$$
E\left\{ 2\sum_{}^{}{\left( \mu_{i} - \mu_{\bullet} \right)\left( {\overline{\varepsilon}}_{i\bullet} - {\overline{\varepsilon}}_{\bullet \bullet} \right)} \right\} = 2\sum_{}^{}\left( \mu_{i} - \mu_{\bullet} \right)E\left( {\overline{\varepsilon}}_{\text{i}\bullet} - {\overline{\varepsilon}}_{\bullet \bullet} \right) = 0
$$

  Ya se ve que:

$$
E\left\{ \sum_{}^{}\left( {\overline{Y}}_{\text{i}\bullet} - {\overline{Y}}_{\bullet\bullet} \right)^{2} \right\} = \sum_{}^{}\left( \mu_{i} - \mu_{\bullet} \right)^{2} + \frac{\left( I - 1 \right)\sigma^{2}}{n}
$$

  Entonces:

$$
\begin{matrix}
\begin{split}
E\left( CM_E \right)& = E\left\{ \frac{n\sum_{}^{}\left( {\overline{Y}}_{\text{i}\bullet} - {\overline{Y}}_{\bullet \bullet} \right)^{2}}{I - 1} \right\} = \frac{n}{I - 1}\left\lbrack \sum_{}^{}{\left( \mu_{i} - \mu_{\bullet} \right)^{2} + \frac{\left( I - 1 \right)\sigma^{2}}{n}} \right\rbrack \\
& = \sigma^{2} + \frac{n\sum_{}^{}\left( \mu_{i} - \mu_{\bullet} \right)^{2}}{I - 1} \\
\end{split} \\
 \\
\end{matrix}
$$

TABLA DE ANÁLISIS DE LA VARIANZA

*ANOVA de un factor*

| Fuente de variación            | SC                                                                                              | GL          | CM                                             | E(CM)                                                                                  |
|--------------------------------|-------------------------------------------------------------------------------------------------|-------------|------------------------------------------------|----------------------------------------------------------------------------------------|
| Entre tratamientos             | ${\sum_{i}^{}{n_{i}\left( y_{\text{i}\bullet} - {\overline{y}}_{\bullet\bullet} \right)}}^{2}$       | $I\  - \ 1$ | $CM_E = \frac{SC_E}{I - 1}$ | $\sigma^{2} + \frac{1}{I - 1}\sum_{}^{}n_{i}\left( \mu_{i} - \mu_{\bullet} \right)^{2}$ |
| Error (dentro de tratamientos) | $\sum_{i}^{}{\sum_{j}^{}\left( y_{ij} - {\overline{y}}_{\text{i}\bullet} \right)^{2}}$ | $N- I$    | $CM_D = \frac{SC_D}{N - I}$ | $\sigma^{2}$                                                                           |
| Total                          | $\sum_{i}^{}{\sum_{j}^{}\left( y_{ij} - {\overline{y}}_{\bullet\bullet} \right)^{2}}$ | $N - 1$    |                                                |                                                                                        |

## Prueba F para la Igualdad de las Medias de los Niveles del Factor


Las conclusiones alternativas a ser consideradas son:

$$
\begin{aligned}
H_{0} &: u_{1} = u_{2} = \ldots = u_{I}\\
H_{a} &: \text{no todos los } \mu_{i}\ \text{son iguales}
\end{aligned}
$$

### Prueba Estadística

La prueba estadística a ser usada para elegir entre las hipótesis planteadas,
es:

$$
F^{*} = \frac{CM_E}{CM_D}
$$

La prueba apropiada es de una cola a la derecha.

### Distribución de $\mathbf{F}^{\mathbf{*}}$

Cuando todas las medias de los tratamientos son iguales, cada observación
$Y_{ij}$ tiene el mismo valor esperado. En vista de la aditividad de la
suma de cuadrados y de los grados de libertad, del teorema de Cochran se sigue
que:

Cuando $H_{0}$ se verifica, $SCE/\sigma^{2}$ y $SCD/\sigma^{2}$ son
variables distribuidas como $\chi^{2}$ independientes. Por lo tanto: cuando
$H_{0}$ se verifica, $F^{*}$ se distribuye como $F_{\left( I - \ 1
\right)\left( \ N\  - \ I \right)}$.

Si $H_{a}$ se verifica, esto es, si los $\mu_{i}$ no son todos iguales,
$F^{*}$ no sigue una distribución $F$. Es más, sigue una distribución
compleja llamada distribución $F_{ no\ central}$.

### Regla De Decisión

Dado que se sabe que $F^{*}$ se distribuye como $F_{\left( I - \ 1
\right)\left( \ N\  - \ I \right)}$. cuando se verifica $H_{0}$ y que grandes
valores de $F^{*}$ llevan a concluir $H_{a}$ , la regla de decisión para
controlar el nivel de significación $\alpha$ es:

Si $F^{*} \leq F_{(1 - \alpha;I - 1;\ N - I)}$ no se rechaza $H_{0}$.

Si $F^{*} > F_{(1 - \alpha;I - 1;\ N - I)}$ se rechaza $H_{0}$.

donde $F^{*} \leq F_{(1 - \alpha;I - 1;\ N - I)}$ es el percentil del $\left(
1 - \alpha \right) \times 100$ de la distribución de $F$.

### Comentario

Si hay sólo dos niveles del factor esto es $I = 2$, se ve fácilmente que la
prueba empleando $F^{*}$ es equivalente a la prueba de “$t$” a dos colas
para dos poblaciones. La prueba de $F$ tiene $(1,\ N - 2)$ grados de
libertad, y la prueba “$t$” tiene $(n_1 + n_2 -2)$ o $(N-2)$ grados de
libertad, así ambas pruebas conducen a regiones críticas equivalentes. Para
comparar las medias de dos poblaciones, la prueba de “$t$” debe preferirse.

## Formulación Alternativa Del Modelo I


**MODELO I DE ANOVA - MODELO DE LOS EFECTOS DEL FACTOR**

Con esta formulación las medias de los tratamientos son expresadas de un modo
equivalente por medio de la identidad:

$$
\mu_{i} \equiv \mu_{\bullet} + \left( \mu_{i} - \mu_{\bullet} \right)
$$

donde $u_{\bullet}$ es una constante. Se denotará la diferencia:

$$
(u_{i} - u_{\bullet}) = \alpha_{i}\ 
$$

esto implica que:

$u_{i} = u_{\bullet} + \alpha_{i}$

La diferencia $u_{i} = u_{\bullet} + \alpha_{i}$ es llamada el efecto del i-ésimo
nivel del factor.

El modelo I de ANOVA puede ser expresado como sigue:

$$
Y_{ij} = u_{\bullet} + \alpha_{i} + \varepsilon_{ij}
$$

donde:

$u_{\bullet}$ es una componente constante común a todas las observaciones.

$\alpha_{i}$ es el efecto del i-ésimo nivel del factor (constante para cada
nivel del factor)

$\varepsilon_{ij}$ son variables independientes que se distribuyen
$N(0,\ \sigma^{2})$

$$
i = 1,\ 2,\ldots,\ I;\ j = 1,\ 2,\ldots,\ n_{i}\ 
$$

El modelo de ANOVA es llamado el modelo de los efectos del factor pues se
expresa en términos de los efectos del factor $\alpha_{i}$ en distinción del
modelo de las medias de las celdas, el cual se expresa en términos de las medias
de los tratamientos.

El modelo de los efectos del factor es un modelo lineal, como su modelo
equivalente de las medias de las celdas.

### Definición de $\mathbf{\mu}_{\mathbf{\bullet}}$

**Medias no pesadas:** A menudo, una definición de $\mu_{\bullet}$ como un promedio
no pesado para todas las medias de los niveles del factor $\mu_{i}$ puede ser
útil:

$$
\mu_{\bullet} = \frac{\sum_{i = 1}^{I}\mu_{i}}{I}
$$

Esta definición implica que

$$
\sum_{i = 1}^{I}\alpha_{i} = 0
$$

pues:

$$
\sum_{}^{}\alpha_{i} = \sum_{}^{}\left( \mu_{i} - \mu_{\bullet} \right) = \sum_{}^{}\mu_{i} - I\mu_{\bullet}
$$

y

$$
\sum_{}^{}\mu_{i} = I\mu_{\bullet}
$$

Así la definición de la constante general $\text{μ.}$ implica una restricción
sobre los $\mu_{i}$, en este caso que su suma debe ser cero.

**Medias pesadas:** La constante $\text{μ.}$ también puede definirse como un
promedio pesado de las medias de los niveles del factor $\mu_{i}$:

$$
\mu_{\bullet} = \sum_{i = 1}^{I}{f_{i}\mu_{i}\ }
$$

donde los $f_{i}$ son pesos definidos tales que $\sum f_{i} = 1$ La
restricción sobre los $\alpha_{i}$ es entonces:

$$
\sum_{i = 1}^{I}{f_{i}\alpha_{i}\ } = 0
$$

La elección de los pesos $f_{i}$ puede depender de la significación de las
medidas resultantes de los efectos de los niveles del factor. Por ejemplo, los
pesos se pueden dar de acuerdo a: a) una medida conocida de importancia o b) de
acuerdo al tamaño muestral.

Cuando los tamaños muestrales son iguales se usa una media no pesada.

## Prueba Para La Igualdad De Las Medias De Los Niveles Del Factor


Dado que el modelo de efectos del factor es equivalente al modelo de las medias
de las celdas, la prueba para igualdad de las medias de los niveles del factor
es la misma prueba estadística $F^{*}$. La única diferencia está en el planteo
de las hipótesis. Para el modelo de las medias de las celdas las hipótesis son:

$$
\begin{aligned}
H_{0} &:\ u_{1} = u_{2} = \ldots = u_{I}\\
H_{a} &:\ \text{no todos los}\ u_{i}\ \text{son iguales}
\end{aligned}
$$

Para el modelo de los efectos del factor, estas mismas hipótesis en términos de
los efectos del factor son:

$$
\begin{aligned}
H_{0} &:\ \alpha_{1} = \alpha_{2} = \ldots = \alpha_{I} = 0\\
H_{a} &:\ \text{no todos los}\ \alpha_{i}\ \text{son iguales}
\end{aligned}
$$

## Análisis De Los Efectos Del Nivel Del Factor


Si la prueba de F lleva a la conclusión de que las medias de los niveles del
factor µi difieren, se sigue que hay una relación entre el factor y la variable
dependiente. En este caso, un análisis cuidadoso de la naturaleza de los efectos
de los niveles del factor es usualmente emprendido. Esto se hace de dos maneras:

1.  Un análisis directo de los efectos de los niveles de interés del factor
    usando técnicas de estimación.

2.  Pruebas estadísticas con respecto a los efectos de los niveles del factor de
    interés.

### Gráficos de las estimaciones de las medias de los niveles del factor

Se dispone de dos tipos de gráficos (1) una línea, la que es apropiada tanto si
los tamaños de las muestras $n_{i}$ son iguales como si no; y (2) un gráfico
de probabilidad normal, la que es apropiada si los tamaños de las muestras
$n_{i}$ no son iguales.

### Estimación de los efectos de los niveles del factor

Las estimaciones de los efectos de los niveles del factor usualmente empleadas
incluyen:

1.  Estimación de la media de un nivel del factor

2.  Estimación de la diferencia entre dos medias de dos niveles de un factor.

3.  Estimación de un contraste entre las medias de los niveles del factor.

4.  Estimación de una combinación lineal de las medias de los niveles del
    factor.

#### Estimación de la media del nivel del factor

Un estimador insesgado de la media del nivel del factor µi, fue obtenido como:

$$
{\hat{\mu}}_{i} = {\overline{Y}}_{i\bullet}
$$

Este estimador tiene media y varianza:

$$
\begin{aligned}
E\left( {\overline{Y}}_{i\bullet} \right) &= \mu_{i} \\
 \\
\text{Var}\left( {\overline{Y}}_{i\bullet} \right) &= \frac{\sigma^{2}}{n_{i}} \\
\end{aligned}
$$

El último resultado se sigue pues ${\overline{Y}}_{i}. = \mu_{i} +
{\overline{\varepsilon}}_{\text{i}\bullet}$, la suma de una constante a una
media de $n_{i}$ términos independientes $\varepsilon_{ij}$, cada uno
de los cuales tiene una varianza $\sigma^{2}$. En consecuencia 
${\overline{Y}} _{\text{i}\bullet}$ está normalmente distribuido pues los 
términos del error  $\varepsilon_{ij}$ son variables aleatorias normales e 
independientes.

La varianza estimada de ${\overline{Y}}_{\text{i}\bullet}$ se simboliza
$S^{2}({\overline{Y}}_{\text{i}\bullet})$

$$
S^{2} = \frac{CM_D}{n_{i}}
$$

Se puede demostrar que $\frac{{\overline{Y}}_{i\bullet} -
\mu_{i}}{\sqrt{\frac{CM_D}{n_{i}}}}$, se distribuye como $t_{N - I}$.

Se sigue que los límites del intervalo de confianza del $(1 - \alpha)$ para
$u_{i}$ son:

$$
{\overline{Y}}_{i\bullet} \pm t_{\left( 1 - \frac{\alpha}{2};N - I \right)}\sqrt{\frac{CM_D}{n_{i}}}
$$

#### Estimación de la diferencia entre dos medias de niveles del factor

Frecuentemente dos tratamientos o niveles de un factor son comparados por
estimación de la diferencia *D* entre las dos medias de los niveles del factor,
o sea, $u_{i}$ y $u_{i'}$:

$$
D = u_{i} - u_{i'}
$$

Tal comparación entre dos medias de niveles del factor será llamada comparación
de a pares. Un estimador puntual es:

$$
\overset{\land}{D} = {\overline{Y}}_{\text{i}\bullet} - {\overline{Y}}_{i'\bullet}
$$

Este estimador puntual es insesgado:

$$
E\left( \overset{\land}{D} \right) = \mu_{i} - \mu_{i'}
$$

Dado que ${\overline{Y}}_{\text{i}\bullet}$ y ${\overline{Y}}_{i'.}$ son
independientes, la varianza es:

$$
\text{Var}\overset{\land}{\left( D \right)} = Var\left( {\overline{Y}}_{\text{i}\bullet} \right) + Var\left( {\overline{Y}}_{i'.} \right) = \sigma^{2}\left( \frac{1}{n_{i}} + \frac{1}{n_{i'}} \right)
$$

La varianza estimada está dada por:

$$
S^{2}\left( \overset{\land}{D} \right) = CM_D\left( \frac{1}{n_{i}} + \frac{1}{n_{i'}} \right)
$$

$\overset{\land}{D}$ está normalmente distribuido por ser una combinación
lineal de variables independientes normales.

Se sigue, de estas características, que:

$\frac{\overset{\land}{D} - D}{S\left( \overset{\land}{D} \right)}\sim t_{N -
I}$ para el modelo de ANOVA

De esta manera un intervalo de confianza de $(1 - \alpha)$ para $D$ está
dado por:

$$
\overset{\land}{D} \pm t_{\left( 1 - \frac{\alpha}{2};N - I \right)}\sqrt{CM_D\left( \frac{1}{n_{i}} + \frac{1}{n_{i'}} \right)}
$$

#### Estimación de contrastes

Un contraste es una comparación que involucra a dos o más medias e incluye al
caso anterior de comparación de la diferencia entre un par de medias. Un
contraste se simboliza como f y es una combinación lineal de las medias de los
niveles del factor µi donde los coeficientes ci suman cero:

$$
f = \sum_{i = 1}^{I}c_{i}\mu_{i}\text{ donde}\sum_{i = 1}^{I}c_{i} = 0
$$

**Ejemplos**: Supongamos que estamos estudiando 4 niveles de un factor

$f = \mu_{1} - \mu_{2}$; aquí $c_{1} = 1$; $c_{2} = - 1$; $c_{3} = 0$ y
$c_{4} = 0$; y $\sum_{i = 1}^{4}c_{i} = 0$.

$f = \frac{\mu_{1} + \mu_{2}}{2} - \frac{\mu_{3} + \mu_{4}}{2}$; aquí $c_{1}\
= \frac{1}{2}$; $c_{2} = \frac{1}{2}$; $c_{3} = - \frac{1}{2}$ y $c_{4} =
- \frac{1}{2}$; y $\sum_{i = 1}^{4}c_{i} = 0$.

$f = \frac{\mu_{1} + \mu_{3}}{2} - \frac{\mu_{2} + \mu_{4}}{2}$; aquí $c_{1}
= \frac{1}{2}$; c2 = -1/2; $c_{3} = \frac{1}{2}$ y $c_{4} = - \frac{1}{2}$;
y $\sum_{i = 1}^{4}c_{i} = 0$.

Un estimador insesgado de un contraste $f$ es:

$$
\overset{\land}{f} = \sum_{i = 1}^{I}c_{i}{\overline{Y}}_{\text{i}\bullet}
$$

Dado que los ${\overline{Y}}_{\text{i}\bullet}$ son independientes, la varianza de
$\overset{\land}{f}$ es:

$$
\text{Var}\left( \overset{\land}{f} \right) = \sum_{i = 1}^{I}c_{i}^{2}\text{Var}\left( {\overline{Y}}_{i} \right) = \sum_{i = 1}^{I}c_{i}^{2}\left( \frac{\sigma^{2}}{n_{i}} \right) = \sigma^{2}\sum_{i = 1}^{I}\frac{c_{i}^{2}}{n_{i}}
$$

Un estimador insesgado de esta varianza es:

$$
S^{2}\left( \overset{\land}{f} \right) = CM_D\sum_{i = 1}^{I}\frac{c_{i}^{2}}{n_{i}}
$$

$\overset{\land}{f}$ está normalmente distribuida pues es una combinación
lineal de variables independientes normalmente distribuidas. Se puede demostrar
que:

$\frac{\overset{\land}{f} - f}{\sqrt{CM_D\sum_{i =
1}^{I}\frac{c_{i}^{2}}{n_{i}}}}\sim t_{\left( N - I \right)}$ para el modelo de
ANOVA

### Comparaciones múltiples

1.  Planeados o A Priori: Se proponen antes de ver los resultados del
    experimento, pueden ser significativos aunque el ANOVA no dé significativo.

2.  No Planeados o A Posteriori: Se plantean a la vista de los resultados, se
    hacen sólo si el ANOVA da significativo.

#### Planeados

1) *LSD*: el criterio de la prueba para examinar si existen diferencias
significativas entre medias se llama diferencia mínima significativa y se
simboliza $\text{LSD}$:

$$
\begin{aligned}
\text{LSD}_{\alpha}& = t_{\left( \alpha\left( 2 \right);N - I \right)}\sqrt{CM_D\left( \frac{1}{n_{i}} + \frac{1}{n_{i^{'}}} \right)} \\
& = t_{\left( \alpha\left( 2 \right);N - I \right)}\sqrt{CM_D\left( \frac{2}{n} \right)}\text{ para }n_{i} = n\ \forall\ i \\
\end{aligned}
$$

Se calcula$\left| {\overline{Y}}_{\text{i}\bullet} - {\overline{Y}}_{i'.} \right|$ y
este valor se compara con $\text{LSD}$, en caso de que el primero sea mayor
las diferencias son significativas.

2) *Método de Bonferroni o método “t”*: Este método es aplicable ya sea que los
tamaños muestrales sean iguales o no; o si se hacen comparaciones de a pares o
contrastes.

*  Un contraste

$$
f = \sum_{i = 1}^{I}{c_{i}\mu_{i\bullet}}
$$

estimo por medio de

$$
\overset{\land}{f} = \sum_{i = 1}^{I}{c_{i}{\overline{y}}_{i\bullet}}
$$

$$
H_{0f}:\ f = 0
$$

$$
\begin{aligned}
\text{Var}\left( \overset{\land}{f} \right) &= \text{Var}\left( \sum_{}^{}{c_{i}{\overline{y}}_{i\bullet}} \right) \\
 &= \sum_{}^{}c_{i}^{2}\text{Var}\left( {\overline{y}}_{i\bullet} \right) \\
 &= \sum_{}^{}c_{i}^{2}\frac{\overset{\land}{\sigma^{2}}}{n} \\
 &= \overset{\land}{\sigma^{2}}\sum_{i}^{}\frac{c_{i}^{2}}{n_{i}} \\
 &= CM_D\sum_{i}^{}\frac{c_{i}^{2}}{n_{i}} \\
 \Rightarrow \text{ES}\left( \overset{\land}{f} \right) &= \sqrt{CM_D\sum_{i}^{}\frac{c_{i}^{2}}{n_{i}}} \\
\end{aligned}
$$

* Intervalo de confianza

$$
\begin{matrix}
\overset{\land}{f} \pm t_{\alpha(2);N - I}\sqrt{CM_D\sum_{i}^{}\frac{c_{i}^{2}}{n_{i}}} \\
\text{Si}\ 0 \in \left\lbrack \ \right\rbrack \Rightarrow no\ rechazo\ H_{0} \\
\varepsilon = \frac{\overset{\land}{f}}{\sqrt{CM_D\sum_{i}^{}\frac{c_{i}^{2}}{n_{i}}}} \\
\text{VC} = t_{\alpha(2);N - I} \\
\text{Si }\varepsilon > \text{VC} \Rightarrow rechazo\ H_{0} \\
\end{matrix}
$$

*  $m$ contrastes $f_{1},\ f_{2},\ \ldots,\ f_{m}$

Se fija el número de contrastes a realizarse, junto con el experimento, *m*
contrastes. Se toma como nivel para cada contraste $\frac{\alpha}{m} =
\alpha_{i} \Rightarrow \sum_{i}^{}\alpha_{i} = \alpha$.

* Intervalo de confianza

$$
{\overset{\land}{f}}_{i} \pm t_{\frac{\alpha}{m}(2);N - I}\sqrt{CM_D\sum_{i}^{}\frac{c_{i}^{2}}{n_{i}}}
$$

#### No Planeados: 

1) *Método de Scheffé*: Este método da, para cada contraste, intervalos de
confianza de la forma:

$$
\overset{\land}{f} \pm \text{VC}\ \text{ES}\left( \overset{\land}{f} \right)
$$

donde

$$
\begin{matrix}
\overset{\land}{f} = \sum_{i}^{}{c_{i}{\overline{y}}_{i\bullet}} \\
\text{VC} = \sqrt{\left( I - 1 \right)F_{I - 1;N - I;\alpha}} = S \\
\text{ES}\left( \overset{\land}{f} \right) = \sqrt{CM_D\sum_{i}^{}\frac{c_{\ _{i}}^{2}}{n_{i}}} \\
\end{matrix}
$$

Si usamos el estadístico

$\varepsilon = \frac{\overset{\land}{f}}{\text{ES}\left( \overset{\land}{f}
\right)}$ rechazo $H_{0}$ sí $\varepsilon > S$

2) *Método de Tukey*

Utiliza el método de rangos *studentizado*. Supongamos que se tiene $r$
observaciones independientes $Y_{1},\ \ldots,\ Y_{r}$ de una distribución
normal con media $u$ y varianza $\sigma^{2}$. Llamamos w al rango de estas
observaciones; así:

$$
w = max(Y_{i}) - min(Y_{i})
$$

Supongamos que se tiene una estimación $S^{2}$ de la varianza $\sigma^{2}$
la cual está basada sobre ν grados de libertad. El cociente $w/s$ es llamado
*rango studentizado* y se denota:

$$
q\left( r,\nu \right) = \frac{w}{S}
$$

$$
\begin{matrix}
\varepsilon = \frac{{\overline{y}}_{\text{i}\bullet\text{max}} - {\overline{y}}_{\text{i}\bullet\text{min}}}{S_{{\overline{y}}_{\bullet\bullet}}}\sim q_{I;N - I} \\
S_{{\overline{y}}_{\bullet\bullet}} = \sqrt{\frac{CM_D}{n}} \\
\end{matrix}
$$

Sólo se puede usar si los $n = n_{i}\ \forall\text{\ i}$. Si $\text{n\ } \neq
\ n_{i}$ se usa $n = min(n_{i}\ ,\ n_{j})$

Si el $\varepsilon > q_{I;N - I;\alpha\ }$, rechazo $H_{0}$.

#### Ni planeados ni no planeados

Contrastes Ortogonales: son contrastes tales que:

\begin{equation}
\begin{aligned} 
f = \sum{c_{i}\mu_{i}}\\ 
 \sum {c_{i}} &= 0 \\
 \sum{c_{i}^{j}c_{i}^{j'}} &= 0\ \forall j \neq j'
\end{aligned}
\end{equation}

donde $j$ y $j'$ son contrastes diferentes.

Para aplicar estos contrastes se supone que los $n_{i} = n\ \forall i$
; y que el número de contrastes ortogonales es el mismo que los grados de
libertad entre, es decir el número de tratamientos menos uno.

*Ejemplo:*

Supongamos que tenemos cuatro niveles de un factor

| T1 | T2 | T3 | T4 |
|----|----|----|----|


Entonces sólo se pueden hacer 3 contrastes. Sean, por ejemplo:

$$
\begin{aligned}
f_{1} &= \mu_{1} - \frac{\mu_{2}}{3} - \frac{\mu_{3}}{3} - \frac{\mu_{4}}{3} \\
f_{2} &= \mu_{3} - \mu_{4} \\
f_{3} &= \mu_{2} - \frac{\mu_{3}}{2} - \frac{\mu_{4}}{2} \\
c_{1} &= \begin{pmatrix}
1 & - \frac{1}{3} & - \frac{1}{3} & - \frac{1}{3} \\
\end{pmatrix} \\
c_{2} &= \begin{pmatrix}
0 & 0 & 1 & - 1 \\
\end{pmatrix} \\
c_{3} &= \begin{pmatrix}
0 & 1 & - \frac{1}{2} & - \frac{1}{2} \\
\end{pmatrix} \\
\end{aligned}
$$

Se puede comprobar que cada uno es un contraste porque $\sum{c_i}=0$ y
si hacemos la multiplicación de a pares se comprueba su ortogonalidad:

$$
\begin{aligned}
\sum{c_i^1c_i^2} &= 1 &\times & 0 & + & -\frac{1}{3} & \times & 0 & + & -\frac{1}{3} &\times & 1            & + & -\frac{1}{3} & \times & -1           &= 0 \\
\sum{c_i^1c_i^3} &= 1 &\times & 0 & + & -\frac{1}{3} & \times & 1 & + & -\frac{1}{3} &\times & -\frac{1}{2} & + & -\frac{1}{3} & \times & -\frac{1}{2} &= 0\\
\sum{c_i^2c_i^3} &= 0 &\times & 0 & + & 0            & \times & 1 & + & 1            &\times & -\frac{1}{2} & + & -1           & \times & -\frac{1}{2} &= 0
\end{aligned}
$$

Esto es equivalente a tener una matriz ortogonal de coeficientes. Para estudiar
la significación de los contrastes se debe encontrar un estadístico y compararlo
con algún valor crítico. La idea es descomponer la $SCE$ en $\text{SC}$
independientes cada un grado de libertad. En el ejemplo la $SCE$ se
descompone en:

$$
SCE\  = \ SC_{1,\ 2,\ 3,\ 4}\  + \ SC_{3,\ 4}\  + \ SC_{2,3,4}
$$

El procedimiento para calcular cada una de las sumas de cuadrados es:

$$
\begin{matrix}
SC_{f_{i}} = \frac{{\overset{\land}{f}}_{i}^{2}}{\frac{\sum_{}^{}c_{i}^{2}}{n}} = \frac{{\overset{\land}{f}}_{i}^{2}n}{\sum_{}^{}c_{i}^{2}} \\
\text{donde}\ {\overset{\land}{f}}_{i} = \sum_{}^{}c_{i}{\overline{Y}}_{\text{i}\bullet} \\
\end{matrix}
$$

El cociente

$$
\frac{SC_{f_{i}}}{CM_D}\sim F_{\ _{1,N - I;\alpha}}
$$

*Ejemplo 1.- Comparaciones*

Se midió el contenido de nitrógeno tres suelos.


```
## 
## Study: nitro_aov ~ "trt"
## 
## LSD t Test for nitro 
## 
## Mean Square Error:  274.3452 
## 
## trt,  means and individual ( 95 %) CI
## 
##     nitro      std r      LCL      UCL Min Max
## A 275.250 20.04816 8 263.0717 287.4283 242 300
## B 293.625 13.79376 8 281.4467 305.8033 282 320
## C 288.625 15.19340 8 276.4467 300.8033 264 314
## 
## Alpha: 0.05 ; DF Error: 21
## Critical Value of t: 2.079614 
## 
## least Significant Difference: 17.22271 
## 
## Treatments with the same letter are not significantly different.
## 
##     nitro groups
## B 293.625      a
## C 288.625     ab
## A 275.250      b
```



⇒ Existen diferencias entre los sitios A y B en lo que a contenido de nitrógeno
se refiere.

*Ejemplo 2.- Comparaciones a posteriori*

<div class="figure">
<img src="anova_files/figure-epub3/ratas-posteriori-1.png" alt="Presion de cuatro especies de ratas. media +- error estándar, n = 10." width="75%" />
<p class="caption">(\#fig:ratas-posteriori)Presion de cuatro especies de ratas. media +- error estándar, n = 10.</p>
</div>
**Test de Sheffé**


```
## 
## Study: ratas_aov ~ "especie"
## 
## Scheffe Test for presion 
## 
## Mean Square Error  : 9.25 
## 
## especie,  means
## 
##   presion      std  r Min Max
## A    84.5 3.922867 10  79  92
## B    88.0 2.748737 10  84  92
## C    91.1 2.378141 10  87  95
## D    88.8 2.898275 10  85  93
## 
## Alpha: 0.05 ; DF Error: 36 
## Critical Value of F: 2.866266 
## 
## Minimum Significant Difference: 3.988455 
## 
## Means with the same letter are not significantly different.
## 
##   presion groups
## C    91.1      a
## D    88.8      a
## B    88.0     ab
## A    84.5      b
```

**Test de Tukey**


```
## 
## Study: ratas_aov ~ "especie"
## 
## HSD Test for presion 
## 
## Mean Square Error:  9.25 
## 
## especie,  means
## 
##   presion      std  r Min Max
## A    84.5 3.922867 10  79  92
## B    88.0 2.748737 10  84  92
## C    91.1 2.378141 10  87  95
## D    88.8 2.898275 10  85  93
## 
## Alpha: 0.05 ; DF Error: 36 
## Critical Value of Studentized Range: 3.808798 
## 
## Minimun Significant Difference: 3.663185 
## 
## Treatments with the same letter are not significantly different.
## 
##   presion groups
## C    91.1      a
## D    88.8      a
## B    88.0     ab
## A    84.5      b
```



**Polinomios ortogonales**



---------------------------------------------------------------------
        &nbsp;           Df   Sum Sq   Mean Sq   F value    Pr(>F)   
----------------------- ---- -------- --------- --------- -----------
      **especie**        3    224.6     74.87     8.094    0.0003005 

 **especie: A vs C-D**   1     198       198      21.41    4.672e-05 

  **especie: A vs B**    1    0.1333   0.1333    0.01441    0.9051   

  **especie: C vs D**    1    26.45     26.45     2.859     0.09948  

     **Residuals**       36    333      9.25       NA         NA     
---------------------------------------------------------------------

Tabla: Modelo de Análisis de la Varianza
Existen diferencias entre A vs C –D y no existen entre C y D.


*Ejercicio:* Comprobar si los contrastes son ortogonales. 

**Prueba de homogeneidad de varianzas**


-----------------------------------
  &nbsp;     Df   F value   Pr(>F) 
----------- ---- --------- --------
 **group**   3    0.7086    0.5532 

             36     NA        NA   
-----------------------------------

Tabla: Prueba de Levene para homogeneidad de varianzas (centro = mediana).


---------------------------------------------------
    &nbsp;       Sum Sq   Df   F value    Pr(>F)   
--------------- -------- ---- --------- -----------
  **especie**    224.6    3     8.094    0.0003005 

 **Residuals**    333     36     NA         NA     
---------------------------------------------------

Tabla: ANOVA (Tipo II)


**Medias marginales estimadas**


------------------------------------------------------
 especie   lsmean     SE     df   lower.CL   upper.CL 
--------- -------- -------- ---- ---------- ----------
    A       84.5    0.9618   36    82.55      86.45   

    B        88     0.9618   36    86.05      89.95   

    C       91.1    0.9618   36    89.15      93.05   

    D       88.8    0.9618   36    86.85      90.75   
------------------------------------------------------

**Pruebas post hoc**


------------------------------------------------------------------------------------
     Prueba       contrast    estimate     SE        df      t.ratio      p.value   
---------------- ----------- ---------- --------- -------- ----------- -------------
     Tukey          A - B       -3.5       1.4       36       -2.57       0.06553   

   **Tukey**      **A - C**   **-6.6**   **1.4**   **36**   **-4.85**   **0.00013** 

   **Tukey**      **A - D**   **-4.3**   **1.4**   **36**   **-3.16**   **0.01606** 

     Tukey          B - C       -3.1       1.4       36       -2.28       0.12197   

     Tukey          B - D       -0.8       1.4       36       -0.59       0.93501   

     Tukey          C - D       2.3        1.4       36       1.69        0.34314   

   Bonferroni       A - B       -3.5       1.4       36       -2.57       0.08604   

 **Bonferroni**   **A - C**   **-6.6**   **1.4**   **36**   **-4.85**   **0.00014** 

 **Bonferroni**   **A - D**   **-4.3**   **1.4**   **36**   **-3.16**   **0.01908** 

   Bonferroni       B - C       -3.1       1.4       36       -2.28       0.17213   

   Bonferroni       B - D       -0.8       1.4       36       -0.59          1      

   Bonferroni       C - D       2.3        1.4       36       1.69        0.59688   

    **LSD**       **A - B**   **-3.5**   **1.4**   **36**   **-2.57**   **0.01434** 

    **LSD**       **A - C**   **-6.6**   **1.4**   **36**   **-4.85**    **2e-05**  

    **LSD**       **A - D**   **-4.3**   **1.4**   **36**   **-3.16**   **0.00318** 

    **LSD**       **B - C**   **-3.1**   **1.4**   **36**   **-2.28**   **0.02869** 

      LSD           B - D       -0.8       1.4       36       -0.59       0.56009   

      LSD           C - D       2.3        1.4       36       1.69        0.09948   

    Scheffe         A - B       -3.5       NA        NA        NA         0.1041    

  **Scheffe**     **A - C**   **-6.6**     NA        NA        NA        **4e-04**  

  **Scheffe**     **A - D**   **-4.3**     NA        NA        NA       **0.0301**  

    Scheffe         B - C       -3.1       NA        NA        NA         0.1779    

    Scheffe         B - D       -0.8       NA        NA        NA         0.9506    

    Scheffe         C - D       2.3        NA        NA        NA         0.4253    
------------------------------------------------------------------------------------


## Planificación Del Tamaño Muestral


**Diseño De Estudios De ANOVA**


La planificación de los tamaños muestrales es una parte integral del diseño en
un estudio de ANOVA. Se asumirá que todos los niveles del factor tienen el mismo
tamaño muestral

### Potencia De La Prueba F


La potencia de la prueba $F$ es la probabilidad de rechazar $H_{0}$ cuando
$H_{0}$ es falsa, o también se puede pensar como la probabilidad de no
rechazar $H_{a}$ cuando $H_{a}$ es cierta. Específicamente la potencia está
dada por la siguiente expresión:

$$
P = P\left( F^{*} > F_{\left( \alpha;I - 1,N - I \right)}\left| \phi \right.\  \right)
$$

donde $\mathbf{\phi}$ es un parámetro de no-centralidad, que es una medida de cuan
distintas son las $\mu_i$:

$$
\phi = \frac{1}{\sigma}\sqrt{\frac{\sum_{}^{}{n_{i}\left( \mu_{i} - \mu_{\bullet} \right)^{2}}}{I}}
$$

y

$$
\mu_{\bullet} = \frac{\sum_{}^{}{n_{i}\mu_{i}}}{N}
$$

Cuando todos los tamaños muestrales son iguales, el parámetro ϕ es:

$$
\phi = \frac{1}{\sigma}\sqrt{\frac{n\sum_{}^{}\left( \mu_{i} - \mu_{\bullet} \right)^{2}}{I}}\text{con}\ n = n_{i}
$$

donde:

$$
\mu_{} = \frac{\sum_{}^{}\mu_{i}}{I}
$$

Para determinar la potencia, se necesita utilizar la distribución F no-centrada,
dado que ésta es la distribución muestral de $F^{*}$ cuando $H_{a}$ es
cierta. Los cálculos son bastantes complejos, pero se han preparado gráficos que
permiten determinar la potencia relativamente fácil. Estos son los gráficos de
Pearson-Hartley de la potencia de la prueba $F$. La curva a utilizar depende
del número de niveles del factor, del tamaño muestral y del nivel de
significación empleado en la regla de decisión. Estos gráficos se usan de la
siguiente forma:

Cada página se refiere a diferentes $\nu_{1}$, los grados de libertad del
numerador de $F^{*}$. Para el modelo de ANOVA $\nu_{1} = I1$.

Dos niveles de significación, indicados por $\alpha$, son usados en los
gráficos, $\alpha = 0.05$ y $\alpha = 0.01$. Hay dos escalas de $X$,
dependiendo de cual es el nivel de significación empleado. De esta forma, el
grupo de curvas de la izquierda corresponde a $\alpha = 0.05$ y el de la
derecha a $\alpha = 0.01$.

Hay curvas separadas para diferentes valores de $\nu_{2}$, los grados de
libertad del denominador de $F^{*}$. Para el modelo de ANOVA $\nu_{2} = NI$.
Las curvas son indicadas de acuerdo al valor de $\nu_{2}$, en la parte
superior del gráfico. Dado que sólo son usados en la tabla valores seleccionados
de $\nu_{2}$, es necesario interpolar para valores intermedios de $\nu_{2}$

La escala de $X$ representa a $\phi$, el parámetro no-central.

La escala de $Y$ da la potencia $1 - \beta$, donde $\beta$ es la
probabilidad de cometer el error de tipo II.

**Ejemplo 3**.- Consideremos el caso donde $\nu_{1} = 2$, $\nu_{2} = 10$,
$\phi = 10$ y $\alpha = 0.05$. Si buscamos en la tabla la potencia es $1 -
\beta = 0.983$ aproximadamente.

Una forma alternativa para determinar la potencia es especificar la mínima
diferencia que se desea detectar entre las medias de las dos poblaciones más
diferentes. Designaremos a esta diferencia mínima detectable $\delta$,
calculamos entonces:

$$
\phi = \sqrt{\frac{n\delta^{2}}{2IS^{2}}}
$$

**Ejemplo 4**.- Supongamos que especificamos que trabajaremos con $n = 10$, y
que deseamos detectar, entre cuatro tratamientos, diferencias entre las medias
de al menos 4 unidades. De un estudio piloto se sabe que $S^{2} = 7.5888$.
Trabajamos con $\alpha = 0.05$.

$I\  = \ 4\nu_{1} = 3$ $n = 10$ $\nu_{2} = 36$ $\delta = 4.0$ $S^{2} =
7.5888$

$$
\begin{aligned}
\phi &= \sqrt{\frac{n\delta^{2}}{2IS^{2}}}\\
\phi &= \sqrt{\frac{10\left( 4.0 \right)^{2}}{2\left( 4 \right)\left( 7.5888 \right)}}\\
\phi &= \sqrt{2.6355}\\
\phi &= 1.62
\end{aligned}
$$

En la tabla obtenemos una potencia igual a $0.72$; lo que implica una
probabilidad de cometer el error de tipo II del $28\%$.

Si bien es deseable estimar la potencia antes de realizar el ANOVA, es útil,
también, preguntarse con que potencia se ha realizado un ANOVA. Esto es
especialmente interesante si la $H_{0}$ no se ha rechazado, pues entonces es
deseable saber cuan bien la prueba detecta las diferencias entre las medias de
la población.

Calculamos $\phi$, de la siguiente forma:

$$
\phi = \sqrt{\frac{\left( I - 1 \right)\left( CM_E - S^{2} \right)}{IS^{2}}}
$$

**Ejemplo 5.**- Los datos de la tabla corresponden a una muestra recogida de
tres poblaciones de aves geográficamente aisladas. Se midió la longitud del pico
con una precisión de un décimo de mm; obteniéndose los siguientes datos:

| Población |     |     |
|-----------|-----|-----|
| A         | B   | C   |
| 4.2       | 3.8 | 3.0 |
| 3.3       | 4.1 | 3.5 |
| 2.8       | 5.0 | 4.5 |
| 4.3       | 4.6 | 4.4 |
| 3.7       | 5.1 |     |
| 4.5       |     |     |
| 3.6       |     |     |

$$
\begin{aligned}
H_{0}&:\ u_{A} = u_{B} = u_{C}\\
H_{a}&:\ \text{No todas las medias de las poblaciones son iguales.}
\end{aligned}
$$

| Fte. de Variación | SC                  | GL   | CM                  | F     | P        | VC    |
|-------------------|---------------------|------|---------------------|-------|----------|-------|
| Entre Dentro      | 1.7977143 5.0322857 | 2 13 | 0.8988571 0.3870989 | 2.322 | 0.137322 | 3.806 |
| Total             | 6.83                | 15   |                     |       |          |       |

No rechazamos $H_{0}$ con $p > 0.05$

$$
\phi = \sqrt{\frac{\left( I - 1 \right)\left( CM_E - S^{2} \right)}{IS^{2}}} = \sqrt{\frac{\left( 3 - 1 \right)\left( 0.898871 - 0.387098 \right)}{3\left( 0.3870989 \right)}} = 0.9388053
$$

Consultando la tabla la Potencia es 0.25; por lo cual la probabilidad de cometer
error de tipo II es aproximadamente de 0.75.

-   Se puede observar que grandes valores de $\phi$ están asociados con
    grandes potencias, de las ecuaciones vistas anteriormente se ve que $\phi$
    se incrementa con:

-   incremento del tamaño muestral;

-   incremento entre las diferencias de las medias de las poblaciones (medida ya
    sea por $CM_E$ , o por $\sum_{}^{}\left( \mu_{i} - \mu_{} \right)^{2}$
    o por la mínima diferencia detectable);

-   un bajo número de niveles del factor o de tratamientos;

-   una disminución de la variabilidad dentro de las poblaciones,
    $\sigma^{2}$, estimada por $S^{2}$ o el $CM_D$.

**Ejemplo 6.-** Veamos qué pasa con el experimento anterior al aumentar el
tamaño de la muestra.

| POBLACIÓN         |            |     |            |       |            |       |
|-------------------|------------|-----|------------|-------|------------|-------|
| A                 | B          | C   |            |       |            |       |
| 3.9               | 4.6        | 3.7 |            |       |            |       |
| 3.5               | 4.1        | 4.2 |            |       |            |       |
| 4.1               | 4.5        | 3.6 |            |       |            |       |
| 4.4               | 4.4        | 4.0 |            |       |            |       |
| 4.4               | 3.7        | 3.3 |            |       |            |       |
| 4.6               | 4.6        | 3.5 |            |       |            |       |
| 3.3               | 3.9        | 4.0 |            |       |            |       |
| 3.9               | 4.6        | 4.4 |            |       |            |       |
| 4.4               | 4.5        | 3.5 |            |       |            |       |
| 3.6               | 3.7        | 4.1 |            |       |            |       |
| 3.7               | 4.1        | 3.9 |            |       |            |       |
| 3.4               | 4.2        | 4.3 |            |       |            |       |


| Fte. de Variación | SC         | GL  | CM         | F     | p          | VC    |
|-------------------|------------|-----|------------|-------|------------|-------|
| Entre             | 0.9433318  | 2   | 0.4716659  | 3.179 | 0.05458498 | 3.285 |
| Dentro            | 4.89465511 | 33  | 0.14832288 |       |            |       |
| Total             | 5.8379869  | 35  |            |       |            |       |

$$
\mathbf{\phi}\  \approx \ 1.21
$$

La potencia es entonces 0.4

Para el uso de las tablas vistas anteriormente se hace necesario la realización
de un experimento. Pero existen tablas que proporcionan los tamaños muestrales
adecuados directamente. Este método es aplicable cuando todos los niveles del
factor tienen el mismo tamaño muestral, esto es $n = n_{i}$.

La planificación del tamaño de la muestra usando estas tablas se hace en
términos del parámetro de no-centralidad, para tamaños muestrales iguales. Sin
embargo, en lugar de requerir una especificación directa de los niveles de
$u_{i}$ para los cuales es importante controlar la probabilidad de cometer el
error de tipo II; esta tabla sólo requiere una especificación del rango mínimo
de las medias de los niveles del factor para los cuales es importante detectar
diferencias entre los $u_{i}$, con alta probabilidad. Este rango mínimo se
indica $\Delta$:

$$
\Delta = max\left( u_{i} \right)min\left( u_{i} \right)
$$

Las siguientes especificaciones son necesarias para hacer uso de la tabla:

1.  El nivel de significación $\alpha$

2.  La magnitud del rango mínimo $\Delta$ de los $u_{i}$, la cual es
    importante detectar con alta probabilidad. La magnitud de $\sigma$, la
    desviación estándar de $Y$, debe también ser especificada para entrar en
    la tabla en términos del cociente: $\frac{\Delta}{\sigma}$

3.  El nivel de $\beta$. Entrar en la tabla en términos de $1 - \beta$.

Cuando se usa la tabla están disponibles cuatro niveles de $\alpha\
(0.2;0.1;0.05\ y\ 0.01)$. También hay cuatro niveles de β a través de la
potencia. La tabla provee tamaños muestrales para estudios $\text{de}\ I =
2,\ldots,10$ niveles del factor o tratamientos.

**Ejemplo 7.**- 1) Supongamos que se quiere con un rango mínimo $\Delta = 3$,
para comparar cuatro tratamientos. Se sabe por estudios anteriores que
$\sigma$ es aproximadamente igual a 2. Los niveles para controlar los errores
son:

$$
\alpha = 0.05\ \beta = 0.10\ o\ P = 1 - \beta = 0.90
$$

Entramos a la tabla para $\frac{\Delta}{\sigma} = \frac{3}{2} = 1.5$; $\alpha
= 0.05$; $1 - \beta = 0.9$ e $I = 4$. Encontramos que $n = 14$.

Especificación de $\frac{\Delta}{\sigma}$ directa: El rango mínimo también se
puede especificar en términos de unidades de desviación estándar.

$$
\frac{\Delta}{\sigma} = \frac{k\sigma}{\sigma} = k
$$

En nuestro ejemplo supongamos que el rango de las medias es k = 2 o más.
Supongamos que las otras especificaciones son:

$$
\alpha = 0.01\ \beta = 0.05\ o\ 1 - \beta = 0.95
$$

En la tabla encontramos que $n = 9$.

2) En el ejemplo se hace necesario incrementar el tamaño de la muestra. Para
ello nos preguntamos cuál es el tamaño de muestra necesario para, trabajando con
$\alpha = 0.05$, tener una potencia de $0.80$ para detectar diferencias tan
pequeñas como $0.7$. Suponemos que $S^{2} = 0.3870989$ es una buena
estimación de $\sigma^{2}$.

Entramos a la tabla para $\frac{\Delta}{\sigma} = \frac{0.6}{\sqrt{0.387089}}
\approx 1$; $\alpha = 0.05$; $1 - \beta = 0.8$ e $I = 3$

Encontramos que $n = 21$.

## Modelo II De ANOVA: Niveles Del Factor Aleatorios


Existen situaciones en las cuales los niveles del factor o los tratamientos
empleados no tienen un interés en sí mismos, pero constituyen una muestra de la
población. El Modelo II de ANOVA está diseñado para este tipo de situaciones.

### Modelo Aleatorio de Medias de Celdas.


El modelo II de ANOVA para un factor es:

$$
Y_{ij}\  = \ u_{i}\  + \ \varepsilon_{ij}
$$

donde

$u_{i}$ son variables independientes $\sim N\left(
\mu_{\bullet},\sigma_{\mu}^{2} \right)$

$\varepsilon{ij}$ son variables independientes $\sim N\left(
0,\sigma^{2} \right)$

$u_{i}$ y $\varepsilon_{ij}$ son variables aleatorias independientes

$$
i = 1,\ 2,\ldots,\ I;\ j = 1,\ 2,\ \ldots,\ n_{i}
$$

### Características importantes del Modelo

El valor esperado de una observación $Y_{ij}$ es:

$$
E(Y_{ij}) = u_{\bullet}
$$

esto se debe a que:

$$
\begin{aligned}
E\left( Y_{ij} \right)& = E\left( u_{\bullet}\  \right) + \ E\left( \varepsilon_{ij} \right) \\
& = \ u_{\bullet}\ \  + \ 0 \\
& = \ u_{\bullet} \\
\end{aligned}
$$

La varianza de $Y_{ij}$, que se indica $\sigma_{Y}^{2}$, es:

$$
\text{Var}\left( Y_{ij} \right) = \sigma_{Y}^{2} = \sigma_{\mu}^{2} + \sigma^{2}
$$

A causa de que la varianza de Y en este modelo es la suma de dos componentes,
este modelo se llama, algunas veces, un modelo de componentes de la varianza.

Los $Y_{ij}$ están normalmente distribuidos pues son una combinación
lineal de variables independientes, $u_{i}$ y $\varepsilon_{ij}$,
distribuidas normalmente

Las $Y_{ij}$ para el modelo aleatorio son sólo independientes si
pertenecen a diferentes tratamientos o niveles del factor. Se puede demostrar
que la covarianza para cualesquiera dos observaciones $Y_{ij}$ e
$Y_{{ij}'}$, para el mismo nivel i con un modelo II es:

$$
Cov(Y_{ij},\ Y_{ij'}) = \sigma_{Y}^{2}\; \forall\ j \neq  j
$$

El modelo II supone que la covarianza entre cualesquiera dos observaciones para
el mismo nivel del factor es constante para todos los niveles del factor.

Una vez que los niveles del factor han sido seleccionados, el modelo II asume
que dos observaciones cualesquiera para el mismo nivel del factor son
independientes pues la media del nivel del factor µi es entonces fijada y las
dos observaciones difieren sólo por los términos del error $\varepsilon_{ij}$.

### Cuestiones de Interés


Cuando el modelo aleatorio es apropiado, uno no está particularmente interesado
en inferencias sobre un $u_{i}$ particular incluido en el estudio, ya sea si
es grande o pequeño, pero sí en inferencias acerca de la población completa de
$mu_{i}$. Específicamente, el interés a menudo se centra sobre la media de los
$mu_{i}$, $u_{}$, y en la variabilidad de los $mu_{i}$ medida por
$\sigma_{\mu}^{2}$.

Dado que $\sigma_{\mu}^{2}$ es una medida directa de la variabilidad de los
$mu_{i}$, el efecto de esa variabilidad, a menudo, es medido por el cociente:

$$
\frac{\sigma_{\mu}^{2}}{\sigma_{\mu}^{2} + \sigma^{2}}
$$

1.  El cociente toma valores entre $0\ (\sigma^{2} = \infty)$ y $1\
    (\sigma^{2} = 0)$.

2.  El denominador es $\sigma_{Y}^{2}$.

En vista de las propiedades 1 y 2, el cociente mide la proporción de la
variabilidad total de los $Y_{ij}$ que se debe a la variabilidad en los
$\mu_{i\bullet}$.

### Prueba para $\mathbf{\sigma}_{\mathbf{\mu}}^{\mathbf{2}}$ = 0


Consideremos como decidir entre

$$
H_{0}:\ \sigma_{\mu}^{2} = 0
$$

$$
H_{a}:\ \sigma_{\mu}^{2} > 0
$$

$H_{0}$ implica que todos los $mu_{i}$ son iguales, esto es, $mu_{i} =
u_{\bullet}$. $H_{a}$ implica que los $mu_{i}$ difieren.

La diferencia entre los dos modelos aparece en los valores esperados de los
cuadrados medios. Se puede demostrar de misma forma que lo hemos hecho para el
modelo I, que:

$$
E(CM_D) = \sigma^{2}
$$

$$
E\left( CM_E \right) = \sigma^{2} + \ n\sigma_{\mu}^{2}
$$

donde

$$
n = \frac{1}{I - 1}\left\lbrack \left( \sum_{}^{}n_{i} \right) - \frac{\sum_{}^{}n_{i}^{2}}{\sum_{}^{}n_{i}} \right\rbrack
$$

Sí todos los $n_{i} = n$, entonces $n = n$

Es claro que si $\sigma_{\mu}^{2} = 0$, el $CM_D$ y el $CM_E$ tienen
el mismo valor esperado $\sigma^{2}$. Por otro lado $E\left( CM_E \right) >
\ E(CM_D)$ dado que $n > 0$ siempre. En consecuencia, grandes valores de la
prueba estadística:

$$
F^{*} = \frac{CM_E}{CM_D}
$$

nos llevará a rechazar $H_{0}$. Dado que $F^{*}$ sigue la distribución $F$
cuando $H_{0}$ es verdadera, la regla de decisión es la misma que para el
modelo I:

Si $F^{*} \leq F_{(1 - \alpha;I - 1;\ N - I)}$ no se rechaza $H_{0}$.

Si $F^{*} > F^{*} \leq F_{(1 - \alpha;I - 1;\ N - I)}$ se rechaza $H_{0}$.

**Ejemplo 8.-** Un laboratorio emplea una cierta técnica para determinar el
contenido de fósforo en el forraje del ganado bovino. La cuestión planteada es
“*si las determinaciones de fósforo dependen de las técnicas empleadas para el
análisis*”. Para contestar esta pregunta se seleccionaron al azar cuatro
técnicas con cinco observaciones para la misma tanda de forraje, obteniéndose
los siguientes resultados:

| Técnica 1|Técnica 2|Técnica 3|Técnicas 4|
|----------|---------|---------|----------|
| 34       |      37 |      34 |      36  |
| 36       |      36 |      37 |      34  |
| 34       |      35 |      35 |      37  |
| 35       |      37 |      37 |      34  |
| 34       |      37 |      36 |      35  |

$H_{0}$: La determinación del contenido de fósforo no difiere entre las
técnicas.

$H_{a}:$ La determinación del contenido de fósforo difiere entre técnicas.

| Fte. de Variación | SC | GL | CM   | F   | p       | VC      | General                      | Ejemplo                     |
|-------------------|----|----|------|-----|---------|---------|------------------------------|-----------------------------|
| Entre             | 9  | 3  | 3    | 2.4 | 0.10589 | 3.23886 | $\sigma^2 + n´ \sigma_{\mu}^{2}$ | $\sigma^2 + 5 \sigma_{\mu}^{2}$ |
| Dentro            | 20 | 16 | 1.25 |     |         |         | $\sigma^2$                           | $\sigma^2$                          |
| Total             | 29 | 19 |      |     |         |         |                              |                             |

No se rechaza $H_0$

| Niveles del Factor | $n_{i}$ | Media muestral | Varianza muestral |
|--------------------|-------|----------------|-------------------|
| 1                  | 5     | 34.6           | 0.8               |
| 2                  | 5     | 36.4           | 0.8               |
| 3                  | 5     | 35.8           | 1.7               |
| 4                  | 5     | 35.2           | 1.7               |

### Estimación De $\mathbf{\mu}_{\mathbf{\bullet}}$


Se sabe que:

$$
E(Y_{ij}) = u_{\bullet}
$$

Así, un estimador insesgado de $\mu_{\bullet}$ es:

$$
{\hat{\mu}}_{i} = {\overline{Y}}_{\bullet\bullet}
$$

Se puede demostrar que la varianza de este estimador es:

$$
S^{2}\left( {\overline{Y}}_{\bullet\bullet} \right) = \frac{\sigma_{\mu}^{2}}{I} + \frac{\sigma^{2}}{N} = \frac{n\sigma_{\mu}^{2} + \sigma^{2}}{N}
$$

Recordar que $N = I\ n.$

Se ve que la varianza está formada por dos componentes.

Un estimador insesgado de esta varianza es:

$$
S^{2}\left( {\overline{Y}}_{\bullet\bullet} \right) = \frac{CM_E}{N}
$$

es un estimador insesgado pues, cuando ni = n:

$$
E\left( CM_E \right) = n\sigma_{\mu}^{2} + \sigma^{2}
$$

Se puede demostrar que:

$\frac{{\overline{Y}}_{\bullet\bullet} - \mu_{\bullet}}{S\left(
{\overline{Y}}_{\bullet\bullet} \right)}\sim t_{\left( I - 1 \right)}$, cuando
$n_{i} = n.$

Así, de la forma usual se obtienen los límites del intervalo de confianza para
µ•:

$$
{\overline{Y}}_{\bullet\bullet} \pm t_{I - 1;\alpha\left( 2 \right)}S\left( {\overline{Y}}_{\bullet\bullet} \right)
$$

**Ejemplo** 9.- En el estudio de contenido de fósforo del forraje del ganado
bovino. Se tiene:

$$
{\overline{Y}}_{\bullet\bullet} = 35.5\ CM_E = 3\ N = 20
$$

Necesitamos $t_{3;\ 0.05\left( 2 \right)} = 3.182$ y $S^{2}\left(
{\overline{Y}}_{\bullet \bullet} \right) = \frac{3}{20} = 0.15$, entonces
$S\left( {\overline{Y}}_{\bullet \bullet} \right) = 0.38729833$; el intervalo
de confianza del 95% es:

$$
34.27 \leq \ u_{\bullet} \leq 36.73
$$

### Estimación De $\sigma_{\mu}^2/\left ( \sigma_{\mu}^2+\sigma^2 \right )$


El cociente $\sigma_{\mu}^2/\left (\sigma_{\mu}^2+\sigma^2 \right )$
revela el alcance del efecto de la varianza entre los $mu_{i}$. Para
desarrollar un intervalo de confianza para este cociente, se supone que todos
los tamaños muestrales de los niveles del factor son iguales.

Comenzaremos obteniendo un intervalo de confianza para el cociente
$\frac{\sigma_{\mu}^{2}}{\sigma^{2}}$. El $CM_E$ y el $CM_D$ son
variables aleatorias independientes para el modelo II de ANOVA, lo mismo que
para el modelo I. Cuando $n_{i} = n$, se puede demostrar que:

$$
\frac{CM_E}{n\sigma_{\mu}^{2} + \sigma^{2}} + \frac{CM_D}{\sigma^{2}}\sim F_{I - 1,N - I}
$$

Así, se puede escribir la probabilidad:

$$
P\left( F_{\left( 1 - \frac{\alpha}{2} \right);I - 1,N - I} \leq \frac{CM_E}{n\sigma_{\mu}^{2} + \sigma^{2}} + \frac{CM_D}{\sigma^{2}} \leq F_{\left( \frac{\alpha}{2} \right);I - 1,N - I} \right) = 1 - \alpha
$$

Reordenando las desigualdades, se obtienen los siguientes límites $S$ e $I$
para $\frac{\sigma_{\mu}^{2}}{\sigma^{2}}$

$$
\begin{matrix}
I = \frac{1}{n}\left\lbrack \frac{CM_E}{CM_D}\left( \frac{1}{F_{\frac{\alpha}{2};I - 1,N - I}} \right) - 1 \right\rbrack \\
S = \frac{1}{n}\left\lbrack \frac{CM_E}{CM_D}\left( \frac{1}{F_{1 - \frac{\alpha}{2};I - 1,N - I}} \right) - 1 \right\rbrack \\
\end{matrix}
$$

donde $I$ es el límite inferior y $S$ el superior.

Los límites $I^{*}$ y $S^{*}$ para
$\frac{\mathbf{\sigma}_{\mathbf{\mu}}^{\mathbf{2}}}{\mathbf{\sigma}_{\mathbf{\mu}}^{\mathbf{2}}\mathbf{+}\mathbf{\sigma}^{\mathbf{2}}}$
pueden ser obtenidos como sigue:

$$
I^{*} = \frac{I}{1 + I}S^{*} = \frac{S}{1 + S}
$$

**Ejemplo 9 cont**.- En nuestro ejemplo

$$
CM_E = 3\ CM_D = 1.25\ n = 5\ I = 4\ N = 20
$$

Para construir el intervalo de confianza del 95% se necesita:

$$
F_{0.975;\ 3,\ 19} = 0.071\ F_{0.025;\ 3,\ 19} = 3.093
$$

De esta manera los límites del 95% para $\frac{\sigma_{\mu}^{2}}{\sigma^{2}}$
son:

$$
I = \frac{1}{5}\left\lbrack \frac{3}{1.25}\left( \frac{1}{3.093} \right) - 1 \right\rbrack = - 0.077S = \frac{1}{5}\left\lbrack \frac{3}{1.25}\left( \frac{1}{0.071} \right) - 1 \right\rbrack = 6.561
$$

Cuando el límite inferior del intervalo de confianza para
$\frac{\sigma_{\mu}^{2}}{\sigma^{2}}$ es negativo, la práctica usual es
considerarlo como 0. Entonces el intervalo de confianza es:

$$
0 \leq \frac{\sigma_{\mu}^{2}}{\sigma^{2}} \leq 6.561
$$

Finalmente, los límites de confianza para
$\frac{\mathbf{\sigma}_{\mathbf{\mu}}^{\mathbf{2}}}{\mathbf{\sigma}_{\mathbf{\mu}}^{\mathbf{2}}\mathbf{+}\mathbf{\sigma}^{\mathbf{2}}}$
son:

$$
0\  \leq \text{  }\frac{\mathbf{\sigma}_{\mathbf{\mu}}^{\mathbf{2}}}{\mathbf{\sigma}_{\mathbf{\mu}}^{\mathbf{2}}\mathbf{+}\mathbf{\sigma}^{\mathbf{2}}} \leq \ 0.87
$$

Concluimos que la variabilidad de la media de las determinaciones de fósforo se
encuentra entre 0 y 87% de la varianza total.

**Estimación de σ2 y** $\mathbf{\sigma}_{\mathbf{\mu}}^{\mathbf{2}}$

Un estimador insesgado para $\sigma^{2}$ es:

$$
{\overset{\land}{\sigma}}^{2} = CM_D
$$

Y el intervalo de confianza se obtiene como:

$$
\frac{\left( N - I \right)S^{2}}{\chi_{0.025;N - I}^{2}} \leq \sigma^{2} \leq \frac{\left( N - I \right)S^{2}}{\chi_{0.975,N - I}^{2}}
$$

También se puede obtener un estimador insesgado de $\sigma_{\mu}^{2}$:

$$
E(CM_D) = \sigma^{2}
$$

$$
E(CM_E) = \sigma^{2} + n\sigma_{\mu}^{2}
$$

Se sigue que:

$$
{\overset{\land}{\sigma}}_{\mu}^{2} = \frac{CM_E - CM_D}{n}
$$

**Ejemplo 9 cont.**-

$$
CM_D = 1.25\; \chi_{0.975,16}^{2} = 6.908\; \chi_{0.025;16}^{2} = 28.845
$$

El intervalo de confianza es:

$$
0.693 = \frac{16\left( 1.25 \right)}{28.845} \leq \sigma^{2} \leq \frac{16\left( 1.25 \right)}{6.908} = 2.895
$$

Una estimación insesgada de $\sigma_{\mu}^{2}$ es:

$$
{\overset{\land}{\sigma}}_{\mu}^{2} = \frac{3 - 1.25}{5} = 0.35
$$

### Modelo De Efectos Aleatorios


El modelo se puede expresar como:

$$
Y_{ij} = u_{\bullet} + \alpha_{i} + \varepsilon_{ij}
$$

donde

$\mu_{\bullet}$ es una componente constante común a todas las observaciones

$\alpha_{i}$ son variables aleatorias independientes $\sim
N(0,\sigma_{\mu}^{2})$

$\varepsilon_{ij}$ son variables aleatorias independientes $\sim
N(0,\sigma^{2})$

$\alpha_{i}$ y $\varepsilon_{ij}$ son independientes

$$
i = 1,2,\ldots,I;j = 1,2,\ldots,n_{i}
$$




# Prueba de Wilcoxon-Mann-Whitney para dos pruebas independientes

Esta prueba es el análogo más directo de la prueba de t para dos muestras
independientes. Existen dos variantes de esta prueba que utilizan distintos
estadísticos (W y U), cada uno de los cuales posee su propia tabla de valores
críticos. Sin embargo, ambas variantes dan idénticos resultados debido a que son
formas diferentes de utilizar y evaluar de igual manera la misma información.
Cuando se emplea el estadístico U esta prueba suele ser denominada también como
Prueba U de Mann-Whitney.

## Datos

Para utilizar esta prueba es necesario contar con dos muestras aleatorias de las
dos poblaciones a comparar, tal que $\left ({X_1,X_2,…,X_{N1}}\right )$ es la
muestra aleatoria de tamaño $N_1$ de la población 1 y $\left ({Y_1,Y_2,…,Y_{N2}}
\right )$ es la muestra aleatoria de tamaño $N_2$ de la población 2. La función
de distribución en probabilidades de la población 1 es $F(x)$ y la función de
distribución en probabilidades de la población 2 es $G(x)$.

## Supuestos

Los supuestos de esta prueba son: 
1. Ambas muestras son muestras aleatorias de las respectivas poblaciones. 
2. Los datos son independientes tanto dentro de cada muestra como entre muestras. 
3. Las mediciones han sido tomadas utilizando al menos una escala ordinal. 
4. Si existen diferencias en las funciones de distribución de ambas poblaciones,
estas diferencias están asociadas a la localización de las distribuciones.
Esto significa que $F(x)=G(x+c)$, donde $c$ es una constante. Este supuesto sólo
es necesario cuando la hipótesis a poner a prueba está asociada a las $E(X)$ y 
$E(Y)$.

## Procedimiento básico {#np-algoritmo}

Los datos combinados de ambas muestras deben ser ordenados de menor a mayor.
A estos datos ordenados se les deben asignar rangos desde 1 a $N1+N2$. En
caso de existir empates, debe asignarse el rango promedio de los rangos
correspondientes. Luego de la asignación de los rangos, deben obtenerse las
sumas de los rangos de cada muestra como:

$$
\begin{matrix}
R_1=\sum_{i=1}^{N_1}R(X_i)\\
R_2=\sum_{i=1}^{N_2}R(Y_i)
\end{matrix}
$$

donde $R_1$ es la suma de los rangos asignados a la muestra de la población
1, $R_2$ es la suma de los rangos asignados a la muestra de la población 2,
$R(X_i)$ es el rango asignado al i-ésimo dato de la muestra de la población 1 y
$R(Y_i)$ es el rango asignado al i-ésimo dato de la muestra de la población 2.
Igualmente, los valores $R_1$ y $R_2$ se encuentran relacionados, de tal manera que:
$R_1+R_2=(N_1+N_2)(N_1+N_2+1)/2$ Esto implica que conocidos $N_1$, $N_2$ y uno de los
$R_i$ es posible hallar el otro.

### Ejemplo

Supongamos que obtenemos los siguientes valores para la población 1 y 2:


Table: (\#tab:ejemplo-ranking)Datos de dos poblaciones de ejemplo

 Pob1   Pob2
-----  -----
    1      3
    2      5
    4      8
    6      3
    2      7
    2      4
    0      4
    0      3
    4      4
    3      4

A continuación debemos reunir esos datos en una solo conjunto, agregando una
identificación [^1]

[^1]: Esto se puede hacer sin muchas vueltas con la función `gather()` del
paquete `tidyr`.


Table: (\#tab:ejemplo-ranking-gather)Datos de ambas poblaciones juntas

Pob     Valor
-----  ------
Pob1        1
Pob1        2
Pob1        4
Pob1        6
Pob1        2
Pob1        2
Pob1        0
Pob1        0
Pob1        4
Pob1        3
Pob2        3
Pob2        5
Pob2        8
Pob2        3
Pob2        7
Pob2        4
Pob2        4
Pob2        3
Pob2        4
Pob2        4

A continuación se ordenan y se la asigna un número de 1 hasta $N_1+N_2$ según 
el orden (columna `Rango`)[^2]. Los empates deben tratarse de forma especial ya que
no hay forma de decidir que número va primero. Por lo tanto se promedian los
valores de sus rangos (columna `Rango_Empates` )

[^2]: Ver la función `rank()`


```r
datos_long <- datos_long %>% 
  mutate(Rango = rank(Valor, ties.method = "r")) %>% 
  arrange(Rango) %>% 
  mutate(Rango_Empates = rank(Valor))
kable(datos_long)
```



Pob     Valor   Rango   Rango_Empates
-----  ------  ------  --------------
Pob1        0       1             1.5
Pob1        0       2             1.5
Pob1        1       3             3.0
Pob1        2       4             5.0
Pob1        2       5             5.0
Pob1        2       6             5.0
Pob2        3       7             8.5
Pob1        3       8             8.5
Pob2        3       9             8.5
Pob2        3      10             8.5
Pob2        4      11            13.5
Pob2        4      12            13.5
Pob2        4      13            13.5
Pob2        4      14            13.5
Pob1        4      15            13.5
Pob1        4      16            13.5
Pob2        5      17            17.0
Pob1        6      18            18.0
Pob2        7      19            19.0
Pob2        8      20            20.0


## Estadísticos
### Variante Wilcoxon (W)
#### Sin empates
Si no existen empates o si estos son pocos, el estadístico a calcular es:

$$W=R_1$$

Los valores críticos para este estadístico ($w_p$) pueden obtenerse de la Tabla
A7. En esta tabla se presentan los valores críticos (cuantiles) para $1-\alpha$
en el rango 0.001-0.5. Los valores para el rango 0.5-0.999 pueden obtenerse
como: $$w_{1-p}=N_1 (N_1+N_2+1)-w_p$$

La Tabla A7 permite obtener los valores críticos para muestras donde $N_1\le20$
y $N_2\le20$. En el caso de que $N_1$ y/o $N_2$ fueran mayores que 20, los
valores críticos pueden obtenerse mediante una aproximación normal de la forma:
$$w_p\cong \frac{N_1 (N_1+N_2+1)}{2}+z_p \sqrt{\frac{N_1 N_2 (N_1+N_2+1)}{12}}$$

#### Con empates {#w-con-empates}

Si existen numerosos empates, el estadístico a calcular es:

$$
W_1=\frac{W-\frac{N_1(N_1+N_2+1)}{2}}{\sqrt{\frac{N_1 N_2}{(N_1+N_2)(N_1+N_2-1)}\sum_{i=1}^{N_1+N_2}{R_i^2}-\frac{N_1 N_2 (N_1+N_2+1)^2}{4(N_1+N_2-1)}}}
$$

donde $R_i^2$ son los $R(X_i)$ y $R(Y_i)$ elevados al cuadrado. 
Este estadístico se distribuye según una distribución normal estándar.

### Variante Mann-Whitney (U)

Se calculan dos estadísticos, el $U$ y el $U’$. Ambos estadísticos se obtienen de
igual forma como:

$$
\begin{matrix}
U = N_1 N_2+\frac{N_1 (N_1+1)}{2}-R_1 \\
U'=N_2 N_1+\frac{N_2 (N_2+1)}{2}-R_2
\end{matrix}
$$

Además, cualquiera de ellos puede obtenerse a partir del otro teniendo en cuenta
que la relación entre ellos es:

$$U=N_1 N_2-U'$$

Cómo puede verse a partir de las ecuaciones que definen a $U$ y $U’$, puede
considerarse que $U$ es el estadístico asociado a la población 1, mientras que $U’$
es el estadístico asociado a la población 2. Igualmente, dado que la asignación
de población 1 y población 2 es puramente arbitraria, los estadísticos $U$ y $U’$
pueden corresponder indistintamente a cualquiera de las dos muestras a comparar.
Por una razón exclusivamente operativa y relacionada con la tabla de valores
críticos que se utilizará, se considera como población 1 a la que posea el
mayor tamaño muestral y como población 2 a la que posea el menor tamaño muestral
($N_1 < N_2$). Los valores críticos para los estadísticos U o U’ pueden obtenerse
utilizando la Tabla $U$ para muestras donde $N_1\le 20$ y $N_2\le 20$. Para tamaños
muestrales mayores, pueden utilizarse aproximaciones normales. Dependiendo de la
existencia o no de empates los estadísticos a calcular son:

#### Sin empates

$$Z=\frac{U-\frac{(N_1 N_2)}{2}}{\sqrt{\frac{N_1 N_2 (N_1+N_2+1)}{12}}}$$

#### Con empates

Previamente al cálculo del estadístico y considerando la existencia de E grupos de datos empatados debe obtenerse el valor $\sum e$ tal que:

$$\sum e=\sum_{i=1}^E(\varepsilon_i^3-\varepsilon_i ) $$

donde $\varepsilon_i$ es el número de datos empatados en el grupo i-ésimo de 
datos empatados.

Una vez obtenido el $\sum e$, el estadístico corregido por empates ($z_c$) puede 
obtenerse como:

$$Z_c=\frac{U-\frac{(N_1 N_2)}{2}}
{\sqrt{\left [\frac{N_1N_2}{(N_1+N_2)^2-(N_1+N_2)}\right ]\left [\frac{(N_1 + N_2)^3 -(N_1+N_2)-\sum e)}{12}\right ]}}$$


Ambos estadísticos ($z$ y $z_c$) se distribuyen de acuerdo a una distribución normal estándar.

## Hipótesis

En términos generales, la prueba de Wilcoxon-Mann-Whitney se utiliza para poner
a prueba hipótesis sobre las distribuciones $F(x)$ y $G(x)$. Como la prueba es
sensible a diferencias en las tendencias centrales puede emplearse para poner a
prueba hipótesis sobre $E(X)$ y $E(Y)$.

### Prueba a dos colas

$H_0: F(x)=G(x)$ para todo $x$   ó  $E(X)=E(Y)$  
$H_a: F(x)≠G(x)$ para algún $x$   ó  $E(X)≠E(Y)$

#### Variante Wilcoxon*

Utilizando el estadístico $W$ los criterios de decisión son:  
Si  $W\le w_{\alpha/2}$    ó $W\ge w_{1-\alpha/2}$  Entonces **Rechazo** $H_0$  
Si  $w_{\alpha/2}<W<w_{1-\alpha/2}$   Entonces **No rechazo** $H_0$  
Para evitar calcular el $w_{1-\alpha/2}$, puede calcularse un estadístico $W’$ como:

$$W'=N_1 (N_1+N_2+1)-W$$

quedando definidos los criterios de decisión como:

Si  $W\le w_{\alpha/2}$    ó $W’\le w_{\alpha/2}$ Entonces **Rechazo** $H_0$  
Si  $W>w_{\alpha/2}$ y $W’>w_{\alpha/2}$ Entonces **No rechazo** $H_0$

Utilizando el estadístico $W1$ los criterios de decisión son:

Si $2*[1-P(Z≤ W_1  )]\le \alpha$   Entonces **Rechazo** $H_0$
Si $2*[1-P(Z≤ W_1  )]>\alpha$   Entonces **No rechazo** $H_0$

#### Variante Mann-Whitney

Definiendo como estadístico $U$ al mayor entre $U$ y $U’$, los criterios de 
decisión son:  
Si  $U≥U_{N1,N2,\alpha/2}$ Entonces **Rechazo** $H_0$  
Si  $U<U_{N1,N2,\alpha/2}$ Entonces **No rechazo** $H_0$  
Donde $U_{N1,N2,\alpha/2}$ es el valor crítico obtenido de la Tabla U. 

Utilizando la aproximación normal, ya sea sin empates ($z$) o con corrección por
empates ($z_c$), los criterios de decisión son:  
Si $2*[1-P(Z≤ z )]≤\alpha$   Entonces **Rechazo** $H_0$  
Si $2*[1-P(Z≤ z )]>\alpha$   Entonces **No rechazo** $H_0$

### Prueba de una cola a la izquierda

$H_0$: $F(x)=G(x)$ para todo $x$   ó  $E(X)=E(Y)$
$H_a$: $F(x)>G(x)$ para algún $x$   ó  $E(X)<E(Y)$

Para visualizar la relación entre las hipótesis planteadas en términos de
las funciones de distribución y las hipótesis planteadas en términos de las
esperanzas puede utilizarse la \@ref(fig:figura-dens). En esta figura muestra
las funciones de densidad y de distribución para dos variables normales que
difieren solamente en el valor de su media.
 


 
<div class="figure">
<img src="No-Parametrico-Teoria_files/figure-epub3/figura-dens-1.png" alt="Funciones de densidad [$f(x)$ y $g(x)$] y funciones de distribución
[$F(x)$ y $G(x)$] para dos variables aleatorias que se distribuyen normalmente
con $\sigma^2=3$ y que sólo difieren en el valor de $\mu=10$ y $\mu=15$."  />
<p class="caption">(\#fig:figura-dens)Funciones de densidad [$f(x)$ y $g(x)$] y funciones de distribución
[$F(x)$ y $G(x)$] para dos variables aleatorias que se distribuyen normalmente
con $\sigma^2=3$ y que sólo difieren en el valor de $\mu=10$ y $\mu=15$.</p>
</div>
 


#### Variante Wilcoxon

Utilizando el estadístico $W$ los criterios de decisión son:  
Si  $W≤w_\alpha$     Entonces **Rechazo** $H_0$  
Si  $W>w_\alpha$  Entonces **No rechazo** $H_0$  

Utilizando el estadístico $W_1$ los criterios de decisión son:  
Si $P(Z≤W_1 )≤ \alpha$  Entonces **Rechazo** $H_0$  
Si $P(Z>W_1 )> \alpha$  Entonces **No rechazo** $H_0$

#### Variante Mann-Whitney

Definiendo como estadístico $U$ al $U$, los criterios de decisión son:  
Si  $U≥U_{N1,N2,\alpha}$ Entonces **Rechazo** $H_0$  
Si  $U<U_{N1,N2,\alpha}$ Entonces **No rechazo** $H_0$  
Donde $U_{N1,N2,\alpha}$ es el valor crítico obtenido de la Tabla U. 

Utilizando la aproximación normal, ya sea sin empates ($z$) o con corrección
por empates ($z_c$), los criterios de decisión son:  
Si $1-P(Z\le z)\le\alpha$ ó $1-P(Z≤z_c )\le\alpha$ Entonces **Rechazo** $H_0$  
Si $1-P(Z≤z)>\alpha$ ó $1-P(Z≤z_c )>\alpha$ Entonces **No rechazo** $H_0$

### Prueba de una cola a la derecha

$H_0$: $F(x)=G(x)$ para todo x   ó  $E(X)=E(Y)$  
$H_a$: $F(x)<G(x)$ para algún x   ó  $E(X)>E(Y)$

#### Variante Wilcoxon

Utilizando el estadístico $W$ los criterios de decisión son:  
Si  $W≥w_{1-\alpha}$     Entonces **Rechazo** $H_0$  
Si  $W<w_{1-\alpha}$  Entonces **No rechazo** $H_0$

También puede utilizarse el estadístico $W’$, quedando entonces los criterios de
decisión como:  
Si  $W'≤w_\alpha$     Entonces **Rechazo** $H_0$  
Si  $W'>w_\alpha$  Entonces **No rechazo** $H_0$

Utilizando el estadístico $W_1$ los criterios de decisión son:  
Si $P(Z≤W_1 )≤ \alpha$  Entonces **Rechazo** $H_0$  
Si $P(Z≤W_1 )> \alpha$  Entonces **No rechazo** $H_0$

#### Variante Mann-Whitney

Definiendo como estadístico U al U, los criterios de decisión son:  
Si  $U≥U_{N1,N2,\alpha}$ Entonces **Rechazo** $H_0$  
Si  $U<U_{N1,N2,\alpha}$ Entonces **No rechazo** $H_0$  
Donde $U_{N1,N2,\alpha}$ es el valor crítico obtenido de la Tabla U. 

Utilizando la aproximación normal, ya sea sin empates ($z$) o con corrección por
empates ($z_c$), los criterios de decisión son:  
Si $1-P(Z≤z)≤\alpha$ ó $1-P(Z≤z_c )≤\alpha$ Entonces **Rechazo** $H_0$  
Si $1-P(Z≤z)>\alpha$ ó $1-P(Z≤z_c )>\alpha$ Entonces **No rechazo** $H_0$

## Ejemplo 2

Un ecólogo desea comparar las tallas de raneya (pez demersal bentónico)
consumidas por machos y hembras del lobo marino. Los largos totales de las
raneyas fueron estimados a partir de los otolitos hallados en los estómagos.
Debido a que las hembras son predadores más costeros que los machos y las áreas
costeras son áreas de cría para diversas especies de peces, el biólogo especula
que las raneyas consumidas por las hembras deberían ser más pequeñas que las
consumidas por los machos. Los datos obtenidos fueron: 


Table: (\#tab:ejemplo-2-datos)Largo total (cm) de las
raneyas consumidas por machos y hembras del lobo marino

 Machos   Hembras
-------  --------
     15         9
     10         8
     14         5
     17         5
     16         5
     11         9
     15         9
     20        10
     13        13
               13
               15
                5
               12
                6

Teniendo en cuenta que el tamaño muestral de las hembras es mayor que el de los
machos, se considera como población 1 (X) a las hembras y como población 2 (Y) a
los machos. En función de esto, las hipótesis para este enunciado son:

$H_0$: $F(x)=G(x)$  
$H_a$: $F(x)>G(x)$ ó $E(X)<E(Y)$

Los cálculos realizados son:



Sexo       LT    R_i    e
--------  ---  -----  ---
Hembras     5    2.5   60
Hembras     5    2.5    0
Hembras     5    2.5    0
Hembras     5    2.5    0
Hembras     6    5.0    0
Hembras     8    6.0    0
Hembras     9    8.0   24
Hembras     9    8.0    0
Hembras     9    8.0    0
Machos     10   10.5    6
Hembras    10   10.5    0
Machos     11   12.0    0
Hembras    12   13.0    0
Machos     13   15.0   24
Hembras    13   15.0    0
Hembras    13   15.0    0
Machos     14   17.0    0
Machos     15   19.0   24
Machos     15   19.0    0
Hembras    15   19.0    0
Machos     16   21.0    0
Machos     17   22.0    0
Machos     20   23.0    0





| Variante Wilcoxon |              |            |
|-------------------|--------------|------------|
| W                 | 117,5        |            |
| W'                | 218,5        |            |
| 1 cola            | w14;9;0,05   | 142        |
| 2 colas           | w14;9;0,025  | 137        |
|                   | w14;9;0,975  | 199        |
| W1                | \-3,19943151 |            |
| 1 cola            | Valor p      | 0,00068856 |
| 2 colas           | Valor p      | 0,00137712 |

| Variante Mann-Whitney |                  |            |
|-----------------------|------------------|------------|
| 2 colas               | U                | 113,5      |
|                       | $U_{14;9;0,025}$ | 95         |
| 1 cola                | U                | 113,5      |
|                       | $U_{14;9;0,05}$  | 90         |
|                       | $z$              | 3,18120098 |
| 1 cola                | Valor p          | 0,00073339 |
| 2 colas               | Valor p          | 0,00146679 |
|                       | $z_c$            | 3,19943151 |
| 1 cola                | Valor p          | 0,00068856 |
| 2 colas               | Valor p          | 0,00137712 |


De acuerdo a los resultados obtenidos, es posible rechazar la hipótesis nula.   
Considerando la hipótesis a dos colas, es posible rechazar la hipótesis nula.

Esta prueba puede realizarse con R. Se encuentra en la función wilcox.test() en 
el paquete stats. 

Hay que tener en cuenta que la definición del estadístico $W$ en R es diferente.
En este caso es la suma de rangos de la primer población *menos* el mínimo. 
Por lo tanto, el estadístico es el mismo que el $U$ de Mann-Whitney.


Los resultados para el ejemplo son:



```r
wilcox.test(datos_ejemplo2$Machos, datos_ejemplo2$Hembras, alternative = "greater")
```

```
## Warning in wilcox.test.default(datos_ejemplo2$Machos,
## datos_ejemplo2$Hembras, : cannot compute exact p-value with ties
```

```
## 
## 	Wilcoxon rank sum test with continuity correction
## 
## data:  datos_ejemplo2$Machos and datos_ejemplo2$Hembras
## W = 113.5, p-value = 0.0007681
## alternative hypothesis: true location shift is greater than 0
```


Nótese que la prueba da el valor de la variante Mann-Whitney. Las mismas consideraciones que se hicieron para la prueba de rangos de Wilcoxon en la sección anterior deben hacerse aquí. Es decir, especificar la cola a usar y rechazar cuando p≤α

## Prueba de Wilcoxon de rangos con signo para muestras apareadas

Esta prueba implica comparar una serie de pares ordenados $(x_{i},\ y_{i})$
obtenidos de una serie de variables aleatorias bivariadas $(X_{i},\ Y_{i})$.
Básicamente la prueba se basa en la asignación de rangos a las diferencias
obtenidas $D_{i}$ para cada uno de los pares ordenados de la muestra. Por lo
tanto, dada una muestra aleatoria de $N$ pares ordenados, se calculan las
diferencias como:

$$
D_{i} = x_{i} - y_{i}\text{ para }i = 1, 2, 3,\ldots, N
$$

Una vez obtenidas las $D_{i}$, se descartan todas las diferencias donde
$D_{i} = 0$. De esta forma el tamaño muestral real para la prueba ($n$) se
reduce de tal forma que $n \leq N$. Posteriormente se ordenan las $D_{i}$
remanentes de menor a mayor teniendo en cuenta el valor absoluto de las
diferencias $(\left| D_{i} \right|)$. Luego, se asignan los rangos a las
$|D_{i}|$ desde $1$ hasta $n$. En aquellos casos donde las $|D_{i}|$ son
iguales (empates), se les asigna a todas las diferencias empatadas el promedio
de los rangos correspondientes. Finalmente, se les asigna a los rangos el signo
correspondiente a las $D_{i}$ obteniéndose de esta forma los rangos con signo
$R_{i}$.

### Supuestos

La prueba de Wilcoxon tiene los siguientes supuestos:

La distribución de los $D_{i}$ es simétrica.

Las $D_{i}$ son mutuamente independientes.

Todas las $D_{i}$ tiene igual media.

Las $D_{i}$ están medidas utilizando como mínimo una escala de intervalo.

### Estadísticos

Para esta prueba se calculan dos estadísticos, el $T^{+}$ y el $T^{-}$.
Ambos estadísticos se calculan como:

$$
\begin{matrix}
T^{+} = \left| \sum_{}^{}R_{i} \right| & \text{si }R_{i} > 0 \\
T^{-} = \left| \sum_{}^{}R_{i} \right| & \text{si }R_{i} < 0 \\
\end{matrix}
$$

Los valores críticos para estos estadísticos wp se obtienen de una tabla
construida *ad hoc* para esta prueba (Tabla A12). En esta tabla se presentan los
valores críticos (cuantiles) para $1 - \alpha$ en el rango 0.005-0.5. Los
valores para el rango 0.5-0.995 pueden obtenerse como:

$$
w_{p} = \frac{n\left( n + 1 \right)}{2} - w_{1 - p}
$$

presentándose también en 12 el primer término de esta diferencia para facilitar
el cálculo de los valores críticos. El n es el tamaño muestral efectivo de la
prueba.

Para $n > \ 50$ o para aquellos casos con numerosos empates, puede obtenerse
un estadístico que se distribuye en forma aproximadamente normal y que se
calcula como:

$$
Z = \frac{\sum_{i = 1}^{n}R_{i}}{\sqrt{\sum_{i = 1}^{n}R_{i}^{2}}}
$$

### Hipótesis

#### Prueba a dos colas

La prueba a dos colas implica poner a prueba las siguientes hipótesis:

$H_{0}:\ E(D) = 0$ ó $E(X) = E(Y)$

$H_{a}:\ E\left( D \right) \neq 0$ ó $E\left( X \right) \neq E(Y)$

Para poner a prueba esta hipótesis se utiliza el menor de los estadísticos T+ y
T-, comparando el estadístico con los valores críticos $w_{\alpha/2}$ y $w_{1
- \alpha/2}$.

Si $T^{\pm} > \ w_{1 - \frac{\alpha}{2}}$ ó $T^{\pm} <w_{\frac{\alpha}{2}}$
Entonces Rechazo $H_{0}$

Si $w_{\frac{\alpha}{2}}\  < T^{\frac{+}{-}} < \ w_{1 - \frac{\alpha}{2}}$
Entonces No rechazo $H_{0}$

*Empleando la aproximación normal, si*

Si $2*\left\lbrack 1 - P\left( z \leq \left| Z \right| \right) \right\rbrack
\leq \alpha$ Entonces Rechazo $H_{0}$

Si $2*\left\lbrack 1 - P\left( z \leq \left| Z \right| \right) \right\rbrack >
\alpha$ Entonces No rechazo $H_{0}$

#### Prueba de una cola a la izquierda

La prueba de una cola a la izquierda implica poner a prueba las siguientes
hipótesis:

$H_{0}:\ E\left( D \right) \geq 0$ ó $E\left( X \right) > E(Y)$

$H_{a}:\ E(D) < 0$ ó $E(X) < E(Y)$

Para poner a prueba esta hipótesis se utiliza el estadístico T+, comparando el
estadístico con el valor crítico $w_{\alpha}$

Si $T^{+} < w_{\alpha}$ Entonces Rechazo $H_{0}$

Si $T^{+} \geq \text{\ w}\alpha$ Entonces No rechazo $H_{0}$

*Empleando la aproximación normal, si*

Si $1 - P\left( z \leq \left| Z \right| \right) \leq \alpha$ Entonces Rechazo
$H_{0}$

Si $1 - P\left( z \leq \left| Z \right| \right) > \alpha$ Entonces No rechazo
$H_{0}$

#### Prueba de una cola a la derecha

La prueba de una cola a la derecha implica poner a prueba las siguientes
hipótesis:

$H_{0}:\ E\left( D \right) \leq 0$ ó $E\left( X \right) \leq E(Y)$

$H_{a}:\ E(D) > 0$ ó $E(X) > E(Y)$

Para poner a prueba esta hipótesis se utiliza el estadístico T+, comparando el
estadístico con el valor crítico w1-α

Si $T^{+} > \ w_{1 - \alpha}$ Entonces Rechazo $H_{0}$

Si $T^{+}\leq w_{1 - \alpha}$Entonces No rechazo $H_{0}$

*Empleando la aproximación normal, si*

Si $1 - P\left( z \leq \left| Z \right| \right) \leq \alpha$ Entonces Rechazo
$H_{0}$

Si $1 - P\left( z \leq \left| Z \right| \right) > \alpha$ Entonces No rechazo
$H_{0}$

**Ejemplo 1**: Una especie de ave pone dos huevos por temporada reproductiva. Un
etólogo desea evaluar si el primer pichón que eclosiona presenta un
comportamiento menos agresivo que el segundo. Para ello, tomó 12 nidos al azar y
marcó a los pichones para poder identificar cuál de ellos fue el primero en
eclosionar. Asimismo, registró el número de “peleas entre hermanos” iniciadas
por cada pichón. Este registro fue iniciado a partir del momento en que ambos
pichones estaban en condiciones de iniciar una pelea y finalizó cuando alguno de
los pichones abandonó el nido. Los datos obtenidos fueron:

Table: (#tab:peleas) Número de peleas iniciadas


| Pichón 1 X                 | Pichón 2 Y |
|----------------------------|------------|
| 96                         | 91         |
| 65                         | 77         |
| 80                         | 71         |
| 72                         | 87         |
| 76                         | 77         |
| 72                         | 72         |
| 81                         | 88         |
| 88                         | 86         |
| 90                         | 91         |
| 64                         | 68         |
| 77                         | 71         |
| 65                         | 70         |

$H_{0}:\ E\left( X \right) \geq E(Y)$ ó $E\left( D \right) > 0$

$H_{a}:\ E\left( X \right) < E(Y)$ ó $E\left( D \right) < 0$

Cálculo de los estadísticos:

| Orden | X       | Y  | $D_{i}$    | $\|D_{i}\|$                                        | Rango     | $R_{i}$ |
|-------|---------|----|----------|------------------------------------------------------|-----------|-------|
| 1     | 72      | 72 | 0        | 0                                                    | \-        | \-    |
| 2     | 76      | 77 | \-1      | 1                                                    | 1.5       | \-1.5 |
| 3     | 90      | 91 | \-1      | 1                                                    | 1.5       | \-1.5 |
| 4     | 88      | 86 | 2        | 2                                                    | 3         | 3     |
| 5     | 64      | 68 | \-4      | 4                                                    | 4         | \-4   |
| 6     | 96      | 91 | 5        | 5                                                    | 5.5       | 5.5   |
| 7     | 65      | 70 | \-5      | 5                                                    | 5.5       | \-5.5 |
| 8     | 77      | 71 | 6        | 6                                                    | 7         | 7     |
| 9     | 81      | 88 | \-7      | 7                                                    | 8         | \-8   |
| 10    | 80      | 71 | 9        | 9                                                    | 9         | 9     |
| 11    | 65      | 77 | \-12     | 12                                                   | 10        | \-10  |
| 12    | 72      | 87 | \-15     | 15                                                   | 11        | \-11  |
| T+    | 24.5    |    | Valores  | 1 cola                                               | w_{0.05}  | 14    |
| T-    | 41.5    |    | críticos | 2 colas                                              | w_{0.025} | 11    |
| n     | 11      |    |          |                                                      | w_{0.975} | 55    |
| Z     | -0.756  |    |          | $P(z < = \|Z\|)$                                     | 0.775     |       |
|       |         |    |          | $1 - P(z \leq \|Z\|) = p$ (1 cola)                     | 0.225     |       |
|       |         |    |          | $2*\lbrack 1 - P(z \leq \|Z\|)\rbrack = p$ (2 colas)   | 0.449     |       |

La conclusión de esta prueba es no rechazar la $H_{0}$, ya que el $T^{+} >
w_{0.05}$. Utilizando la aproximación normal, la conclusión es similar
(p=0.225).

La prueba de Wilcoxon a dos colas puede realizarse con R. Esta prueba se
encuentra en la función `wilcox.test()` en el paquete stats. Los resultados para
el ejemplo son:


```
## 
## 	Wilcoxon signed rank test with continuity correction
## 
## data:  X and Y
## V = 24.5, p-value = 0.2382
## alternative hypothesis: true location shift is less than 0
```

Nótese que en esta tabla de resultados se presenta como estadístico T al menor
entre $T^{+}$ y $T^{-}$, y se nombra como V. Por otro lado, debemos indicar
que cola queremos usar en el parámetro alternative para que nos calcule la
probabilidad. Si queremos usar dos colas, la opción por defecto “two.sided” es
la que queremos. Entonces la probabilidad es calculada como $2*\lbrack P(w \leq
W)\rbrack$, donde w es el valor del estadístico y W es la distribución de
Wilcoxon. En cambio, si queremos la cola derecha, la opción a usar es “less”; si
queremos la cola izquierda la opción es “greater”. En el primer caso se calcula
la $P(w \leq W)$; mientras que en el segundo caso es calculada su complemento:
$\operatorname{1-P}\left( w \leq W \right)$. En todos los casos debemos
comparar $p$ con nuestro $\alpha$ y la regla de decisión será: Si $p \leq
\alpha$ Rechazo $H_{0}$.





# DISEÑOS EXPERIMENTALES

## Bloques al azar

### Diseño de experimentos


El diseño de un experimento se refiere a la estructura del experimento, en
particular a:

1.  El grupo de tratamientos incluidos en el estudio.

2.  El grupo de unidades experimentales incluidas en el estudio.

3.  Las reglas y procedimientos por los cuales los tratamientos son asignados a
    las unidades experimentales (o viceversa).

4.  Las medidas son hechas sobre las unidades experimentales después que los
    tratamientos han sido aplicados.

Los diseños estadísticos hacen referencia a las reglas y procedimientos a través
de los cuales los tratamientos son asignados a las unidades experimentales. El
uso de reglas y procedimientos impropios en la asignación de los tratamientos a
las unidades experimentales puede traer serias dificultades.

El proceso de medición es otro problema importante en los diseños
experimentales. Idealmente, el proceso de medición debería producir medidas
insesgadas y precisas. Medidas sesgadas pueden causar serias dificultades en el
análisis del estudio. Una fuente importante de sesgo se debe a la falta de
reconocimiento de diferencias en el proceso de evaluación.

### Elementos de los Diseños de Bloques al Azar


Un diseño de bloques al azar es un diseño aleatorio restringido en el cual las
unidades experimentales son distribuidas en grupos homogéneos, llamados
*bloques*, y los tratamientos son asignados al azar dentro de los bloques. Es un
diseño especialmente utilizado en experimentación agrícola, en el que se desean
comparar I tratamientos (por ejemplo, fertilizantes), asignando los tratamientos
en J bloques (por ejemplo J fincas), de modo que se reparten los I tratamientos
aleatoriamente en cada bloque (los fertilizantes se aplican aleatoriamente en I
parcelas de una misma finca). Para una correcta aplicación de este diseño debe
haber una máxima homogeneidad dentro de cada bloque, para que el efecto bloque
sea el mismo para todos los tratamientos dentro de cada bloque.

En un experimento agrícola, cada bloque está constituido por un número de
parcelas que forman una superficie de relativa homogeneidad respecto al resto
del campo. Cuando se conoce de gradiente de variabilidad del suelo, los bloques
deben orientarse perpendicularmente al gradiente y las unidades experimentales
deben tener su mayor dimensión en la misma dirección y sentido que dicho
gradiente.

En experimentos con animales, cada bloque estará constituido por un número de
animales de aproximadamente igual peso, edad, raza, etc. Debe haber diferencias
entre bloques.

(ref:bloque) Esquema de diseño en bloques al azar. Cada bloque se dividió en
cuatro y cada uno de los tratamientos dentro de los bloques se asignó al azar.

<div class="figure">
<img src="diseno-experimental_files/figure-epub3/bloques-1.png" alt="(ref:bloque)"  />
<p class="caption">(\#fig:bloques)(ref:bloque)</p>
</div>


### Criterios para definir los bloques


Es necesaria una definición precisa de la unidad experimental, que dependerá del
problema en particular. Una vez definida existen dos tipos de criterios para
definir los bloques:

1.  Características asociadas con la unidad experimental: edad, inteligencia,
    educación, áreas geográficas, tamaño de la población, etc.

2.  Características asociadas con las características experimentales:
    observadores, instrumento de medición, tiempo de procesado, etc.

### Ventajas y desventajas


1.  Ventajas

2.  Puede proveer resultados más precisos que un diseño completamente al azar de
    tamaño comparable.

3.  Se pueden estimar los datos de algunas unidades experimentales si se
    pierden.

4.  El análisis estadístico es relativamente simple.

5.  Desventajas

6.  Las observaciones perdidas dentro de cada bloque requieren cálculos
    complejos.

7.  Los grados de libertad del error experimental no son tan grandes como en un
    diseño completamente aleatorizado.

8.  Se hacen más suposiciones que en un modelo completamente al azar.

### Modelo


Se puede pensar a un diseño en bloques al azar como un estudio de dos factores
(los bloques y los tratamientos son los factores), con una observación por
celda. Si se puede asumir que no hay interacción entre los dos factores, se
puede realizar un análisis de los efectos de los factores cuando hay una sola
observación por celda y los factores tienen efectos fijos.

Así, el modelo para un diseño en bloques al azar, cuando tanto los bloques como
los tratamientos tienen efectos fijos y hay n bloques y r tratamientos, es:

$$
Y_{ij} = \mu_{\bullet \bullet} + \rho_{i} + \tau_{j} + \varepsilon_{ij}
$$

donde:

$\mu_{\bullet \bullet}$. es una constante

$\rho_{i}$son constantes para el efecto del bloque, sujetas a la restricción
$\sum\rho_{i} = 0$.

$\tau_{j}$ son constantes para los efectos de los tratamientos, sujetas a la
restricción $\sum\tau_{i} = 0$

$\varepsilon_{ij}$ son v. a. independientes $N(0, \sigma^{2})$

$$
i = 1,2,...,n;j = 1,2,...,r
$$

Las $Y_{ij}$ observaciones son independientes y se distribuyen normalmente, con
media:

$$
E\left( Y_{ij} \right) = \mu_{\bullet \bullet} + \rho_{i} + \tau_{j}
$$

y varianza constante:

$$
{Var}\left( Y_{ij} \right) = \sigma^{2}
$$

## Análisis de la varianza y pruebas


Los estimadores de mínimos cuadrados son:

| Parámetro                 | Estimador                                                                          |
|---------------------------|:-----------------------------------------------------------------------------------|
| $\mu_{\bullet \bullet}$   | ${\hat{\mu}}_{\bullet \bullet}  =  \overline{Y_{\bullet \bullet}}$                 |
| $\rho_{i}$                | ${\hat{\rho}}_{i} = {\overline{Y}}_{i \bullet} - {\overline{Y}}_{\bullet \bullet}$ |
| $\tau_{j}$                | ${\hat{\tau}}_{j} = {\overline{Y}}_{\bullet j} - {\overline{Y}}_{\bullet \bullet}$ |

Los valores ajustados serán entonces:

$$
{\hat{Y}}_{ij}  = \overline{Y}_{\bullet \bullet} + \left( {\overline{Y}}_{i \bullet} - {\overline{Y}}_{\bullet \bullet} \right) + \left( {\overline{Y}}_{\bullet j} - {\overline{Y}}_{\bullet \bullet} \right) = {\overline{Y}}_{i \bullet} + {\overline{Y}}_{\bullet j} - {\overline{Y}}_{\bullet \bullet}
$$

y los residuos son:

$$
\varepsilon_{ij} = {\overline{Y}}_{ij} - {\hat{Y}}_{ij}  = {\overline{Y}}_{ij} - {\overline{Y}}_{i \bullet} + {\overline{Y}}_{\bullet j} - {\overline{Y}}_{\bullet \bullet}
$$

### Análisis de la varianza


#### Hipótesis

| Efectos de los tratamientos fijos        | Efectos de los tratamientos aleatorios |
|------------------------------------------|----------------------------------------|
| $H_{0}$: todos $\tau_{j} = 0$        | $H_{0}:\sigma_{\tau}^{2} = 0$         |
| $H_{a}$: no todos los $\tau_{j} = 0$ | $H_{a}:\sigma_{\tau}^{2} > 0$        |

Se usa la misma prueba estadística, tanto si los efectos de los tratamientos son
al azar como si son fijos.

$$
F^{*} = \frac{CM_{TR}}{CM_{\text{BL.TR}}}
$$

la regla de decisión será entonces:

Sí $F^{*} \leq F_{\alpha;\left( r-1 \right),\left( n-1 \right)\left( r-1
\right)}$ no se rechaza $H_{0}$

Sí $F^{*} > F_{\alpha;\left( r-1 \right),\left( n-1 \right)\left( r-1 \right)}$
se rechaza $H_{0}$

### Prueba de Tukey de Aditividad


La suma de cuadrados especial de interacción está dada, en este caso, por:

$$
SC_{BL \bullet TR}^{*} = \frac{\left\lbrack \sum_{i}^{}{\sum_{j}^{}{\left(  \overline{Y_{i \bullet}} -  \overline{Y_{\bullet \bullet}} \right)\left(  \overline{Y_{\bullet j}} -  \overline{Y_{\bullet \bullet}} \right)Y_{ij}}} \right\rbrack^{2}}{{\sum_{i}^{}\left(  \overline{Y_{i \bullet}} -  \overline{Y_{\bullet \bullet}} \right)}^{2}\sum_{j}^{}\left(  \overline{Y_{\bullet j}} -  \overline{Y_{\bullet \bullet}} \right)^{2}}
$$

La suma de cuadrados remanente se obtiene como:

$$
SC_{Rem}^{*} = SC_{T}-SC_{BL}-SC_{TR}-SC_{BL \bullet TR}^{*}
$$

La prueba estadística es.

$$
F^{*} = \frac{SC_{BL\bullet TR}^{*}}{1} \div \frac{SC_{Rem}^{*}}{rn - r - n}
$$

Table: (\#tab:anova-bloque-azar) Tabla de anova para un diseño de bloques al azar


| **Fte. de variación** | SC                                                                                                                                                                                                           | GL                            | CM                                                                                                                                         | E(CM) Tratamientos fijos                                                                                                                  | E(CM) Tratamientos aleatorios                                                                                                             |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Bloques**           | $r{\sum_{i}^{}\left(  \overline{Y_{i \bullet}}- \overline{Y_{\bullet \bullet}} \right)}^{2}$ | $n  -  1$         | $\frac{SC_{BL}}{n - 1}$                                                                     | $\sigma^{2}+\frac{r\sum_{i}^{}\rho_{i}}{n - 1}$ | $\sigma^{2}+\frac{r\sum_{i}^{}\rho_{i}}{n - 1}$ |
| **Tratamientos**      | $n\sum_{j}^{}\left(  \overline{Y_{\bullet j}}- \overline{Y_{\bullet \bullet}} \right)^{2}$   | $r  -  1$         | $\frac{SC_{TR}}{r - 1}$                                                                     | $\sigma^{2}+\frac{n\sum_{j}^{}\tau_{j}}{r - 1}$ | $\sigma^{2}+ \backslash n\sigma_{\tau}^{2}$                         |
| **Error**             | $SC_T - SC_{BL}  -  SC_{TR}$                                                                                                                                                                         | $(n  1)(r  1)$ | $\frac{SC_{BL \bullet TR}^{*}}{\left( n - 1 \right)\left( r - 1 \right)}$ | $\sigma^{2}$                                                                                                    | $\sigma^{2}$                                                                                                    |
| **Total**             |                                                                                                                                                                                                              | $nr - 1$                        |                                                                                                                                            |                                                                                                                                     |                                                                                                                                     |


**Ejemplo:** Para estudiar las diferencias entre tres fertilizantes sobre la
producción de papas, se dispuso de 5 fincas, cada una de las cuales se dividió
en tres parcelas del mismo tamaño y tipo. Los fertilizantes fueron asignados al
azar en las parcelas de cada finca. El rendimiento en toneladas fue:

| Finca | Fertilizante 1 | Fertilizante 2 | Fertilizante 3 |
|-------|----------------|----------------|----------------|
| 1     | 1              | 5              | 8              |
| 2     | 2              | 8              | 14             |
| 3     | 7              | 9              | 16             |
| 4     | 6              | 13             | 18             |
| 5     | 12             | 14             | 17             |

Se desea saber si hay diferencias entre los fertilizantes.

Se trata de un diseño de bloques al azar, cada finca es un bloque.

1.  Prueba de aditividad

$$
SC_{BL \bullet TR}^{*} = 0.262665101
$$

$$
SC_{Rem}^{*} = 23.60400157
$$

$$
CM_{Rem}^{*} = 3.372000224
$$

$$
F = 0.077895932
$$

$$
p = 0.78823515
$$

Por lo tanto, no se rechaza la hipótesis nula, no hay interacción.

1.  ANOVA

| RESUMEN                   | Cuenta            | Suma               | Promedio                  | Varianza   |              |                      |
|---------------------------|-------------------|--------------------|---------------------------|------------|--------------|----------------------|
| 1                         | 3                 | 14                 | 4.66666667                | 12.3333333 |              |                      |
| 2                         | 3                 | 24                 | 8                         | 36         |              |                      |
| 3                         | 3                 | 32                 | 10.6666667                | 22.3333333 |              |                      |
| 4                         | 3                 | 37                 | 12.3333333                | 36.3333333 |              |                      |
| 5                         | 3                 | 43                 | 14.3333333                | 6.33333333 |              |                      |
|                           |                   |                    |                           |            |              |                      |
| Fertilizante 1            | 5                 | 28                 | 5.6                       | 19.3       |              |                      |
| Fertilizante 2            | 5                 | 49                 | 9.8                       | 13.7       |              |                      |
| Fertilizante 3            | 5                 | 73                 | 14.6                      | 15.8       |              |                      |

| Origen de las variaciones | Suma de cuadrados | Grados de libertad | Promedio de los cuadrados | F          | Probabilidad | Valor crítico para F |
|---------------------------|-------------------|--------------------|---------------------------|------------|--------------|----------------------|
| Filas                     | 171.333333        | 4                  | 42.8333333                | 14.3575419 | 0.00100812   | 3.83785448           |
| Columnas                  | 202.8             | 2                  | 101.4                     | 33.9888268 | 0.00012292   | 4.45896831           |
| Error                     | 23.8666667        | 8                  | 2.98333333                |            |              |                      |
|                           |                   |                    |                           |            |              |                      |
| Total                     | 398               | 14                 |                           |            |              |                      |

*En R*


```
## 
## Tukey test on 5% alpha-level:
## 
## Test statistic: 0.0779 
## Critival value: 5.591 
## The additivity hypothesis cannot be rejected.
```


--------------------------------------
  fertilizante    mean   var     sd   
---------------- ------ ------ -------
 Fertilizante 1   5.6    19.3   4.393 

 Fertilizante 2   9.8    13.7   3.701 

 Fertilizante 3   14.6   15.8   3.975 
--------------------------------------

Table: (\#tab:fert-1) Producción de papas por fertilizante


-------------------------------
 Finca   mean     var     sd   
------- ------- ------- -------
   1     4.667   12.33   3.512 

   2       8      36       6   

   3     10.67   22.33   4.726 

   4     12.33   36.33   6.028 

   5     14.33   6.333   2.517 
-------------------------------

Table: (\#tab:fert-2) Producción de papas por finca


-------------------------------
 Test statistic   df   P value 
---------------- ---- ---------
     0.1074       2    0.9477  
-------------------------------

Table: (\#tab:fert-3) Prueba de homogeneidad de varianzas de Bartlett.


-----------------------------------
  &nbsp;     Df   F value   Pr(>F) 
----------- ---- --------- --------
 **group**   2    0.06604   0.9364 

             12     NA        NA   
-----------------------------------

Table: (\#tab:fert-4) Prueba de homogeneidad
       de varianzas de Levene.


----------------------------------------------------------------
      &nbsp;        Df   Sum Sq   Mean Sq   F value    Pr(>F)   
------------------ ---- -------- --------- --------- -----------
 **fertilizante**   2    202.8     101.4     33.99    0.0001229 

    **Finca**       4    171.3     42.83     14.36    0.001008  

  **Residuals**     8    23.87     2.983      NA         NA     
----------------------------------------------------------------

Table: (\#tab:anova-fert) ANOVA para la producción de papa
       con tres fertilizantes con bloques al alzar.


----------------------------------------------------------------------
  fertilizante    lsmean     SE     df   lower.CL   upper.CL   .group 
---------------- -------- -------- ---- ---------- ---------- --------
 Fertilizante 1    5.6     0.7724   8     3.819      7.381       1    

 Fertilizante 2    9.8     0.7724   8     8.019      11.58       2    

 Fertilizante 3    14.6    0.7724   8     12.82      16.38       3    
----------------------------------------------------------------------

Table: (\#tab:anova-fert) Medias marginales, error
       estándar, grados de libertad, intervalo de confianza inferior y superior
       del 95%, y agrupamiento según la prueba de Tukey.

(ref:produccion) Producción de papas (tn/ha) bajo tres fertilizantes en
5 fincas.

<div class="figure">
<img src="diseno-experimental_files/figure-epub3/unnamed-chunk-2-1.png" alt="(ref:produccion)" width="75%" />
<p class="caption">(\#fig:unnamed-chunk-2)(ref:produccion)</p>
</div>


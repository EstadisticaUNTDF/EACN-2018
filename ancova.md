

# ANCOVA

 ANOVA (Análisis de la Varianza) y regresión lineal aparentemente no tienen 
 relación entre sí. El primero se ocupa de variables explicatorias cualitativas,
 mientras que el segundo de variables explicatorias cuantitativas. El análisis
 de la Covarianza se ocupa de analizar datos con ambos tipos de variables. 
 De esta forma se obtiene una regresión entre la variable de respuesta y la
 variable explicatoria cuantitativa por cada nivel de la variable explicatoria
 cualitativa. Supongamos que deseamos modelar el peso de acuerdo a la edad y
 el sexo. El modelo máximo tiene cuatro parámetros: dos ordenadas al origen, y
 dos pendientes (una para machos y otra para hembras). 
 
 $$
 peso_{hembra} = a_{hembra} + b_{hembra} \times edad\\
 peso_{macho} = a_{macho} + b_{macho} \times edad
 $$
 
 Como debe cumplirse con el principio de parsimonia hay que simplificar el 
 modelo lo más posible. En total hay seis modelos posibles, siendo el más 
 complejo el de cuatro parámetros. Puede ser que los necesitemos todos ellos.
 El modelo de cuatro parámetros está representado en la Figura
 \@ref(fig:modelos-figura-ejemplo)-a. Otra forma puede ser que solo necesitemos un
 solo parámetro de pendiente como en la Figura \@ref(fig:modelos-figura-ejemplo)-b.
 Otra opción, es que la ordenada al origen sean iguales pero la pendientes sean
 diferentes, como en la Figura \@ref(fig:modelos-figura-ejemplo)-c. Puede ser que
 la edad no tenga efecto sobre el peso entonces pero que el sexo si tenga efecto
 como en la Figura \@ref(fig:modelos-figura-ejemplo)-d. Entonces este modelo tendrá
 solo dos parámetros. También puede darse el caso opuesto, que la edad tenga
 efecto sobre el peso pero no el sexo, como en la Figura
 \@ref(fig:modelos-figura-ejemplo)-e. La última opción es que ni la edad ni el sexo
 tengan efecto sobre el peso, como en la Figura \@ref(fig:modelos-figura-ejemplo)-f.
 Este último modelo solo tendrá un parámetro.
 
 
 
<div class="figure">
<img src="ancova_files/figure-epub3/modelos-figura-ejemplo-1.png" alt="Varios modelos de ANCOVA con un número diferente de parámetros. a) Dos ordenadas al origen y dos pendientes. b) dos ordenadas al origen y una pendiente común. c) Una ordenada al origen y dos pendientes. d) Dos ordenadas al origen, sin pendiente. e) Una ordenada al origen y una pendiente. f) Una ordenada al origen, sin pendiente."  />
<p class="caption">(\#fig:modelos-figura-ejemplo)Varios modelos de ANCOVA con un número diferente de parámetros. a) Dos ordenadas al origen y dos pendientes. b) dos ordenadas al origen y una pendiente común. c) Una ordenada al origen y dos pendientes. d) Dos ordenadas al origen, sin pendiente. e) Una ordenada al origen y una pendiente. f) Una ordenada al origen, sin pendiente.</p>
</div>
 
 Como siempre, las decisión acerca de si conservar ambos parámetros o si son
 significativos se realiza con pruebas de hipótesis. 
 
 Por ejemplo, se quiere ver cual es la capacidad de regeneración de las plantas
 y producir semillas luego del pastoreo. Antes del pastoreo, se registró el 
 tamaño de la planta como el diámetro de la parte superior del rizoma. El
 pastoreo tiene dos niveles: con pastoreo y sin pastoreo. La respuesta es el 
 peso de las semillas producidas. Es de esperar que las plantas más grandes
 produzcan más semillas. Y que las plantas pastoreadas produzcan menos semillas
 que las plantas no pastoreadas. 
 

```r
compensation <- read_csv("data/ipomopsis.csv")
compensation
```

```
## # A tibble: 40 x 3
##     Root Fruit Grazing 
##    <dbl> <dbl> <chr>   
##  1  6.22  59.8 Ungrazed
##  2  6.49  61.0 Ungrazed
##  3  4.92  14.7 Ungrazed
##  4  5.13  19.3 Ungrazed
##  5  5.42  34.2 Ungrazed
##  6  5.36  35.5 Ungrazed
##  7  7.61  87.7 Ungrazed
##  8  6.35  63.2 Ungrazed
##  9  4.97  24.2 Ungrazed
## 10  6.93  64.3 Ungrazed
## # ... with 30 more rows
```
 
 Los datos tienen tres columnas, la primera `Root` corresponde al tamaño del
 rizoma en centímetros. `Fruit` corresponde al peso de semillas en gramos. Y
 por último, `Grazing` corresponde a si las plantas fueron pastoreadas `Grazed`
 o no `Ungrazed`.
 

```r
ggplot(compensation, aes(x = Root, y = Fruit)) + 
  geom_point()
```

<div class="figure">
<img src="ancova_files/figure-epub3/root-fruit-1.png" alt="Diagrama de dispersión entre el tamaño del rizoma y el peso de las semillas"  />
<p class="caption">(\#fig:root-fruit)Diagrama de dispersión entre el tamaño del rizoma y el peso de las semillas</p>
</div>
 
 La Figura \@ref(fig:root-fruit) muestra que las plantas más grandes produjeron
 más semillas, tal y como se esperaba.
 
 ¿Y qué pasó con el nivel de pastoreo? En la Figura \@ref(fig:grazed-fruit) los
 resultados no son tan claros. La línea se corresponde a la media de cada grupo
 y muestra que ¡Las plantas pastoreadas producen más semillas que las no 
 pasteoreadas! Un resultado completamente sorpredente, y contrario a lo 
 esperado ¿Esto será así realmente o habrá alguna explicación?
 
 

```r
ggplot(compensation, aes(x = Grazing, y = Fruit)) + 
  geom_point() + 
  stat_summary(fun.y = mean, fun.ymin = mean, fun.ymax = mean,
                 geom = "crossbar", width = 0.2)
```

<div class="figure">
<img src="ancova_files/figure-epub3/grazed-fruit-1.png" alt="Datos de niveles de pastoreo y peso de semillas, la barra representa la media."  />
<p class="caption">(\#fig:grazed-fruit)Datos de niveles de pastoreo y peso de semillas, la barra representa la media.</p>
</div>
 
 El modelo más complejo incluye cuatro parámetros. Dos ordenadas al origen 
 y dos pendientes.
 
 $$
 Fruit_{grazed} = a_{grazed} + b_{grazed} \times Root\\
 Fruit_{ungrazed} = a_{ungrazed} + b_{ungrazed} \times Root
 $$
Ajustando este modelo en *R* es parecido a hacer un modelo de regresión usando
la función `lm()`


```r
semillas_completo <- lm(Fruit ~ Grazing + Root + Grazing:Root, data = compensation)
```
 
 Solo vamos a ver modelos de ANCOVA simples con una variable cualitativa y otra
 cuantitativa. Como es el caso de una interacción entre una variable 
 cualitativa y otra cuantitativa, el resultado es que haya varias pendientes. 
 Una por cada nivel de la variable cualitativa. Veamos cual es el resultado de
 este análisis:
 

```r
summary(semillas_completo)
```

```
## 
## Call:
## lm(formula = Fruit ~ Grazing + Root + Grazing:Root, data = compensation)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -17.3177  -2.8320   0.1247   3.8511  17.1313 
## 
## Coefficients:
##                      Estimate Std. Error t value Pr(>|t|)    
## (Intercept)          -125.173     12.811  -9.771 1.15e-11 ***
## GrazingUngrazed        30.806     16.842   1.829   0.0757 .  
## Root                   23.240      1.531  15.182  < 2e-16 ***
## GrazingUngrazed:Root    0.756      2.354   0.321   0.7500    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 6.831 on 36 degrees of freedom
## Multiple R-squared:  0.9293,	Adjusted R-squared:  0.9234 
## F-statistic: 157.6 on 3 and 36 DF,  p-value: < 2.2e-16
```
 
 Empezando a leer los resultados desde abajo, vemos que el modelo es 
 significativo. Es decir, al menos uno de los parámetros es distinto de 0. Y que
 ajuste de los datos al modelo parece ser muy bueno, el R^2^ ajustado es mayor a
 90%. 
 
 Más arriba tenemos los coeficientes del modelo. Recordemos que en *R* obtenemos
 los coeficientes obtenemos son solo el valor real para la primera vez que 
 aparece. Luego debemos obtener el valor del parámetro como la suma del 
 parámetro principal y el efecto del nivel. Para aclarar, reemplazando la 
 ecuación con los valores de $a$ y $b$ para cada una de las ecuaciones. El 
 primer valor, `(Intercept)` corresponde a la ordenada al origen para *Grazed*
 Esto es así porque el primer nivel del un factor va a ser el que sea asignado 
 a `(Intercept)` y va a correponder a nivel de base para la determinación de
 la pendiente. Por lo tanto, el coeficiente de `Root` que vemos corresponde
 también al nivel *Grazed*
 
 $$
 Fruit_{grazed} = -125.173 + 23.24 \times Root\\
 $$
 Completar la ecuación para el nivel *Ungrazed* es un poco más complicado porque
 lo que vemos es el efecto del nivel y no el parámetro. El efecto de los otros
 niveles aparece como el nombre del factor seguido por el nombre del nivel.
 En nuestro ejemplo, *Grazing* es el factor, el nivel es *Ungrazed* y aparece
 como `GrazedUngrazed` en los coeficientes. Por otro lado, el efecto de 
 *Ungrazed* sobre la pendiente aparece como la interacción entre 
 `GrazedUngrazed` y `Root`. 
 
 $$
 Fruit_{ungrazed} = \left(-125.173 + 30.806\right) + \left( 23.24 + 0.756\right)\times Root \\ 
 Fruit_{ungrazed} = \left(-94.367\right) + \left( `r23.24 + 0.756`\right)\times Root \\ 
 $$
 Por otro lado, debemos considerar si debemos conservar todos esos parámetros o
 si podemos poner algún parametro en común. Empezemos por ver si las pendientes
 son distintas. Esto implica, realizar un nuevo modelo 
 con una pendiente común para las plantas *Grazed* y *Ungrazed*:
 
 $$
 Fruit_{grazed} = a_{grazed} + b \times Root\\
 Fruit_{ungrazed} = a_{ungrazed} + b \times Root
 $$
 
 Ajustarlo en *R* es como hacerlo en el caso anterior pero eliminando la
 interacción en la formula.
 

```r
semillas_pendiente_comun <- lm(Fruit ~ Grazing + Root, data = compensation)
```
 
 Para comprobar si el modelo más simple debe ser preferido usamos la
 función `anova()` para comprobar si el modelo más complejo es 
 significativamente diferente del más simple. De no serlo, debemos descartarlo
 y quedarnos con el más simple.
 

```r
anova(semillas_completo, semillas_pendiente_comun)
```

```
## Analysis of Variance Table
## 
## Model 1: Fruit ~ Grazing + Root + Grazing:Root
## Model 2: Fruit ~ Grazing + Root
##   Res.Df    RSS Df Sum of Sq      F Pr(>F)
## 1     36 1679.7                           
## 2     37 1684.5 -1   -4.8122 0.1031   0.75
```
 
 Vemos que diferencia es muy pequeña, con un estadístico *F* asociado muy 
 pequeño de 0.1031 y una probablidad de un *F* mayor de 0.75. Por lo tanto, 
 no hay diferencias significativas entre los modelos, descartando el más
 complejo.
 
 Para ver los coeficientes usamos `summary()`
 

```r
summary(semillas_pendiente_comun)
```

```
## 
## Call:
## lm(formula = Fruit ~ Grazing + Root, data = compensation)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -17.1920  -2.8224   0.3223   3.9144  17.3290 
## 
## Coefficients:
##                 Estimate Std. Error t value Pr(>|t|)    
## (Intercept)     -127.829      9.664  -13.23 1.35e-15 ***
## GrazingUngrazed   36.103      3.357   10.75 6.11e-13 ***
## Root              23.560      1.149   20.51  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 6.747 on 37 degrees of freedom
## Multiple R-squared:  0.9291,	Adjusted R-squared:  0.9252 
## F-statistic: 242.3 on 2 and 37 DF,  p-value: < 2.2e-16
```
 
 
 Volviendo a leer los coeficientes vemos que todos son significativos ya que
 el valor del estadístico *t* asociado a cada uno es menor al 0.05. 
 Por lo tanto, hay un efecto del tamaño del rizoma que es común a todas las 
 plantas y hay diferencias significativas entre las plantas pastoreados y las
 no pastoreadas. ¿Cuales producen más semillas? Viendo el signo positivo del
 efecto de las plantas no pastoreadas (*GrazingUngrazed*) es posible deducir que
 ellas son las que producen más semillas. La formula para cada una de las 
 rectas es:
 

 $$
  Fruit_{grazed} = -127.829 +  23.56 \times Root \\ 
  Fruit_{ungrazed} = \left(-127.829 + 36.103\right) + 23.56 \times Root  \\ 
 Fruit_{ungrazed} = \left(-91.726\right) + 23.56 \times Root  
 $$
 
<div class="figure">
<img src="ancova_files/figure-epub3/fig-modelo-final-1.png" alt="Gráfico de dispersión entre el tamaño del rizoma y el peso de las semillas. Se muestra la línea de regresión estimada por el modelo ANCOVA final."  />
<p class="caption">(\#fig:fig-modelo-final)Gráfico de dispersión entre el tamaño del rizoma y el peso de las semillas. Se muestra la línea de regresión estimada por el modelo ANCOVA final.</p>
</div>
 
 Viendo la Figura \@ref(fig:fig-modelo-final) resulta claro porque el resultado de que las plantas 
 pastoreadas producian más semillas era engañoso. Las plantas pastoreadas eran
 más grandes, y el tamaño de la planta estaba oscurenciendo el resultado.
 
 Si no hubiesemos tenido en cuenta el tamaño, habríamos llegado a la conclusión
 equivocada. Realizando la prueba estadística sobre el modelo incorrecto 
 llegariamos a la conclusión de que efectivamente el pastoreo aumenta la 
 producción de semillas.
 

```r
anova(lm(Fruit ~ Grazing, data = compensation))
```

```
## Analysis of Variance Table
## 
## Response: Fruit
##           Df  Sum Sq Mean Sq F value  Pr(>F)  
## Grazing    1  2910.4 2910.44  5.3086 0.02678 *
## Residuals 38 20833.4  548.25                  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
 
 Usando el modelo correcto vemos que la media de las plantas no pastoreadas
 es mayor que las pastereadas (41.35 vs 77.46):
 

```r
summary(emmeans(semillas_pendiente_comun, ~Grazing)) 
```

```
##  Grazing    emmean       SE df lower.CL upper.CL
##  Grazed   41.35888 1.989014 37 37.32875 45.38900
##  Ungrazed 77.46212 1.989014 37 73.43200 81.49225
## 
## Confidence level used: 0.95
```
 
 Esto se obtiene usando la formula en la media de *Root*.
 
 $$
 Fruit_{grazed} = -127.829 +  23.56 \times \overline{Root} \\ 
 Fruit_{ungrazed} = \left(-91.726\right) + 23.56 \times \overline{Root}\\
 Fruit_{grazed} = -127.829 +  23.56 \times 7.18115 \\ 
 Fruit_{ungrazed} = \left(-91.726\right) + 23.56 \times 7.18115\\
  Fruit_{grazed} = 41.358894 \\ 
 Fruit_{ungrazed} = 77.461894
 $$

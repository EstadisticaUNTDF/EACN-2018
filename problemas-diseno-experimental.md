# Problemas ANOVA Diseño Experimental




<div class="atencion">
<p>Antes de comenzar bajen el archivo donde realizarán su informe reproducible. En la consola copien este código:</p>
</div>

`download.file("bit.ly/informe-bloques", "informe-bloques.Rmd")`

<div class="atencion">
<p>Pueden abrirlo desde la pestaña de archivos, a la derecha. Cambien el nombre por el suyo en el encabezado y mientras leen este capítulo respondan las preguntas.</p>
</div>

## Ejemplo

Para estudiar las diferencias entre tres fertilizantes sobre la
producción de papas, se dispuso de 5 fincas, cada una de las cuales se dividió
en tres parcelas del mismo tamaño y tipo. Los fertilizantes fueron asignados al
azar en las parcelas de cada finca. El rendimiento en toneladas fue:



```r
fert %>%  pander(caption = "(#tab:papas) Rendimiento en toneladas de papa por
                 ha en 5 fincas (bloques) bajo tres fertilizantes 
                 (tratamientos).")
```


----------------------------------------------------------
 Finca   Fertilizante.1   Fertilizante.2   Fertilizante.3 
------- ---------------- ---------------- ----------------
   1           1                5                8        

   2           2                8                14       

   3           7                9                16       

   4           6                13               18       

   5           12               14               17       
----------------------------------------------------------

Table: (#tab:papas) Rendimiento en toneladas de papa por
                 ha en 5 fincas (bloques) bajo tres fertilizantes 
                 (tratamientos).

El gráfico de perfiles de los datos


```r
fert_long <- fert %>%
  gather(key = "Fertilizante", value = "Produccion", -Finca) %>% 
  mutate(Finca = factor(Finca))

p <- ggplot(fert_long, aes(Finca, Produccion, color = Fertilizante)) +
  geom_line(aes(group = Fertilizante, linetype = Fertilizante)) +
  geom_point(aes(shape = Fertilizante))
direct.label(p, "last.qp")
```

```
## Warning: Ignoring unknown aesthetics: linetype
```

<div class="figure">
<img src="problemas-diseno-experimental_files/figure-epub3/ej_plot-1.png" alt="Perfiles"  />
<p class="caption">(\#fig:ej_plot)Perfiles</p>
</div>

Lo primero que hay comprobar es que se da el supuesto de supuesto de aditividad.
Es decir que no hay interacción entre los bloques y los tratamientos. Es decir,
que el bloque que produce mayores o menores rendimientos lo hace para todos los 
fertilizantes y viceversa. Esto se hace con el test de aditividad de Tukey, 
la función `tukey.test()` en *R*. Recuerden del práctico de 
[ANOVA doble][aditividad-tukey] que la función necesita una matriz con solo
los datos.


```r
fert %>% select(-Finca) %>% 
  as.matrix() %>% 
  tukey.test()
```

```
## 
## Tukey test on 5% alpha-level:
## 
## Test statistic: 0.0779 
## Critival value: 5.591 
## The additivity hypothesis cannot be rejected.
```

Medias por Fertilizante:


```r
fert_long %>% 
  group_by(Fertilizante) %>% 
  summarise(media = mean(Produccion),
             var = var(Produccion),
             sd = sd(Produccion))
```

```
## # A tibble: 3 x 4
##   Fertilizante   media   var    sd
##   <chr>          <dbl> <dbl> <dbl>
## 1 Fertilizante.1  5.60  19.3  4.39
## 2 Fertilizante.2  9.80  13.7  3.70
## 3 Fertilizante.3 14.6   15.8  3.97
```

Medias por Finca:


```r
fert_long %>% 
  group_by(Finca) %>% 
  summarise(media = mean(Produccion),
             var = var(Produccion),
             sd = sd(Produccion))
```

```
## # A tibble: 5 x 4
##   Finca media   var    sd
##   <fct> <dbl> <dbl> <dbl>
## 1 1      4.67 12.3   3.51
## 2 2      8.00 36.0   6.00
## 3 3     10.7  22.3   4.73
## 4 4     12.3  36.3   6.03
## 5 5     14.3   6.33  2.52
```

Prueba de supuestos:


```r
bartlett.test(Produccion ~ Fertilizante, 
                     data = fert_long)
```

```
## 
## 	Bartlett test of homogeneity of variances
## 
## data:  Produccion by Fertilizante
## Bartlett's K-squared = 0.10744, df = 2, p-value = 0.9477
```

```r
leveneTest(Produccion ~ Fertilizante, data = fert_long)
```

```
## Warning in leveneTest.default(y = y, group = group, ...): group coerced to
## factor.
```

```
## Levene's Test for Homogeneity of Variance (center = median)
##       Df F value Pr(>F)
## group  2   0.066 0.9364
##       12
```

Para realizar el ANOVA se usa la formula de misma manera que cuando tenemos un diseño
de dos factores sin réplicas. Es decir, del lado derecho de la fórmula, se escribe
el nombre de la variable unido con un signo `+`con la variable que corresponde a los
bloques. El orden no importa. Siguiendo el ejemplo de fertilizante:


```r
fert_aov <- aov(Produccion ~ Fertilizante + Finca, data = fert_long)
summary(fert_aov)
```

```
##              Df Sum Sq Mean Sq F value   Pr(>F)    
## Fertilizante  2 202.80  101.40   33.99 0.000123 ***
## Finca         4 171.33   42.83   14.36 0.001008 ** 
## Residuals     8  23.87    2.98                     
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

Para obtener las comparaciones múltiples entre los fertilizantes se puede usar
la función `emmeans()` (*estimated marginal means*).


```r
fert_lsm <- emmeans(fert_aov, pairwise ~ Fertilizante)
summary(fert_lsm)
```

```
## $emmeans
##  Fertilizante   emmean       SE df  lower.CL  upper.CL
##  Fertilizante.1    5.6 0.772442  8  3.818746  7.381254
##  Fertilizante.2    9.8 0.772442  8  8.018746 11.581254
##  Fertilizante.3   14.6 0.772442  8 12.818746 16.381254
## 
## Results are averaged over the levels of: Finca 
## Confidence level used: 0.95 
## 
## $contrasts
##  contrast                        estimate       SE df t.ratio p.value
##  Fertilizante.1 - Fertilizante.2     -4.2 1.092398  8  -3.845  0.0121
##  Fertilizante.1 - Fertilizante.3     -9.0 1.092398  8  -8.239  0.0001
##  Fertilizante.2 - Fertilizante.3     -4.8 1.092398  8  -4.394  0.0058
## 
## Results are averaged over the levels of: Finca 
## P value adjustment: tukey method for comparing a family of 3 estimates
```

Para obtener los grupos la función `cld()` (*compact letter display*) permite 
construirlos:


```r
cld(fert_lsm)
```

```
## NOTE: 'cld()' groupings are determined separately for each list member.
```

```
## $emmeans
##  Fertilizante   emmean       SE df  lower.CL  upper.CL .group
##  Fertilizante.1    5.6 0.772442  8  3.818746  7.381254  1    
##  Fertilizante.2    9.8 0.772442  8  8.018746 11.581254   2   
##  Fertilizante.3   14.6 0.772442  8 12.818746 16.381254    3  
## 
## Results are averaged over the levels of: Finca 
## Confidence level used: 0.95 
## P value adjustment: tukey method for comparing a family of 3 estimates 
## significance level used: alpha = 0.05 
## 
## $contrasts
##  contrast                        estimate       SE df t.ratio p.value
##  Fertilizante.1 - Fertilizante.3     -9.0 1.092398  8  -8.239  0.0001
##  Fertilizante.2 - Fertilizante.3     -4.8 1.092398  8  -4.394  0.0058
##  Fertilizante.1 - Fertilizante.2     -4.2 1.092398  8  -3.845  0.0121
##  .group
##   1    
##    2   
##    2   
## 
## Results are averaged over the levels of: Finca 
## P value adjustment: tukey method for comparing a family of 3 estimates 
## significance level used: alpha = 0.05
```


## Problemas

1. Se estudia mediante un diseño de bloques al azar el efecto de una hormona
de crecimiento sobre ratas jóvenes. Se prueba una dosis débil (tratamiento A),
una dosis fuerte (tratamiento B) y un tercer tratamiento, que sería el testigo,
consistente en la aplicación de un placebo. Se toman 6 camadas de ratas al
azar, también al azar se seleccionan tres animales de cada una. Se asignan
los tratamientos al azar dentro de cada camada y al cabo de 15 días se mide el
aumento en peso, en decigramos, con los siguientes resultados:


-------------------------------------------------------
 Tratamiento    1      2      3      4      5      6   
------------- ------ ------ ------ ------ ------ ------
   Testigo     3.98   2.75   1.9    3.89   2.82   3.31 

      A        6.61   3.02   2.09   5.62   3.16   6.31 

      B        8.71   4.68   2.82   5.01   3.16   6.61 
-------------------------------------------------------

Table: (#tab:hormona-crecimiento) Aumento de peso (dg) en ratas
                  de 6 camadas bajo el efecto de la hormona de crecimiento
                  en bajo dos concetraciones (A: baja, B: alta) y un control.

a)	Estudiar la aditividad del modelo (validez del modelo).





b)	Poner a prueba la efectividad de la hormona.




c)	Realizar contrastes múltiples, si corresponde.





d) ¿Qué sucede si omitimos el factor bloque? ¿A donde fue a parar toda la 
variabilidad debida a los bloques?




2. Un investigador estudia los efectos de tres dietas experimentales con
variado contenido de grasas sobre el nivel total de lípidos en el plasma. El
nivel total de lípidos en el plasma es utilizado como un indicador de posibles
enfermedades coronarias. Quince hombres de peso corporal (unos Adonis) ideal
fueron agrupados en 5 bloques de acuerdo a la edad. Dentro de cada bloque las
dietas fueron asignadas al azar a los tres sujetos. La tabla presenta los datos
correspondientes a la reducción en el nivel de lípidos (g/l) después de que los
individuos fueron sometidos a la dieta durante un período de tiempo fijo:


-----------------------------------------------------------
 Bloque    Extremadamente.bajo   Bajo   Moderadamente.bajo 
--------- --------------------- ------ --------------------
 15 – 24          0.73           0.67          0.15        

 25 – 34          0.86           0.75          0.21        

 35 – 44          0.94           0.81          0.26        

 45 – 54           1.4           1.32          0.75        

 55 – 64          1.62           1.41          0.78        
-----------------------------------------------------------

Table: (#tab:lipidos) Reducción de lípidos (g/l) bajo tres
       dieta con distinto contenido de grasas.


a) ¿Por qué la edad fue usada como una variable de bloque? 
b) Realice la prueba
de Tukey, ¿cuáles son sus conclusiones? (trabaje con $\alpha$ = 0.05 y 
$\alpha$ = 0.01)



Asumiendo que un diseño en bloques al azar es el adecuado 
c) Obtenga la tabla de ANOVA 



d) Estime $D_1 = \mu_1- \mu_2 $ y $D_2 = \mu_2 - \mu_3 $ , usando un
intervalo de confianza de Bonferroni. ¿Es significativo alguno de los contrastes?



e) En este experimento no fue usada una dieta estándar como control. ¿Que
tipo de justificación puede haber tenido el investigador para no incluir un
tratamiento testigo con fines comparativos?





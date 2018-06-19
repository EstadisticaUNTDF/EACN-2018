# Practico Análisis de Componentes Principales



![Fisher](https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/R._A._Fischer.jpg/200px-R._A._Fischer.jpg)

En 1936, el biólogo y estadístico Ronald Fisher, recopila datos de 150 lirios (*Iris spp.*) para cuantificar la variación geográfica de estas flores en la Penínusula de Gaspé, en Canadá. 

|  ![Iris setosa](https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Kosaciec_szczecinkowaty_Iris_setosa.jpg/180px-Kosaciec_szczecinkowaty_Iris_setosa.jpg) |  ![Iris versicolor](https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Iris_versicolor_3.jpg/220px-Iris_versicolor_3.jpg) |  ![Iris virginica](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Iris_virginica.jpg/220px-Iris_virginica.jpg) |
|---|---|---|
|  *Iris setosa* | *Iris versicolor*  | *Iris virginica*  |

## Problema 1


1. ¿Cuál es el porcentaje de variabilidad explicado por cada componente principal?
2. ¿Cuál es el porcentaje de variabilidad explicado por los dos primeros ejes?
3. ¿Cuál es el porcentaje de variabilidad explicado el primero y tercer eje?
4. ¿Qué matriz de autovectores corresponde a la matriz normalizada (i.e. longitud 1) 
   y que matriz corresponde a los autovectores escalados por $\Lambda^{\frac{-1}{2}}$?
5. ¿Cuál es porcentaje de reconstrucción de cada variable en los dos primeros 
    ejes?
6. Observando el biplot de correlación: ¿Qué variables están más correlacionadas con el eje 1? ¿Qué variables lo están con el eje 2?
7. ¿Es posible concluir sobre los objetos de en el biplot de correlación?
8. Observando el biplot adeacuado: ¿Qué puede concluir sobre las especies? ¿En que caracterísiticas se parecen? ¿Qué especies son más parecidas?





### Matriz S (varianza-covarianza)


                Sepal.Length   Sepal.Width   Petal.Length   Petal.Width
-------------  -------------  ------------  -------------  ------------
Sepal.Length       0.0199344    -0.0022517      0.0700984     0.1111952
Sepal.Width       -0.0022517     0.0204602     -0.0398892    -0.0633270
Petal.Length       0.0700984    -0.0398892      0.3482471     0.5600465
Petal.Width        0.1111952    -0.0633270      0.5600465     0.9662883

### Autovalores $\lambda$:


      PC1         PC2         PC3         PC4
---------  ----------  ----------  ----------
 1.314598   0.0191415   0.0182946   0.0028955


### Autovectores

Matriz 1:


                       PC1          PC2          PC3          PC4
-------------  -----------  -----------  -----------  -----------
Sepal.Length     0.1009002   -0.0008537   -0.4891583    0.8663386
Sepal.Width     -0.0575930    0.5745111   -0.7140592   -0.3959034
Petal.Length     0.5052703   -0.6870939   -0.4269180   -0.3005742
Petal.Width      0.8551047    0.4447901    0.2618865    0.0487148

Matriz 2:


                       PC1          PC2          PC3          PC4
-------------  -----------  -----------  -----------  -----------
Sepal.Length     0.1156881   -0.0001181   -0.0661623    0.0466172
Sepal.Width     -0.0660338    0.0794851   -0.0965818   -0.0213033
Petal.Length     0.5793224   -0.0950613   -0.0577439   -0.0161737
Petal.Width      0.9804284    0.0615379    0.0354221    0.0026213

![](PCA_files/figure-epub3/unnamed-chunk-4-1.png)<!-- -->

![](PCA_files/figure-epub3/unnamed-chunk-5-1.png)<!-- -->




## Problema 2


Los mismos datos pero trabajando con la matriz de correlación:

1. La matriz $U$ y $U\Lambda^{\frac{-1}{2}}$ ¿serán igual o no? ¿Por qué?
2. ¿Que porcentaje de la varianza explica cada eje principal?
3. ¿Que porcentaje de reconstrucción tiene cada una de las variables en los
dos primeros ejes?
4. Contruyan el biplot de correlación graficando solo las variables. 
5. ¿Qué puede concluir sobre las especies? ¿En que caracterísiticas se parecen?
¿Qué especies son más parecidas?
6. Comparando los resultados con el problema anterior, ¿en que se parecen
o diferencian los gráficos?


### Matriz R


                Sepal.Length   Sepal.Width   Petal.Length   Petal.Width
-------------  -------------  ------------  -------------  ------------
Sepal.Length       1.0000000    -0.1114962      0.8413242     0.8011826
Sepal.Width       -0.1114962     1.0000000     -0.4725598    -0.4503814
Petal.Length       0.8413242    -0.4725598      1.0000000     0.9654437
Petal.Width        0.8011826    -0.4503814      0.9654437     1.0000000

### Autovalores $\lambda$:


      PC1         PC2         PC3         PC4
---------  ----------  ----------  ----------
 2.932514   0.9070271   0.1330082   0.0274512

### Autovectores

Matriz normalizada $U$


                       PC1          PC2          PC3          PC4
-------------  -----------  -----------  -----------  -----------
Sepal.Length     0.5038236   -0.4549987    0.7088547    0.1914757
Sepal.Width     -0.3023682   -0.8891442   -0.3311628   -0.0912541
Petal.Length     0.5767881   -0.0337880   -0.2192793   -0.7861873
Petal.Width      0.5674952   -0.0354563   -0.5829003    0.5804474

Matriz escalada $U\Lambda^{\frac{-1}{2}}$ 


                       PC1          PC2          PC3          PC4
-------------  -----------  -----------  -----------  -----------
Sepal.Length     0.8627769   -0.4333315    0.2585214    0.0317245
Sepal.Width     -0.5177929   -0.8468029   -0.1207761   -0.0151193
Petal.Length     0.9877255   -0.0321790   -0.0799718   -0.1302587
Petal.Width      0.9718119   -0.0337678   -0.2125855    0.0961709


![](PCA_files/figure-epub3/unnamed-chunk-9-1.png)<!-- -->


![](PCA_files/figure-epub3/unnamed-chunk-10-1.png)<!-- -->

## Problema 3


Se midieron 13 variables de 3 tipos de vinos y se realizó un análisis de 
componentes principales. Responda:

1. ¿Cuántos ejes se pueden construir?
2. ¿Cuanta variación explica cada eje?
3. ¿Qué variables están correlacionadas positivamente? ¿Cuales lo están
negativamente? ¿Y cuales están incorreladas?
4. ¿Sirve este gráfico para ver las relaciones entre los vinos? ¿Por qué?
5. El análisis se realizó con la matriz de correlación. ¿Por qué creo que se hizo
de esta manera?
6. Calcule el porcentaje de reconstrucción de las variables en los primeros dos
ejes
7. ¿Cuál es la longitud esperada de cada variable en el espacio reducido?


---------------------------------------------------------------------------
  PC1     PC2     PC3     PC4     PC5      PC6      PC7     PC8      PC9   
------- ------- ------- ------- -------- -------- ------- -------- --------
 4.706   2.497   1.446   0.919   0.8532   0.6417   0.551   0.3485   0.2889 
---------------------------------------------------------------------------

Table: Table continues below

 
-----------------------------------
  PC10     PC11     PC12     PC13  
-------- -------- -------- --------
 0.2509   0.2258   0.1688   0.1034 
-----------------------------------

![](PCA_files/figure-epub3/unnamed-chunk-11-1.png)<!-- -->

### Matriz $U\Lambda^{\frac{-1}{2}}$




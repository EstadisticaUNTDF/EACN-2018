# Problemas ANOVA Dos Factores






## Formulas con más de una variable independiente

Para indicar que la variable $Y$ depende de la variable $X$ usabamos el tilde
para construir una fórmula en *R*, e.g. `Y ~ X`. Cuando tenemos más de una
variable no podemos construir un modelo por cada variable (¿Por qué?), entonces
hay que construir una fórmula que muestre que hay más variables. Para eso se
usa el símbolo `+`. Por ejemplo, además de la variable $X$ tenemos también la
variable $Z$:

```
Y ~ X + Z
```

Este modelo equivale a decir que la variable $Y$ depende de $X$ y $Z$ asumiendo
que no hay interacción entre estas últimas. La interacción se indica con dos 
puntos `:`. Por ejemplo:  

```
Y ~ X + Z + X:Z
```

Un atajo, para escribir menos es usar la múltiplicación. Que en las formulas
en verdad no es una multiplicación sino que se expande para dar como resultado
los efectos principales más la interacción entre ellos. Por ejemplo, 
`Y ~ X * Z`, es equivalente al ejemplo anterior. Esto es ventajoso para cuando
hay más de dos variables:

```
Y ~ X * Z * W
Y ~ X + Z + W + X:Z + X:W + Z:W + X:Z:W
```
### Test de aditividad de Tukey {#aditividadtukey}

Para probar que $H_0: D=0$ se debe realizar el [test de aditividad de Tukey][Prueba de Tukey (Aditividad)]. 
En *R* está implementado como una función del paquete `additivityTests`. 
Especificamente en la función `tukey.test`. Tiene dos argumentos, `data`, los
datos y el nivel de `alpha`. Hay que tener especial cuidado en los datos, ya
que debe ser una matriz. Una matriz como un *data frame* en el sentido que 
tiene filas y columnas. Pero a diferencia de este donde las columnas pueden
tener distintos tipos de datos, en la matriz todos los datos tienen que ser
del mismo tipo. 

Por ejemplo:


```r
matrix(1:10, nrow = 2)
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    3    5    7    9
## [2,]    2    4    6    8   10
```


Esto implica que los datos que queramos comprobar deben estar en formato
ancho y sin las columnas que identifican los tratamientos. Por la tanto
si los datos están en formato largo: 1- deben ser puestos en formato ancho,
2- eliminar las columnas que no continen la variable de respuesta, 3 - covertir
a matriz, 4- realizar la prueba de aditividad de Tukey. Vean el ejercicio 4 
para un ejemplo de como se aplica.



## Problemas


<div class="atencion">
<p>Antes de comenzar bajen el archivo donde realizarán su informe reproducible. En la consola copien este código:</p>
</div>

`download.file("http://bit.ly/informe-anova-dos-factores", "informe-anova-dos-factores.Rmd")`

<div class="atencion">
<p>Pueden abrirlo desde la pestaña de archivos, a la derecha. Cambien el nombre por el suyo en el encabezado y mientras leen este capítulo respondan las preguntas.</p>
<p>En todos los casos recuerden hacer gráficos, comprobar supuestos e indicar que tipo de diseño es.</p>
</div>

1.- Los Dres. V Vampirus y José Dracul deciden llevar a cabo una experiencia
para determinar el tiempo de sangrado de ciertos animales (*Horno sapiens*),
cuando se les produce una mordedura. Aplican un método que supuestamente lo
alarga y lo comparan con un control (método tradicional). Como les surgen dudas
respecto a la hora en que se realiza el sangrado experimentan a la medianoche y
a la madrugada. Los datos corresponden al tiempo de sangrado, en minutos.

	  

-----------------------------------------------------------------------
     medianoche           madrugada         medianoche     madrugada   
-------------------- -------------------- -------------- --------------
 método tradicional   método tradicional   método nuevo   método nuevo 

        8.53                17.53             39.14            32      

       20.53                21.07              26.2           23.8     

       12.53                 20.8             31.33          28.87     

         14                 17.33              45.8          25.06     

        10.8                20.07              40.2          29.33     
-----------------------------------------------------------------------

Table: (#tab:sangrado) Minutos de sangrado en *Horno sapiens* bajo
       el método tradicional y un nuevo método a la medianoche y a la 
       madrugada.

a)  ¿En qué formato están los datos? ¿Largo, ancho o intermedio?
a)	Comprobar las suposiciones del ANOVA
b)	Realizar el ANOVA
c)	Si Ud. fuera uno de los mencionados galenos, ¿Cuándo y cómo realizaría el sangrado?










2.- La siguiente tabla muestra la ganancia en peso de ratas macho sometidas a
seis dietas diferentes:


--------------------------------------------------------------------------------
     Fuente       Alta.proteina   Alta.proteina   Baja.proteina   Baja.proteina 
---------------- --------------- --------------- --------------- ---------------
 Carne de vaca         107             79              90              51       

 Carne de vaca         102             100             76              72       

 Carne de vaca         118             87              90              90       

 Carne de vaca         104             117             64              95       

 Carne de vaca         81              111             86              78       

     Cereal            98              88              107             74       

     Cereal            74              82              95              74       

     Cereal            56              77              97              67       

     Cereal            95              92              98              58       

     Cereal            111             86              80              89       

 Carne de cerdo        94              102             49              97       

 Carne de cerdo        79              108             82              106      

 Carne de cerdo        96              91              73              70       

 Carne de cerdo        98              120             86              61       

 Carne de cerdo        102             105             81              82       
--------------------------------------------------------------------------------

Table: (#tab:peso-rata) Datos de ganancia de peso (en g.)
       en ratas macho sometidas a seis dietas diferentes

a)	¿Hay diferencia entre los valores de proteína?
b)	¿Hay diferencia entre las fuentes animal y vegetal?
c)	La diferencia entre las fuentes animal y vegetal ¿varia con el nivel de proteína?
d)	¿Hay diferencia entre la carne vacuna y la de cerdo?
e)	La diferencia entre la carne vacuna y la de cerdo ¿varía con el nivel de proteína?

**Pista**: Piensen en los contrastes que son necesarios hacer.














3.- Se desean comparar tres genotipos distintos de *Drosophila melanogaster*
observando si existen diferencias de viabilidad sembrando 100 y 800 huevos. De
este modo para cada uno de los tratamientos se dispusieron 6 preparados y al
cabo de un tiempo suficiente de ser sembrados los huevos se obtuvo el porcentaje
de huevos que hablan eclosionado. Los resultados fueron:
	

---------------------------------------------------------------------------------
 Huevos.Sembrados    PP     PP     PP     PN     PN     PN     NN     NN     NN  
------------------ ------ ------ ------ ------ ------ ------ ------ ------ ------
       100           93     94     93    95.5   83.5    92     92     91     90  

       100           90     93     86    92.5    82    82.5    95     84     78  

       800          83.3   80.1   79.6    84    84.4    77    85.3   89.4   85.4 

       800          87.6   81.9   49.4    67    69.1   88.4   87.4    52     77  
---------------------------------------------------------------------------------

Table: (#tab:huevos) Viabilidad en porcentaje de huevos sembrados
       para tres genotipos (PP, NN, PN) sembrando distintas cantidades de
       huevos


a)  ¿Son diferentes los tres genotipos en cuanto a viabilidad?
b)  ¿Es distinta la viabilidad sembrando 100 u 800 huevos?
c)  ¿Existe interacción entre genotipo y número de huevos?
d)  ¿Es necesario transformar los datos? ¿Por qué? Si su respuesta es
afirmativa vuelva a realizar los análisis, comprobar supuestos y revise sus
conclusiones.















4.- Se sembró *Lactobacíllus fermentus* en una mezcla de agar y un medio de
cultivo sin tiamina se llenaron 18 tubos de ensayo con una cantidad fija de
la mezcla. A grupos de tres, elegidos al azar, se les agregó un sobrenadante
que contenía una dosis fija de tres preparaciones de tiamina. Después de una
incubación por 18 horas se midió el crecimiento de L. fermentus en términos
del largo de la columna de nebulosidad que se desarrolla por debajo del
sobrenadante:
	

-----------------------------------------------
 Concentracion_de_tiamina    A      B      C   
-------------------------- ------ ------ ------
          0.0125            5.5    6.4    5.2  

           0.05             6.9    7.3    6.9  

           0.2              10.1    10    10.2 

           0.8              12.3   12.5   12.7 

           3.2              18.3   18.5   15.9 

           12.8             17.3   19.5   21.6 
-----------------------------------------------

Table: (#tab:yogur) Nebulosidad (1/Transmitancia) de cultivos
       de *Lactobacíllus fermentus* bajo varias concentraciones de tiamina.

a) ¿Qué tipo de diseño es?
b)	A un nivel del 1% y del 5% docimar la hipótesis de no significación entre 
las preparaciones y entre las dosis. Interpretar los resultados.
c)	Hacer un estudio de perfiles.





5.- La siguiente tabla ilustra el engorde semanal de cerdos clasificados por
sexo, con tres tipos de alimentación A, B y C.


-----------------------------
 &nbsp;    A      B      C   
-------- ------ ------ ------
 Macho    9.52    10    9.75 

 Hembra   9.94   8.51   9.11 
-----------------------------

Table: (#tab:cerdos) 
       Engorde semanal en kilos en cerdos de ambos sexos, con tres tipos 
       de alimentación A, B y C

a)	Hacer un estudio de perfiles
b)	Comprobar los supuestos del modelo
c)	Estudiar si existe variabilidad entre sexos y entre tipos de alimentación
	





6.- Se eligen al azar seis laboratorios para analizar la concentración de
humedad en cuatro tipos de levadura: de panadería (I), liviana de cerveza (II),
pesada de cerveza (III) y Torula (IV). A cada uno de los laboratorios se les
entregan recipientes con uno de los cuatro tipos de levadura, pero sin indicar
cual. La concentración de humedad se analiza por secado de horno al vacío.
Los datos que se dan a continuación corresponden al contenido de humedad (en
términos de % de humedad - 6.00) de 4 alícuotas de 2 gramos cada una.


--------------------------------------------------------------
    Laboratorio        A      B      C      D      E      F   
-------------------- ------ ------ ------ ------ ------ ------
    de panadería      0.81   0.69   0.74   0.6    0.41   0.74 

    de panadería      0.73   0.82   0.77   0.57   0.52   0.77 

    de panadería      0.19   0.78   0.7    0.65   0.59   0.79 

    de panadería      0.82   0.67   0.67   0.57   0.59   0.81 

 pesada de cerveza    0.86   0.98   0.8    0.63   0.55   0.56 

 pesada de cerveza    0.87   0.84   0.78   0.66   0.62   0.63 

 pesada de cerveza    0.92   0.76   0.58   0.58   0.83   0.67 

 pesada de cerveza    0.99   0.78   0.72   0.49   0.87   0.73 

 liviana de cerveza   0.65   0.62   0.48   0.5    0.15   0.43 

 liviana de cerveza   0.68   0.68   0.48   0.34   0.23   0.46 

 liviana de cerveza   0.65   0.56   0.33   0.47   0.56   0.52 

 liviana de cerveza   0.73   0.44   0.34   0.43   0.53   0.51 

       Torula         2.25   2.15   2.16   2.16   1.88   2.06 

       Torula         2.23   2.13   2.21   1.9    1.88   1.12 

       Torula         2.2    1.87   2.03   1.86   2.04   2.1  

       Torula         2.16   1.87   2.1    1.84   2.06   2.15 
--------------------------------------------------------------

Table: (#tab:levadura) Humedad (en porcentaje) de cuatro
       tipos de levadura (de panadería (I), liviana de cerveza (II),
pesada de cerveza (III) y Torula (IV)) analizada por seis laboratorios 
diferentes.


a) ¿Qué tipo de diseño es? Tipo I, II o III.
b) Analice si se cumplen los supuestos.
c) ¿Hay diferencias entre los tipos de levadura? ¿Entre cuales?





7.- Eligiendo 4 tardes al azar del verano, se midió la temperatura de un lago a
diferentes profundidades, con los siguientes resultados


-----------------------------------------
 profundidad    1      2      3      4   
------------- ------ ------ ------ ------
      0        23.8    24    24.6   24.8 

      1        22.6   22.4   22.9   23.2 

      2        22.2   22.1   22.1   22.2 

      3        21.2   21.8    21    21.2 

      4        18.4   19.3    19    18.8 

      5        13.5   14.4   14.2   13.8 
-----------------------------------------

Table: (#tab:lago) Temperatura de un lago (°C) en cuatro tardes
       elegidas al azar durante el verano en distintas profundidades (m).


¿Que tipo de diseño se utilizó? 
Examinar si hay diferencias entre profundidades y entre fechas





 
No se puede hacer un test formal de normalidad para cada grupo debido al bajo número de replicas.








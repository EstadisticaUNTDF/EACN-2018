# Manejo de datos


<div class="atencion">
<p>Antes de comenzar bajen el archivo donde realizarán su informe reproducible. En la consola copien este código:</p>
</div>

`download.file(url = "git.io/informe-manejo", destfile = "informe-manejo-de-datos.Rmd")`

<div class="atencion">
<p>Pueden abrirlo desde la pestaña de archivos, a la derecha. Cambien el nombre por el suyo en el encabezado y mientras leen este capítulo respondan las preguntas.</p>
</div>



Una parte muy importante del análisis de datos, es el manejo de ellos. Como
seleccionar columnas, filtrar datos, y realizar operaciones sobre ellos. Vamos
a usar el paquete `dplyr` y `tidyr` para el manejo. Los paquetes 
extienden la funcionalidad de *R* agregando nuevas funciones.


```r
library("dplyr")

nombres <- readRDS("data/nombres-1980-1999.RDS")
```

Revisemos el código. Con `library("dplyr")` cargamos el paquete dplyr. Luego,
leemos el archivo que contiene los datos y le asignamos el nombre `nombres`.
Si no le asignasemos ningún nombre, se leerían los datos, imprimiendose en la
consola y luego se borrarían de la memoría. 

Para revisar su contenido podemos escribir el nombre del objeto o usar la 
función `glimpse`


```r
glimpse(nombres)
```

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:ejercicio-4"><strong>(\#exr:ejercicio-4) </strong></span>Escriban el nombre del objeto o usen la función `glimpse` para ver que tiene
dentro el objeto `nombres`.

1. ¿Cuantas columnas tiene y como se llaman?
2. ¿Que tipo de dato tiene cada columna?
  
  
  </div>\EndKnitrBlock{exercise}

En *R* existen diversos tipos de dato, en estos datos solo hay 2: entero 
(`integer`) y carácter (`character`). El primero son números enteros y el 
segundo es texto. Con el primero se puede hacer operaciones matemáticas y con
el segundo otro tipo de operaciones, pero no matemáticas. Es importante 
comprobar que los tipos de datos se correspondan con lo que esperamos. Si no
los resultados pueden no ser los correctos o dar errores. Por ejemplo, el
tipo de dato númerico puede ser leído como `chr` y no podremos calcular la 
media.

## Seleccionando datos

Muchas veces solo nos interesa un subconjunto de datos. Una forma de seleccionar
datos es usando la función `filter()`. 


```r
nombres %>% 
  filter(nombre == "Luciano") %>% 
  filter(anio == 1984)
```

Acá empezamos a ver varias cosas nuevas. Primero tenemos el símbolo `%>%` 
conocido en inglés como *pipe*, la traducción más correcta al español es 
tubo. Lo que hace este símbolo es enviar la salida de la operación a la 
izquierda a la función de la derecha. Prueben poner cada comando en orden
y ver cual es la salida. Esto es:


```r
nombres
```

Luego,


```r
nombres %>% 
  filter(nombre == "Luciano")
```

La función `filter()` filtra un conjunto de datos según los valores de la
columna/s que seleccionemos cuyos valores sean igual a `Luciano` en este caso. Y
luego filtramos la columna `anio` solo los años que sean iguales a 1984.


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:ejercicio-5"><strong>(\#exr:ejercicio-5) </strong></span>Prueben cambiar el nombre por el suyo y el año por su año de nacimiento. </div>\EndKnitrBlock{exercise}




El operador que usamos para la igualdad es `==`. Este operador, de igualdad,
es parte de la familia de operadores lógicos, o booleanos en terminología
de ciencias de la información. Son lógicos porque van a comparar valores y
dar como resultado **verdadero** (`TRUE`) o **falso** (`FALSE`). En la Tabla
\@ref(tab:tabla-logicos) podemos ver la lista de operadores lógicos.


Table: (\#tab:tabla-logicos)Operadores Lógicos en R.

Operador    Descripción                 
----------  ----------------------------
<           menor que                   
<=          menor o igual que           
>           mayor que                   
>=          mayor o igual que           
==          exactamente igual a         
!=          no igual a                  
!x          no x                        
x | y       x *O* y                     
x & y       x *E* y                     
isTRUE(x)   comprueba si x es verdadero 

Los primeros cinco son bastante sencillos y los han estado usando desde la 
primaria. Así que vamos a explicar en más profundidad los otros. El símbolo `!=`
va a devolver `TRUE` cuando los valores sean diferentes al que pusimos. Por 
ejemplo:


```r
# x una secuencia de 1 a 10
x <- 1:10
# Todos los valores distintos a 5
x != 5
```

```
##  [1]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
```


\BeginKnitrBlock{exercise}\iffalse{-91-78-111-109-98-114-101-115-32-99-111-109-117-110-101-115-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:nombre-comun"><strong>(\#exr:nombre-comun)  \iffalse (Nombres comunes) \fi{} </strong></span>¿Cómo filtrarían los nombres raros excluyéndolos del conjunto de datos? 
  
  Guarden el resultado como nombres_comunes y calculen el total por nombre.

Nota: Por coherencia, definamos nombres raros como los que son menos de 100.</div>\EndKnitrBlock{exercise}





Otro operador muy útil es el de negación `!` que invierte las comparaciones,
convierte los falsos en verdaderos y los verdaderos en falsos. Siguiendo nuestro
ejemplo:


```r
!x != 5
```

```
##  [1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
```

Es un ejemplo trivial, que podría haber sido resuelto más sencillamente usando
`==`. Pero es muy útil cuando queremos seleccionar todos los datos que no cumplan
un conjuto de condiciones. Lo que nos lleva al operador `|` (*O*) y el operador
`&` (*Y*). El primero va a devolver verdadero cuando *al menos uno* de los
valores sea verdadero. Por ejemplo:


```r
TRUE | TRUE
```

```
## [1] TRUE
```

```r
TRUE | FALSE
```

```
## [1] TRUE
```

```r
FALSE | TRUE
```

```
## [1] TRUE
```

```r
FALSE | FALSE
```

```
## [1] FALSE
```

Por otro lado, el operador lógico *Y* `&` solo devuelve verdadero cuando *ambos
valores* son verdaderos.


```r
TRUE & TRUE
```

```
## [1] TRUE
```

```r
TRUE & FALSE
```

```
## [1] FALSE
```

```r
FALSE & TRUE
```

```
## [1] FALSE
```

```r
FALSE & FALSE
```

```
## [1] FALSE
```

Los operadores se evalúan en el orden que aparecen a menos que haya paréntesis,
entonces se evalúa primero dentro del paréntesis y luego fuera.


\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:ejercicio-6"><strong>(\#exr:ejercicio-6) </strong></span>¿Qué resultado darán las siguientes evaluaciones? Piensen que resultado tendría
que dar y luego comprueben lo que piensan con lo que les devuelve R.

  1. TRUE | FALSE | TRUE
  2. TRUE | FALSE & TRUE
  3. TRUE | (FALSE & TRUE)
  4. TRUE != FALSE & TRUE
  5. !(TRUE | FALSE) & TRUE
  
  
  </div>\EndKnitrBlock{exercise}

Estos dos últimos operadores son muy importantes porque nos permiten comprobar
distintas condiciones. Por ejemplo, no hay un operador para seleccionar todos
los valores entre *a* y *b* (siendo *a* y *b* dos números cualesquiera). Podemos
hacerlo combinando por un lado, x > a y x < b ¿Y cómo debemos combinar estas 
dos comparaciones? ¿Usando el operador `&` o el `|`? Queremos los valores que
cumplen con ambas condiciones, que sean mayores que a y menores que b, por lo 
tanto debemos usar el operador `&`.


```r
# Si a = 3 y b = 6
( x > 3 ) & ( x < 6)
```

```
##  [1] FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
```

Estos valores corresponden a la posición de los valores que cumplen o no con la 
condición. Usando corchetes `[]` podemos seleccionar solo los verdaderos


```r
x[( x > 3 ) & ( x < 6)]
```

```
## [1] 4 5
```

La función `filter()` hace algo similar para conjuntos de datos (`data.frames` o
`tibbles`).

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:ejercicio-7"><strong>(\#exr:ejercicio-7) </strong></span>Anteriormente usamos dos operaciones de `filter()` para seleccionar el nombre y
el año. Pero es posible usar solo una con los operadores lógicos que vimos. 
Intenten hacerlo.</div>\EndKnitrBlock{exercise}

Finalmente está `isTRUE()` que devuelve `TRUE` cuando el objeto es `TRUE`
lo que suena bastante obvio. Pero es parte de una familia que permite comprobar
si un objeto es del tipo esperado. Por ejempo: `is.numeric()` comprueba que el 
objeto es un vector con algún tipo de número. 

Otra forma de seleccionar datos es por posición. Es decir, seleccionar los 
primeras diez filas:


```r
nombres_comunes %>% 
  slice(1:10)
```

```
## # A tibble: 10 x 3
##    nombre          anio cantidad
##    <chr>          <int>    <int>
##  1 Aaron           2012      152
##  2 Aaron           2013      167
##  3 Aaron           2014      200
##  4 Aaron Benjamin  2012      108
##  5 Aaron Benjamin  2013      120
##  6 Aaron Benjamin  2014      125
##  7 Abel            1982      102
##  8 Abel            1989      103
##  9 Abel            1990      102
## 10 Abigail         1991      132
```

O seleccionar las primeras 10 filas que corresponden números primos:


```r
nombres_comunes %>% 
  slice(c(2, 3, 5, 7, 11, 13, 17, 19, 23, 29))
```

```
## # A tibble: 10 x 3
##    nombre          anio cantidad
##    <chr>          <int>    <int>
##  1 Aaron           2013      167
##  2 Aaron           2014      200
##  3 Aaron Benjamin  2013      120
##  4 Abel            1982      102
##  5 Abigail         1992      120
##  6 Abigail         1994      198
##  7 Abigail         1998      210
##  8 Abigail         2010      171
##  9 Abigail         2014      278
## 10 Abril           1999      813
```

También es posible eliminar las filas según posición:


```r
nombres_comunes %>% 
  slice(-(1:10)) #Tengan en cuenta los parentesis extra
```

```
## # A tibble: 33,665 x 3
##    nombre   anio cantidad
##    <chr>   <int>    <int>
##  1 Abigail  1992      120
##  2 Abigail  1993      165
##  3 Abigail  1994      198
##  4 Abigail  1995      182
##  5 Abigail  1996      159
##  6 Abigail  1997      167
##  7 Abigail  1998      210
##  8 Abigail  1999      174
##  9 Abigail  2010      171
## 10 Abigail  2011      152
## # ... with 33,655 more rows
```

\BeginKnitrBlock{exercise}<div class="exercise"><span class="exercise" id="exr:ejercicio-9"><strong>(\#exr:ejercicio-9) </strong></span>
1. ¿Qué sucede si olvidan los paréntesis en el código de arriba?
2. Seleccionen las últimas 10 filas.
  
  

</div>\EndKnitrBlock{exercise}

## Seleccionando columnas

La función para seleccionar columnas es `seletc()`. Hay muchas formas de 
seleccionar columnas. La más obvia es por nombre de la columna:


```r
nombres_comunes %>% 
  select(nombre, cantidad)
```

```
## # A tibble: 33,675 x 2
##    nombre         cantidad
##    <chr>             <int>
##  1 Aaron               152
##  2 Aaron               167
##  3 Aaron               200
##  4 Aaron Benjamin      108
##  5 Aaron Benjamin      120
##  6 Aaron Benjamin      125
##  7 Abel                102
##  8 Abel                103
##  9 Abel                102
## 10 Abigail             132
## # ... with 33,665 more rows
```

También es posible seleccionar varias columnas usando secuencias:


```r
nombres_comunes %>% 
  select(nombre:cantidad)
```

```
## # A tibble: 33,675 x 3
##    nombre          anio cantidad
##    <chr>          <int>    <int>
##  1 Aaron           2012      152
##  2 Aaron           2013      167
##  3 Aaron           2014      200
##  4 Aaron Benjamin  2012      108
##  5 Aaron Benjamin  2013      120
##  6 Aaron Benjamin  2014      125
##  7 Abel            1982      102
##  8 Abel            1989      103
##  9 Abel            1990      102
## 10 Abigail         1991      132
## # ... with 33,665 more rows
```

De la misma forma se puede eliminar columnas usando el signo `-`.


```r
 nombres_comunes %>% 
  select(-anio)
```

```
## # A tibble: 33,675 x 2
##    nombre         cantidad
##    <chr>             <int>
##  1 Aaron               152
##  2 Aaron               167
##  3 Aaron               200
##  4 Aaron Benjamin      108
##  5 Aaron Benjamin      120
##  6 Aaron Benjamin      125
##  7 Abel                102
##  8 Abel                103
##  9 Abel                102
## 10 Abigail             132
## # ... with 33,665 more rows
```

Se pueden renombrar columnas 


```r
nombres_comunes %>% 
  select(año = anio)
```

```
## # A tibble: 33,675 x 1
##      año
##    <int>
##  1  2012
##  2  2013
##  3  2014
##  4  2012
##  5  2013
##  6  2014
##  7  1982
##  8  1989
##  9  1990
## 10  1991
## # ... with 33,665 more rows
```

Pero se eliminan las no seleccionadas. Se puede renombrar sin tener que 
seleccionar el resto usando la función `rename`


```r
nombres_comunes %>% 
  select(año = anio)
```

```
## # A tibble: 33,675 x 1
##      año
##    <int>
##  1  2012
##  2  2013
##  3  2014
##  4  2012
##  5  2013
##  6  2014
##  7  1982
##  8  1989
##  9  1990
## 10  1991
## # ... with 33,665 more rows
```

Hay muchas más formas de seleccionar columnas, pueden referirse a la 
ayuda `?select`, `?select_at` y también a este excelente [tutorial][https://suzan.rbind.io/2018/01/dplyr-tutorial-1/] (en inglés).
  
## Agregando columnas

Otra operación muy común es agregar nuevas columnas o variables. Por ejemplo
al transformar los datos es siempre **mala idea** sobreescribir los datos 
originales.

Para esta operación sirve la función `mutate()`. Dado un *data frame* computa
una valor para cada fila. Por ejemplo:


```r
nombres %>% 
  mutate(log_cantidad = log10(cantidad))
```

```
## # A tibble: 3,749,133 x 4
##    nombre         anio cantidad log_cantidad
##    <chr>         <int>    <int>        <dbl>
##  1 A Aron Misael  2012        2        0.301
##  2 A Mi           1984        1        0.   
##  3 A N A          2012        1        0.   
##  4 A Reum         1983        5        0.699
##  5 A Reum         1987        7        0.845
##  6 A Sang         1994        4        0.602
##  7 Aaaraon        2013        1        0.   
##  8 Aadil          1992        1        0.   
##  9 Aage Andres    1990        1        0.   
## 10 Aage Carlos    1985        1        0.   
## # ... with 3,749,123 more rows
```

Cualquier operación que funcione con vectores funciona con `mutate()`. También
funciona se pueden modificar columnas si el nombre que asignamos ya está usado
dentro de nuestro *data frame*.


## Operaciones por grupos

Muchas veces van a necesitar calcular por grupos: la suma, media, varianza, etc.
Por ejemplo, calcular el número total de personas con cada nombre. Podrían 
hacerlo de esta forma:


```r
nombres_comunes %>% 
  filter(nombre == "Luciano") %>% 
  summarise(total = sum(cantidad))
```

```
## # A tibble: 1 x 1
##   total
##   <int>
## 1 13244
```

Y repetirlo cambiando el nombre para cada uno de los nombres. Por su puesto,
esta forma de hacer las cosas es muy incómoda y propensa a errores. Hay una
forma más fácil y es usando `group_by()`. Un ejemplo:


```r
# No intenten hacerlo en sus computadoras
# Los datos tienen más de 3 millones de registros y va a tomar un tiempo
nombres_comunes %>% 
  group_by(nombre) %>% 
  summarise(total = sum(cantidad))
```

```
## # A tibble: 4,272 x 2
##    nombre           total
##    <chr>            <int>
##  1 Aaron              519
##  2 Aaron Benjamin     353
##  3 Abel               307
##  4 Abigail           2656
##  5 Abril             4163
##  6 Adolfo             688
##  7 Adrian            4186
##  8 Adrian Alberto    2009
##  9 Adrian Alejandro  3460
## 10 Adrian Eduardo     106
## # ... with 4,262 more rows
```

Como pueden ver estos datos distan bastante de estar limpios ya que hay 
muchos errores de entrada de datos, como nombres todo en mayúsculas, versiones
del mismo nombre con tilde y sin tilde, etc. Para evitar todo ese "ruido", 
podríamos filtrar los nombres raros que son mayoría de las entradas.


Además de usar la función `summarise()` se puede usar la función `mutate` que
va a hacer que queden la misma cantidad de casos. Por ejemplo, calcular el 
número acumulado de personas con el mismo nombre en a través de los años:


```r
nombres_comunes %>% 
  group_by(nombre) %>% 
  arrange(anio, .by_group = TRUE) %>% 
  mutate(acumulado = cumsum(cantidad))
```

```
## # A tibble: 33,675 x 4
## # Groups:   nombre [4,272]
##    nombre          anio cantidad acumulado
##    <chr>          <int>    <int>     <int>
##  1 Aaron           2012      152       152
##  2 Aaron           2013      167       319
##  3 Aaron           2014      200       519
##  4 Aaron Benjamin  2012      108       108
##  5 Aaron Benjamin  2013      120       228
##  6 Aaron Benjamin  2014      125       353
##  7 Abel            1982      102       102
##  8 Abel            1989      103       205
##  9 Abel            1990      102       307
## 10 Abigail         1991      132       132
## # ... with 33,665 more rows
```

Acá hay una función nueva, `arrange()`. Lo que hace. Esta función ordena de manera
creciente (0-9, a-z) un conjunto de datos. Por ejemplo:


```r
nombres_comunes %>% 
  arrange(cantidad)
```

```
## # A tibble: 33,675 x 3
##    nombre              anio cantidad
##    <chr>              <int>    <int>
##  1 Adolfo              1981      101
##  2 Adrian Alberto      1990      101
##  3 Adrian Maximiliano  1988      101
##  4 Agustin Adrian      1998      101
##  5 Agustina Alejandra  1997      101
##  6 Ailin               1993      101
##  7 Alan Benjamin       2014      101
##  8 Alan Gabriel        1989      101
##  9 Alan Matias         1989      101
## 10 Alberto Martin      1987      101
## # ... with 33,665 more rows
```

Si queremos que sea decreciente (9-0, z-a), hay que agregar la función `desc()`.
Por ejemplo:


```r
nombres_comunes %>% 
  arrange(desc(cantidad))
```

```
## # A tibble: 33,675 x 3
##    nombre       anio cantidad
##    <chr>       <int>    <int>
##  1 Maria Belen  1993     6946
##  2 Maria Belen  1992     6249
##  3 Maria Belen  1994     6098
##  4 Juan Pablo   1982     5561
##  5 Maria Belen  1991     5307
##  6 Maria Laura  1980     5144
##  7 Maria Belen  1995     5094
##  8 Benjamin     2013     4964
##  9 Maria Laura  1981     4747
## 10 Benjamin     2012     4726
## # ... with 33,665 more rows
```

También se pueden poner varios criterios para que ordene según ellos. Por 
ejemplo, por cantidad y luego por orden alfabético. 


```r
nombres_comunes %>% 
  arrange(cantidad, nombre)
```

```
## # A tibble: 33,675 x 3
##    nombre              anio cantidad
##    <chr>              <int>    <int>
##  1 Adolfo              1981      101
##  2 Adrian Alberto      1990      101
##  3 Adrian Maximiliano  1988      101
##  4 Agustin Adrian      1998      101
##  5 Agustina Alejandra  1997      101
##  6 Ailin               1993      101
##  7 Alan Benjamin       2014      101
##  8 Alan Gabriel        1989      101
##  9 Alan Matias         1989      101
## 10 Alberto Martin      1987      101
## # ... with 33,665 more rows
```

\BeginKnitrBlock{exercise}\iffalse{-91-79-114-100-101-110-32-100-101-32-116-111-116-97-108-101-115-93-}\fi{}<div class="exercise"><span class="exercise" id="exr:ejercicio-10"><strong>(\#exr:ejercicio-10)  \iffalse (Orden de totales) \fi{} </strong></span>Ordenen el resultado del total de nombres que calcularon en el ejercicio 
\@ref(exr:nombre-comun)</div>\EndKnitrBlock{exercise}

## Formato Ancho y Formato Largo

Los datos en general vienen en uno de dos formatos:

* Formato Ancho: cada fila se corresponde a varias observaciones, parte de la
información está en el nombre de las columnas.
* Formato Largo: cada fila corresponde a una única observación.



-------------------------------------------------
 Name    50    100   150   200   250   300   350 
------- ----- ----- ----- ----- ----- ----- -----
 Carla   1.2   1.8   2.2   2.3    3    2.5   1.8 

 Mace    1.5   1.1   1.9    2    3.6    3    2.5 

  Lea    1.7   1.6   2.3   2.7   2.6   2.2   2.6 

 Karen   1.3   1.7   1.9   2.2   3.2   1.5   1.9 
-------------------------------------------------

Table: (#tab:ancho) Ejemplo de formato ancho. Cada fila corresponde a un
       individuo denotado por el nombre y cada columna corresponde al puntaje
       obtenido en una prueba bajo distintos tiempos. 

La tabla anterior es un ejemplo de formato ancho. Es cómoda para leer para 
nosotros pero no es cómoda para trabajar para las computadoras. Por ejemplo,
¿Cómo hacen para indicar que columna es la variable independiente y cual es la
de respuesta? No se puede porque la variable indepediente es ¡el nombre de la 
columna!

La forma para poder graficarlo, o analizarlo facilmente es poner esto datos 
en formato largo. Así quedará una columna para el nombre, otra con los tiempos
y otra con el puntaje.


----------------------
 Name    time   score 
------- ------ -------
 Carla    50     1.2  

 Mace     50     1.5  

  Lea     50     1.7  

 Karen    50     1.3  

 Carla   100     1.8  

 Mace    100     1.1  

  Lea    100     1.6  

 Karen   100     1.7  

 Carla   150     2.2  

 Mace    150     1.9  

  Lea    150     2.3  

 Karen   150     1.9  

 Carla   200     2.3  

 Mace    200      2   

  Lea    200     2.7  

 Karen   200     2.2  

 Carla   250      3   

 Mace    250     3.6  

  Lea    250     2.6  

 Karen   250     3.2  

 Carla   300     2.5  

 Mace    300      3   

  Lea    300     2.2  

 Karen   300     1.5  

 Carla   350     1.8  

 Mace    350     2.5  

  Lea    350     2.6  

 Karen   350     1.9  
----------------------

Table: (#tab:largo) Ejemplo de formato largo. Cada fila corresponde a un
       observación denotado por el nombre, el tiempo y el puntaje.

De esta forma, será fácil indicar que columna corresponde al eje de las 
ordenadas, cual al de las abscisas para hacer un gráfico o cual es la variable
independiente y cual la dependiente en una regresión.

Hay una función que nos permite llevar los datos en formato ancho a formato
largo:  `gather()` (*recoger*). Tiene tres argumntos: `data` el objeto, `key`
el nombre de la nueva columna que contendrá la identificación del dato, es decir
los viejos nombres de columna, y `value` la nueva columna que contendrá los 
valores. Por ejemplo:


```r
gather(data = race, key = time, value = score)
```

```
## Warning: attributes are not identical across measure variables;
## they will be dropped
```

```
##    time score
## 1  Name Carla
## 2  Name  Mace
## 3  Name   Lea
## 4  Name Karen
## 5    50   1.2
## 6    50   1.5
## 7    50   1.7
## 8    50   1.3
## 9   100   1.8
## 10  100   1.1
## 11  100   1.6
## 12  100   1.7
## 13  150   2.2
## 14  150   1.9
## 15  150   2.3
## 16  150   1.9
## 17  200   2.3
## 18  200     2
## 19  200   2.7
## 20  200   2.2
## 21  250     3
## 22  250   3.6
## 23  250   2.6
## 24  250   3.2
## 25  300   2.5
## 26  300     3
## 27  300   2.2
## 28  300   1.5
## 29  350   1.8
## 30  350   2.5
## 31  350   2.6
## 32  350   1.9
```

¡Pero que ha pasado aquí! No es el mismo resultado que en la Tabla 
\@ref(tab:largo). Por defecto, la función `gather()` recoge todas las columnas
del objeto. Para evitar que lo haga con todas hay que indicar con un signo menos.


```r
race_largo <- gather(data = race, key = time, value = score, -Name)
race_largo
```

```
##     Name time score
## 1  Carla   50   1.2
## 2   Mace   50   1.5
## 3    Lea   50   1.7
## 4  Karen   50   1.3
## 5  Carla  100   1.8
## 6   Mace  100   1.1
## 7    Lea  100   1.6
## 8  Karen  100   1.7
## 9  Carla  150   2.2
## 10  Mace  150   1.9
## 11   Lea  150   2.3
## 12 Karen  150   1.9
## 13 Carla  200   2.3
## 14  Mace  200   2.0
## 15   Lea  200   2.7
## 16 Karen  200   2.2
## 17 Carla  250   3.0
## 18  Mace  250   3.6
## 19   Lea  250   2.6
## 20 Karen  250   3.2
## 21 Carla  300   2.5
## 22  Mace  300   3.0
## 23   Lea  300   2.2
## 24 Karen  300   1.5
## 25 Carla  350   1.8
## 26  Mace  350   2.5
## 27   Lea  350   2.6
## 28 Karen  350   1.9
```

También funciona indicar cuales son las columnas que debe recoger escribiendo 
su nombre.


```r
gather(data = race, key = time, value = score, `50`, `100`, `150`, `200`, `250`,
       `300`, `350`)
```

```
##     Name time score
## 1  Carla   50   1.2
## 2   Mace   50   1.5
## 3    Lea   50   1.7
## 4  Karen   50   1.3
## 5  Carla  100   1.8
## 6   Mace  100   1.1
## 7    Lea  100   1.6
## 8  Karen  100   1.7
## 9  Carla  150   2.2
## 10  Mace  150   1.9
## 11   Lea  150   2.3
## 12 Karen  150   1.9
## 13 Carla  200   2.3
## 14  Mace  200   2.0
## 15   Lea  200   2.7
## 16 Karen  200   2.2
## 17 Carla  250   3.0
## 18  Mace  250   3.6
## 19   Lea  250   2.6
## 20 Karen  250   3.2
## 21 Carla  300   2.5
## 22  Mace  300   3.0
## 23   Lea  300   2.2
## 24 Karen  300   1.5
## 25 Carla  350   1.8
## 26  Mace  350   2.5
## 27   Lea  350   2.6
## 28 Karen  350   1.9
```

Claro que en este caso es mucho más largo hacerlo de esta forma y además hay que
delimitar cada número con acentos graves "`" porque no es un nombre válido en
*R*. Los nombres válidos son aquellos que empiezan con letras o puntos y 
no contienen signos de operaciones matemáticas ni espacios dentro.

Para poner los datos en formato ancho está la función `spread()` (*expandir*).
Los argumentos son los mismos que tiene `gather()`.


```r
spread(data = race_largo, key = time, value = score)
```

```
##    Name 100 150 200 250 300 350  50
## 1 Carla 1.8 2.2 2.3 3.0 2.5 1.8 1.2
## 2 Karen 1.7 1.9 2.2 3.2 1.5 1.9 1.3
## 3   Lea 1.6 2.3 2.7 2.6 2.2 2.6 1.7
## 4  Mace 1.1 1.9 2.0 3.6 3.0 2.5 1.5
```


## Por su cuenta

Lean los datos de 


```r
load(url("git.io/calidad-del-aire-2017.RData"))
```

Son datos de calidad del aire de la ciudad de Buenos Aires

1. ¿Qué columnas hay y cuantos datos encuentran?
2. ¿En que tipo de formato está? ¿Largo o ancho?
2. Cambien los datos a formato largo. *Pista*: Usen `gather` para llegar a
`FECHA`, `HORA`, `Columna`, `Valor`, luego Usen la función `separate` para
separar el lugar del tipo de variable. Finalmente, con spread llevenlo a 
un formato más adecuado para trabajar.
3. Calculen el promedio por lugar para las distintas variables. *Pista*: el
formato más largo que crearon como paso intermedio arriba hace que el trabajo 
sea más corto.
4. Ordenen los lugares por la contaminación con material particulado. 
5. Grafiquen cada uno de los datos de cada lugar, por fecha. Usen facetas para
cada variable y un color distinto para cada lugar.
6. Seleccionen los datos de parque Centenario.
7. Grafiquen los datos de parque Centenario.

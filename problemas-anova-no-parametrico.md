
# Problemas de ANOVA No Paramétrico





Las dos pruebas de ANOVA No Paramétrico están implentandas en *R*  bajo las
funciones `Median.test()` del paquete `agricolae` y la funcion `kruskal.test()`
en el paquete `stats` de *R* o la función `kruskal()` de `agricolae`. 

La función `Median.test()` tiene varios argumentos, el primero `y = ` 
corresponde a la variable de respuesta, el segundo `trt = ` es la 
columna que contiene la identificación del tratamiento. Esos dos son los
únicos argumentos obligatorios. Otro argumento interesante es `groups` que 
puede ser verdadero o falso y agrupa los tratamientos según si hay diferencias
significativas entre sí. La función `kruskal()` tiene los mismos argumentos 
principales. Ambos requieren acceso directo a las columnas, de igual forma
que la función  `wilcox.test()` para muestras apareadas por eso es necesario 
usar el operador de exposición `%$%`. 

Por otro lado, la función `kruskal.test()` funciona de forma similar a  
`wilcox.test()`. Tiene una interfaz que es igual a la anterior, con el primer
argumento siendo la variable de respuesta y el segundo la variable de 
tratamientos. Esta forma necesita ser expuestas la variables del objeto 
directamente con el operador de exposición. Además, tiene la forma de ingresar
como fórmula y especificar el objeto donde están lso datos.



## Problemas




`download.file("http://bit.ly/informe-anova-no-parametrico", "informe-anova-no-parametrico.Rmd")`




Un ecólogo ha estudiado la estructura social de los lobos marinos durante su 
permanencia en los apostaderos y ha sugerido que los juveniles de 1-2 años 
permanecen asociados a grupos de hembras, presumiblemente donde se encuentran 
sus madres. Para intentar establecer si la información disponible permite 
respaldar la existencia de esta asociación durante los viajes de alimentación,
el ecólogo utiliza información previamente colectada mediante registradores
satelitales sobre la distancia media recorrida por viaje de alimentación. Esta 
información se encuentra discriminada por sexo y categoría de edad. En este caso
sólo utilizó la información de los machos y hembras adultos y de juveniles de
1-2 años de ambos sexos. Estos datos fueron:



-----------------------------------------------------------------------
 Hembras.Juveniles   Hembras.Adultas   Macho.Juveniles   Macho.Adultos 
------------------- ----------------- ----------------- ---------------
        124                114               109              123      

        85                 121               83               177      

        71                 95                90               179      

        83                 116               85               119      

        105                97                91               157      

        78                 73                134              151      

        57                 95                133              164      

        90                 128               75               176      

        112                103               90               145      

        82                 134               120              179      

        109                74                85               154      

        64                 74                                 158      

        68                 131                                119      

        112                85                                 143      

        125                115                                178      

        89                 68                                 185      

        57                 85                                 141      

                           99                                 172      

                           85                                 115      

                           69                                 126      

                           122                                126      

                           113                                155      
-----------------------------------------------------------------------

Table: (#tab:lobos) Distancia media (km) recorrida por 
                 viaje de alimentación de lobos marinos machos y hembras,
                 juveniles y adultos.
¿Qué concluyó el ecólogo a partir de estos datos?









2. En un estudio de ecología trófica se han detectado diferencias en la dieta 
entre machos y hembras del lobo marino. Estas diferencias parecerían deberse a 
que las hembras se alimentarían en aguas más someras y cercanas a la costa que
los machos. Sabiendo que los cormoranes son predadores exclusivamente costeros, 
que los tiburones son predadores típicos de la plataforma intermedia, y que las
áreas costeras y someras se caracterizan por ser zonas de cría para muchas
especies de peces, un biólogo comparó las tallas de las raneyas (pez demersal-
bentónico) consumidas por cormoranes, tiburones y machos y hembras del lobo 
marino. La intención de esta comparación fue evaluar si la hipótesis planteada 
sobre las diferentes áreas de forrajeo de machos y hembras del lobo marino se ve
sustentada o no.



------------------------------------------
 Lobo.Hem   Lobo.Mac   Tiburon   Cormoran 
---------- ---------- --------- ----------
    12         26        13         12    

    14         23        17         14    

    13         21        25         8     

    20         26        22         8     

    15         17        19         16    

    16         17        13         9     

    15         17        22         10    

    15         15        26         16    

    13         15        21         10    

    13         21        26         9     

    18         27        14         9     

    13         15                   9     

    20         16                   12    

    18                              14    

    15                              16    

    17                                    

    10                                    

    20                                    

    19                                    
------------------------------------------

Table: (#tab:dieta) Largo total (cm) de raneyas consumidas 
por machos y hembras del lobo marino, 
por tiburones y por cormoranes. 





¿Cuál es su conclusión?



3. La dirección nacional de pesca desea determinar si los tres tipos de redes
que se utilizan para la pesca de langostino son igualmente eficaces. Para ello
calcula (para cada barco) el promedio anual de sus capturas (kg de langostino/
lance) y clasifica a los barcos en función del tipo de red empleada. Los
resultados obtenidos fueron:


-----------------------
 Red.1   Red.2   Red.3 
------- ------- -------
  195     227     213  

  280     254     231  

  262     216     180  

  279     248     198  

  206     243     172  

  263     245     239  

  208     222     218  

  229     222     161  

  236     228     179  

  235     216     195  

  277     245     223  

  255     231     183  

  262     205          

  193     231          

  248     208          

          231          

          213          

          224          

          206          
-----------------------

Table: (#tab:red) Promedio anual de capturas de langostino 
               por barco según el tipo de red empleada (kg/lance)







¿Se podría recomendar alguna red en particular?

 

4. En una primera etapa de un proyecto sobre el cultivo de pulpos, se desea
determinar si es posible aumentar la tasa de crecimiento de los pulpos mediante
un incremento de la temperatura del agua. Para ello se seleccionaron al azar
juveniles de pulpo y se los asignó aleatoriamente a tres peceras de cultivo.
En la primera pecera (Temp 0) se mantuvo a los pulpitos en condiciones de
temperatura similares a las del medio natural, en la segunda pecera (Temp 1)
se utilizó una temperatura constante de 20ºC y en la tercera pecera (Temp 2)
se mantuvo una temperatura constante de 25ºC. Los pulpitos fueron alimentados
ad libitum durante los 60 días que duró la experiencia. Debido a que no se
dispuso de peceras individuales, los datos de los ejemplares de una misma pecera
no pueden considerarse verdaderas réplicas, sino más bien pseudo-réplicas.
Estos datos fueron asumidos como réplicas verdaderas teniendo en cuenta las
dimensiones de las peceras (re-grandotas) en relación con los pulpitos (re-
chiquitos) y a la nula observación de interacciones entre los ejemplares.
Para cada pulpito se determinó el porcentaje de incremento en peso durante la
experiencia como:
 
$$\%Peso=\frac{Peso_{inicial}-Peso_{final}}{Peso_{inicial}}100 $$
Los resultados obtenidos fueron:
%Peso para los pulpos utilizados en cada experiencia

--------------------------
 Temp.0   Temp.1   Temp.2 
-------- -------- --------
   78      107      124   

   84      115      121   

  117       96      140   

   82      110      141   

  112      106      134   

  115       92      125   

  107      114      118   

  102       85      133   

  104       90      128   

  103      108      141   

   77       94      126   

  125      108      143   

  123               134   

   76               118   

                    140   
--------------------------

Table: (#tab:pulpos) Porcentaje de aumento de peso de
                  pulpos juveniles bajo tres temperaturas diferentes. 
                  Temp.0 = Medio Natural, Temp.1 = 20°C, Temp.2 = 25°C.







¿Es factible aumentar la tasa de crecimiento de los pulpos aumentando la temperatura del medio?

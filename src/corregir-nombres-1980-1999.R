library(tidyverse)

nombres <- readRDS("Labs/data/nombres-1980-1999.RDS")

nombres <- nombres %>%
filter(!grepl("^\\d+$", nombre))

nombres <- nombres %>% 
  mutate(nombre = str_to_title(string = nombre)) %>% 
  mutate(nombre = str_replace_all(nombre, "\\.|`|\\,|´|¨", "")) %>% 
  mutate(nombre = str_trim(nombre, "both")) 

nombres <- nombres %>%
  mutate(nombre = str_replace_all(nombre, c( "^0" = "O",
                                             "à|á" = "a",
                                             "è|é" = "e",
                                             "ì|í" = "i",
                                             "ò|ó" = "o",
                                             "ù|ú" = "u",
                                             "\\u0090" = "",
                                             "\\d" = "")),
         nombre = str_to_title(nombre)) %>% 
  group_by(nombre, anio) %>% 
  summarise(cantidad = sum(cantidad)) %>% 
  ungroup()

nombres <- 
  nombres %>% 
  slice(-1)

nombres <- nombres %>% 
  filter(stringr::str_detect(nombre, "^\\w+$"))

save(nombres, file = "Labs/data/nombres-1980-1999.RData")


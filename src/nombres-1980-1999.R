library(readr)
library(tidyr)
library(dplyr)
library(magrittr)

archivos <- dir("Labs/data/", pattern = "[0-9]{4}.csv", full.names = TRUE)

nombres <- lapply(archivos, read_csv) %>% 
  do.call(bind_rows, .)

nombres %<>% group_by(nombre, anio) %>% 
  summarise(cantidad = sum(cantidad)) %>% 
  ungroup()


saveRDS(nombres, "Labs/data/nombres-1980-1999.RDS")



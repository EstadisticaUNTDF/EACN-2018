library(readr)
library(tidyr)
library(dplyr)

archivos <- dir("Labs/data/", pattern = "[0-9]{4}.csv", full.names = TRUE)

nombres <- lapply(archivos, read_csv) %>% 
  do.call(bind_rows, .)

saveRDS(nombres, "Labs/data/nombres-1980-1999.RDS")



library(readr)
library(tidyverse)
library(lubridate)

calidad_de_aire_2017 <-
  read_delim(
    "Labs/data/calidad-de-aire-2017.csv",
    ";",
    escape_double = FALSE,
    col_types = cols(
      CO_CENTENARIO = col_double(),
      CO_LA_BOCA = col_double(),
      FECHA = col_date(format = "%d/%m/%Y"),
      NO2_CENTENARIO = col_double(),
      NO2_CORDOBA = col_double(),
      NO2_LA_BOCA = col_double(),
      PM10_CENTENARIO = col_double(),
      PM10_CORDOBA = col_double(),
      PM10_LA_BOCA = col_double()
    ),
    locale = locale(
      date_names = "es",
      decimal_mark = ",",
      grouping_mark = "."
    ),
    trim_ws = TRUE
  )


calidad_de_aire_2017 <- calidad_de_aire_2017 %>% 
  mutate(HORA = ifelse(HORA == 24, 0, HORA),
         FECHA = ifelse(HORA == 0, FECHA + days(1), FECHA) %>% 
           as.Date(origin = "1970-01-01"),
         HORA = HORA %>% parse_time(format = "%H"))

calidad_de_aire_2017 <- calidad_de_aire_2017 %>% 
  rename(CO_LABOCA = CO_LA_BOCA,
         NO2_LABOCA = NO2_LA_BOCA,
         PM10_LABOCA = PM10_LA_BOCA)

save(calidad_de_aire_2017, file = "Labs/data/calidad-del-aire-2017.RData")

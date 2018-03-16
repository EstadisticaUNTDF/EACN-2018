load("../Labs/data/anova_dos_factores.RData")

peso_rata <- peso_rata %>% gather(key = "Proteina", value = "Ganancia", -Fuente) %>% 
  mutate(Proteina = stringr::str_replace(Proteina, pattern = "\\.\\d$", "") %>% 
           as_factor())


sangrado <- sangrado %>% dplyr::rename(medianoche_tradicional = medianoche, 
                           medianoche_nuevo = medianoche.1,
                           madrugada_tradicional = madrugada, 
                           madrugada_nuevo = madrugada.1) %>%
  slice(-1) %>% 
  gather(hora_metodo, minutos) %>% 
  separate(hora_metodo, c("hora", "metodo")) %>% 
  mutate(minutos = as.numeric(minutos),
         id = rep(1:(nrow(.)/2)), 2) %>% 
  spread(metodo, minutos) %>% 
  select(-id)


huevos <- huevos %>% 
  gather(key = "Genotipo", value = "Viabilidad", -Huevos.Sembrados) %>% 
  mutate(Genotipo = forcats::fct_collapse(Genotipo,
                                          PP = c("PP", "PP.1", "PP.2"),
                                          PN = c("PN", "PN.1", "PN.2"),
                                          NN = c("NN", "NN.1", "NN.2"))) %>% 
  arrange(Genotipo, Huevos.Sembrados) %>% 
  mutate(id = seq_len(nrow(.)/3)) %>% 
  spread(Genotipo, Viabilidad) %>% 
  select(-id)

cerdos <- cerdos %>% dplyr::rename(Sexo = NA.) %>% 
  gather(key = "Dieta", value = "Engorde", -Sexo)


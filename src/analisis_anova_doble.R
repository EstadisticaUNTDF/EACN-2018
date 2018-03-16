analisis_anova_doble <- function(data, respuesta, factor_1, factor_2) {
  
  require(tidyverse)
  require(car)
  
  q_respuesta <- enquo(respuesta)
  en_factor_1 <- enquo(factor_1)
  en_factor_2 <- enquo(factor_2)
  
  str_factor_1 <- quo_name(en_factor_1)
  str_factor_2 <- quo_name(en_factor_2)
  
  
    smr <- data %>% 
    group_by(!! en_factor_1, !! en_factor_2) %>% 
    summarise(mean = mean(!!q_respuesta),
              var = var(!!q_respuesta),
              sd = sd(!!q_respuesta),
              n = n())
    
    if(all(smr[["n"]]>4)) {
      smr <- data %>% 
        group_by(!! en_factor_1, !! en_factor_2) %>%
        summarise(normalidad = list(lillie.test(!!q_respuesta))) %>% 
        mutate(lillie.test.value = map_dbl(normalidad, "statistic"),
               lillie.test.p.value = map_dbl(normalidad, "p.value")) %>% 
        inner_join(smr, .)
    }

      print(smr)
  
    g <- do.call(paste0, data %>% select(!! en_factor_1, !! en_factor_2))
    print(bt <- bartlett.test(data %>% pull(!! q_respuesta), g))
  f1 <- as.formula(paste0(substitute(respuesta), "~", 
                          paste(substitute(factor_1), substitute(factor_2), sep = " * ")))
  
  print(lt <- leveneTest(f1, data))
  
  model <- aov(f1, data)
  print(summary(model))
  
  estimated_means <- emmeans(model, f1[-2])
  print(cld(estimated_means ))
  
  p <- estimated_means %>% 
    cld() %>% 
    ggplot(aes_string(str_factor_1, "emmean", ymax = "upper.CL", ymin = "lower.CL")) +
    geom_point(aes_string(shape = str_factor_2)) +
    geom_linerange() +
    geom_line(aes_string(linetype = str_factor_2, group = str_factor_2)) +
    labs(y = quo_name(q_respuesta))
  
    
  print(p)
  
  print(autoplot(model))
  
  invisible(list(smr = smr, bt = bt, lt = lt, model = model, estimated_means = estimated_means ))
}


pkg_list <- c("bookdown", "tidyverse", "scifigure", "emmeans", "car", "additivityTests", "cowplot",
              "magrittr", "multcompView", "maps", "pander", "agricolae", "additivityTests", "broom", 
              "compute.es", "pwr", "forcats", "nortest", "sn", "PMCMR", "devtools")

pkg_installed <- installed.packages()[,1]

pkg_not_installed <- pkg_list[!(pkg_list %in% pkg_installed)]

install.packages(pkg_list, repos = "https://cloud.r-project.org/")

devtools::install_github("thomasp85/patchwork")
devtools::install_github("sinhrks/ggfortify")
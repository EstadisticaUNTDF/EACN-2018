sci_figure <- function (experiments, hide_stages = NULL, names_of_stages = TRUE) 
{
  if (!all(unlist(lapply(experiments, function(x) {
    x %in% c("observed", "different", "unobserved", "incorrect")
  })))) {
    stop("Invalid cell value in experiments data frame.")
  }
  if (ncol(experiments) > 20) {
    experiments <- experiments[, 1:20]
    warning("Only showing the first 20 experiments for ease of plotting.")
  }
  idx <- !(rownames(experiments) %in% hide_stages)
  stage_names <- c("Población", "Pregunta", "Hipótesis", 
                   "Diseño Exp.", "Experimentador", "Datos", "Plan de Análisis", 
                   "Analista", "Código", "Estimador", "Resultados")
  stage_names <- stage_names[idx]
  experiments <- experiments[idx, , drop = FALSE]
  grid::grid.newpage()
  gptext <- grid::gpar(fontsize = 16 - min(nrow(experiments), 
                                           7))
  yht <- seq(0.95, 0.05, length = nrow(experiments))
  if (names_of_stages) {
    vp1 <- grid::viewport(x = 0.1, y = 0.5, width = 0.2, 
                          height = 0.9)
    grid::pushViewport(vp1)
    grid::grid.text(stage_names, x = 0.9, y = yht, gp = gptext)
    grid::upViewport()
  }
  icons <- scifigure::icons
  vp2 <- grid::viewport(x = 0.5, y = 0.5, width = 0.6, height = 0.9)
  grid::pushViewport(vp2)
  for (j in 1:ncol(experiments)) {
    for (i in 1:nrow(experiments)) {
      grid::grid.raster(icons[[paste(rownames(experiments)[i], 
                                     experiments[i, j], sep = "_")]], x = j/(ncol(experiments) + 
                                                                               1), y = yht[i], height = 0.08 - 0.03 * (ncol(experiments) > 
                                                                                                                         4), width = grid::unit(max(0.05, min(0.1, 1/((ncol(experiments) * 
                                                                                                                                                                         3)))), "snpc"))
    }
  }
  grid::upViewport()
  vp3 <- grid::viewport(x = 0.5, y = 0.95, width = 0.6, height = 0.1)
  grid::pushViewport(vp3)
  grid::grid.text(colnames(experiments), x = (1:ncol(experiments))/(ncol(experiments) + 
                                                                      1), y = 0.7, gp = gptext, rot = ifelse(ncol(experiments) > 
                                                                                                               12, 90, 0))
  grid::upViewport()
  vp4 <- grid::viewport(x = 0.9, y = 0.5, width = 0.2, height = 0.6)
  grid::pushViewport(vp4)
  cols <- c("#D20000", "#007888", "#CDCDCD", "black")
  grid::grid.rect(width = 0.25, height = 0.1, x = 0.3, y = c(0.2, 
                                                             0.4, 0.6, 0.8), gp = grid::gpar(fill = cols))
  grid::grid.text(c("Incorrecto", "Diferente", "No Observado", 
                    "Original"), x = 0.3, y = c(0.1, 0.3, 0.5, 0.7), gp = grid::gpar(fontsize = 14))
}
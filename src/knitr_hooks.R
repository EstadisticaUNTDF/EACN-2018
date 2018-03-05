library(knitr)

knit_hooks$set(wrapper_full = function(before, options, envir) {
  if (before) {
    sprintf("    ```{r %s}\n", options$params.src)
  } else "    ```\n"
})

knit_hooks$set(wrapper = function(before, options, envir) {
  if (before) {
    "    ```{r}\n"
  } else "    ```\n"
})

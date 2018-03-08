#!/bin/sh

Rscript -e "bookdown::render_book('Labs/index.Rmd', 'bookdown::gitbook')"

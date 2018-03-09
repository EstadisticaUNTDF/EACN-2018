#!/bin/sh

cd Labs
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
Rscript -e "cat(getwd())"
### Global variables

input_folder <- list("raw_data", "DTH")
output_folder <- list("clean_data", "DTH")
col_Hanoi <- "red"
col_HCMC <- "green"


### Packages

needed_packages <- c("dplyr", "readxl", "vietnameseConverter", "lubridate", "readr",
                     "ggplot2", "Rmisc", "tidyr", "purrr", "shiny", "data.table",
                     "stringi", "broom", "neatRanges", "scales", "purrr", "stringr", "here")

to_install <- needed_packages[which(!needed_packages %in% rownames(installed.packages()))]
if (length(to_install)) install.packages(to_install)

tmp <- sapply(needed_packages, require, character.only = TRUE)
rm(to_install, tmp)


### Utilitary functions

source("utilities_1.R")
source("utilities_2.R")

saveRDS2 <- function(object, file, ...) saveRDS(object, file = do.call(here, c(output_folder, file)), ...)

add_folder <- function(file) do.call(here, c(output_folder, file))

reader_factory1 <- function(f) {
  function(file, ...) as_tibble(f(add_folder(file), header = TRUE, encoding = "UTF-8", ...))
}

reader_factory2 <- function(f) function(...) reader_factory1(f)(..., sep = ",")

read.csv2 <- reader_factory1(read.csv)

fread2 <- reader_factory2(fread)

read.table2 <- reader_factory2(read.table)

read_excel2 <- function(file, ...) read_excel(add_folder(file), ...)


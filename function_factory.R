add_folder <- function(file) paste0("/raw_data/DTH/", file)

reader_factory1 <- function(f) {
  function(file, ...) as_tibble(f(add_folder(file), header = TRUE, encoding = "UTF-8", ...))
}

reader_factory2 <- function(f) function(...) reader_factory1(f)(..., sep = ",")

read.csv2 <- reader_factory1(read.csv)

fread2 <- reader_factory2(fread)

read.table2 <- reader_factory2(read.table)

read_excel2 <- function(file, ...) read_excel(add_folder(file), ...)









read.csv2 <- function(file, ...) as_tibble(read.csv(paste0("/raw_data/DTH/", file), header = TRUE, encoding = "UTF-8", ...))

fread2 <- function(file, ...) {
  as_tibble(fread(paste0("/raw_data/DTH/", file), header = TRUE, encoding = "UTF-8", sep = ",", ...))
}

read.table2 <- function(file, ...) {
  as_tibble(read.table(paste0("/raw_data/DTH/", file), header = TRUE, encoding = "UTF-8", sep = ",", ...))
}

read_excel2 <- function(file, ...) read_excel(paste0("/raw_data/DTH/", file), ...)



###


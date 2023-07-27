library(readr)
# Finalizar la primera llamada read_tsv()
# para importar las observaciones 7, 8, 9, 10 y 11 de potatoes.txt.

# readr is already loaded

# Column names
properties <- c(
  "area", "temp", "size", "storage", "method",
  "texture", "flavor", "moistness"
)

# Import 5 observations from potatoes.txt: potatoes_fragment
potatoes_fragment <- read_tsv("data/potatoes.tsv",
  skip = 6,
  n_max = 5,
  col_names = properties
)

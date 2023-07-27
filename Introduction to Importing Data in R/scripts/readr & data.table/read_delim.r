library(readr)
# Importar todos los datos en "potatoes.txt" usando read_delim();
# almacenar el dataframe resultante en potatoes.
# Imprimir potatoes.

# readr is already loaded

# Column names
properties <- c(
  "area", "temp", "size", "storage", "method",
  "texture", "flavor", "moistness"
)

# Import potatoes.txt using read_delim(): potatoes
potatoes <- read_delim("data/potatoes.tsv",
  delim = "\t",
  col_names = properties
)

# Print out potatoes
potatoes

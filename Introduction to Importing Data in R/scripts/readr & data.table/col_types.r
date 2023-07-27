library(readr)
# En la segunda llamada read_tsv (),
# edite el argumento col_types para importar
# todas las columnas como caracteres (c).
# Guarde el dataframe resultante en potatoes_char.
# Imprima la estructura de potatoes_char
# y verifique si todos los tipos de columna son chr, abreviatura de character.

# readr is already loaded

# Column names
properties <- c(
  "area", "temp", "size", "storage", "method",
  "texture", "flavor", "moistness"
)

# Import all data, but force all columns to be character: potatoes_char
potatoes_char <- read_tsv("data/potatoes.tsv",
  col_types = "cccccccc",
  col_names = properties
)

# Print out structure of potatoes_char
str(potatoes_char)

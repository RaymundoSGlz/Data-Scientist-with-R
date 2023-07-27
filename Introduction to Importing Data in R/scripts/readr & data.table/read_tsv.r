library(readr)
# Usar read_tsv() para importar los datos de potatoes.txt
# y almacenarlos en el data frame potatoes.
# Además de la ruta al archivo,
# también deberás especificar el argumento col_names;
# puedes usar el vector properties para esto.

# readr is already loaded

# Column names
properties <- c(
  "area", "temp", "size", "storage", "method",
  "texture", "flavor", "moistness"
)

# Import potatoes.txt: potatoes
potatoes <- read_tsv("data/potatoes.tsv",
  col_names = properties
)

# Call head() on potatoes
head(potatoes)

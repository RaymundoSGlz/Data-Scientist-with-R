comics <- read.csv("data/comics.csv", stringsAsFactors = TRUE)
comics <- tibble::tibble(comics)
# El conjunto de datos se ha cargado en tu espacio de trabajo como `comics`.

# - Escribe el nombre del conjunto de datos
## para ver las filas y columnas del conjunto de datos.
# - Ver los `levels()` que la variable `align` puede tomar.
# - Ver los `levels()` que la variable `gender` puede tomar.
# - Crea una tabla de contingencia de las mismas dos variables.

# Print the comics data
comics

# Check levels of align
levels(comics$align)

# Check the levels of gender
levels(comics$gender)

# Create a 2-way contingency table
table(comics$align, comics$gender)
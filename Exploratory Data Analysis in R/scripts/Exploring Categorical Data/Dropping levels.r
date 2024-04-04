comics <- read.csv("data/comics.csv", stringsAsFactors = TRUE)
comics <- tibble::tibble(comics)
tab <- table(comics$align, comics$gender)

# La tabla de contingencia del último ejercicio
## está disponible en tu espacio de trabajo como `tab`.

# - Carga el paquete `dplyr`.
# - Imprime `tab` para averiguar qué nivel de `align`
## tiene las entradas totales más bajas.
# - Usa `filter()` para filtrar todas las filas de `comics` con ese nivel,
## luego elimina el nivel no utilizado con `droplevels()`.
## Guarda el conjunto de datos simplificado como `comics_filtered`.

# Load dplyr
library(dplyr)

# Print tab
tab

# Remove align level
comics_filtered <- comics %>%
  filter(align != "Reformed Criminals") %>%
  droplevels()

# See the result
comics_filtered

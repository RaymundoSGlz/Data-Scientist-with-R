# Agregar el verbo de unión correcto,
# el nombre de la segunda tabla y la columna de unión para la segunda tabla.

# Ahora, use el argumento de suffix para agregar
# sufijos "_part" y "_category" para reemplazar los campos name.x y name.y.


# Cargamos los datasets
library(dplyr)
library(readr)
parts <- read_rds("data/parts.rds")
part_categories <- read_rds("data/part_categories.rds")

parts %>%
    inner_join(part_categories,
        by = c("part_cat_id" = "id"),
        suffix = c("_part", "_category")
    )

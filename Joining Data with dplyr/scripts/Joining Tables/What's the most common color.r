# Realizar una unión interna (inner join) de la tabla colors
# utilizando la columna color_id de la unión anterior y
# la columna id de la tabla colors; utilizar los sufijos "_set" y "_color".

# Contar la columna name_color y ordenar los resultados
# para que los colores más prominentes aparezcan primero.

# Cargamos los datasets
library(dplyr)
library(readr)
inventory_parts <- read_rds("data/inventory_parts.rds")
sets <- read_rds("data/sets.rds")
inventories <- read_rds("data/inventories.rds")
colors <- read_rds("data/colors.rds")

# Add an inner join for the colors table
sets %>%
    inner_join(inventories, by = "set_num") %>%
    inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
    inner_join(colors,
        by = c("color_id" = "id"),
        suffix = c("_set", "_color")
    ) %>%
    count(name_color, sort = TRUE)

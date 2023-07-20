# Para unir los temas,
# primero debes combinar las tablas inventory_parts_joined y sets.
# Luego, combina la primera unión con la tabla themes,
# usando el argumento suffix para aclarar
# de qué tabla proviene cada nombre ("_set" o "_theme").

# Cargamos los datasets
library(dplyr)
library(readr)
inventories <- read_rds("data/inventories.rds")
inventory_parts <- read_rds("data/inventory_parts.rds")
sets <- read_rds("data/sets.rds")
themes <- read_rds("data/themes.rds")

inventory_parts_joined <- inventories %>%
    inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
    arrange(desc(quantity)) %>%
    select(-id, -version)

# Start with inventory_parts_joined table
inventory_parts_joined %>%
    # Combine with the sets table
    inner_join(sets, by = "set_num") %>%
    # Combine with the themes table
    inner_join(themes,
        by = c("theme_id" = "id"),
        suffix = c("_set", "_theme")
    )

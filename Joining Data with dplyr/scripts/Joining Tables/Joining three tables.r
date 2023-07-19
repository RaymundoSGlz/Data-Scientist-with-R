# Combine la tabla inventories con la tabla sets.
# A continuación, una la tabla inventory_parts
# a la tabla que creaste en la unión anterior por los ID de inventario.

# Cargamos los datasets
library(dplyr)
library(readr)
inventory_parts <- read_rds("data/inventory_parts.rds")
sets <- read_rds("data/sets.rds")
inventories <- read_rds("data/inventories.rds")

sets %>%
    # Add inventories using an inner join
    inner_join(inventories, by = "set_num") %>%
    # Add inventory_parts using an inner join
    inner_join(inventory_parts, by = c("id" = "inventory_id"))

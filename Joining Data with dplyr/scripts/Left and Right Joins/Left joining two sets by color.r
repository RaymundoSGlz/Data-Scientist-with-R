# Sumar la columna quantity por color_id en el dataset Millennium Falcon.
# Ahora, sumar la columna quantity por color_id en el dataset Star Destroyer.

# Realizar un left join entre las tablas
# star_destroyer_colors y millennium_falcon_colors,
# usando la columna color_id y los sufijos _falcon y _star_destroyer.

# Cargamos los datasets
library(dplyr)
library(readr)
inventories <- read_rds("data/inventories.rds")
inventory_parts <- read_rds("data/inventory_parts.rds")

inventory_parts_joined <- inventories |>
    inner_join(inventory_parts, by = c("id" = "inventory_id")) |>
    select(-id, -version) |>
    arrange(desc(quantity))

millennium_falcon <- inventory_parts_joined %>%
    filter(set_num == "7965-1")

star_destroyer <- inventory_parts_joined %>%
    filter(set_num == "75190-1")

# Aggregate Millennium Falcon for the total quantity in each part
millennium_falcon_colors <- millennium_falcon %>%
    group_by(color_id) %>%
    summarize(total_quantity = sum(quantity))

# Aggregate Star Destroyer for the total quantity in each part
star_destroyer_colors <- star_destroyer %>%
    group_by(color_id) %>%
    summarize(total_quantity = sum(quantity))

# Left join the Millennium Falcon colors to the Star Destroyer colors
millennium_falcon_colors %>%
    left_join(star_destroyer_colors,
        by = c("color_id"),
        suffix = c("_falcon", "_star_destroyer")
    )

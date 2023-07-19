# Realizar un left join entre las tablas star_destroyer y millennium_falcon
# en las columnas part_num y color_id con los sufijos _falcon y _star_destroyer.

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

# Combine the star_destroyer and millennium_falcon tables
millennium_falcon %>%
    left_join(star_destroyer,
        by = c("part_num", "color_id"),
        suffix = c("_falcon", "_star_destroyer")
    )

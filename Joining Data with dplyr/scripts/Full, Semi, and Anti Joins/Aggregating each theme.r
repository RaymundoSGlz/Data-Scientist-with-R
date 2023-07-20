# Contar el part_number y el color_id de las piezas de Batman y Star Wars,
# ponderado por cantidad.

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

inventory_sets_themes <- inventory_parts_joined %>%
  inner_join(sets, by = "set_num") %>%
  inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))

batman <- inventory_sets_themes %>%
  filter(name_theme == "Batman")

star_wars <- inventory_sets_themes %>%
  filter(name_theme == "Star Wars")

# Count the part number and color id, weight by quantity
batman %>%
    count(part_num, color_id, wt = quantity)

star_wars %>%
    count(part_num, color_id, wt = quantity)
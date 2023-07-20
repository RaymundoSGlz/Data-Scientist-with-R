# Ordenar el número de piezas de Star Wars en la tabla parts_joined
# en orden descendente.
# Unir internamente la tabla colors a la tabla parts_joined.
# Combinar la tabla parts a la unión anterior usando una unión interna;
# agregar sufijos "_color" y "_part" para especificar
# si la información proviene de la tabla colors o de la tabla parts.

# Cargamos los datasets
library(dplyr)
library(readr)
library(tidyr)
inventories <- read_rds("data/inventories.rds")
inventory_parts <- read_rds("data/inventory_parts.rds")
sets <- read_rds("data/sets.rds")
themes <- read_rds("data/themes.rds")
colors <- read_rds("data/colors.rds")
parts <- read_rds("data/parts.rds")

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

batman_parts <- batman %>%
  count(part_num, color_id, wt = quantity)

star_wars_parts <- star_wars %>%
  count(part_num, color_id, wt = quantity)

batman_parts %>%
  # Combine the star_wars_parts table
  full_join(star_wars_parts, by = c("part_num", "color_id"),
  suffix = c("_batman", "_star_wars")) %>%
  # Replace NAs with 0s in the n_batman and n_star_wars columns
  replace_na(list(n_batman = 0, n_star_wars = 0))

parts_joined <- batman_parts %>%
  full_join(star_wars_parts, by = c("part_num", "color_id"),
  suffix = c("_batman", "_star_wars")) %>%
  replace_na(list(n_batman = 0, n_star_wars = 0))

parts_joined %>%
  # Sort the number of star wars pieces in descending order
  arrange(desc(n_star_wars)) %>%
  # Join the colors table to the parts_joined table
  inner_join(colors, by = c("color_id" = "id")) %>%
  # Join the parts table to the previous join
    inner_join(parts, by = "part_num", suffix = c("_color", "_part"))

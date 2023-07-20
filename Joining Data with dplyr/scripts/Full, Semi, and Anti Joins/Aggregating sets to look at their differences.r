# Agregue un filtro para el tema "Batman" para crear el objeto batman_colors.
# Agregue la columna fraction a batman_colors que muestre
# el total dividido por la suma del total.
# Repita los pasos para filtrar y agregar los datos
# del conjunto "Star Wars" para crear el objeto star_wars_colors.
# Agregue la columna fraction a star_wars_colors
# para mostrar la fracción del total.

# Cargamos los datasets
library(dplyr)
library(readr)
inventories <- read_rds("data/inventories.rds")
sets <- read_rds("data/sets.rds")
themes <- read_rds("data/themes.rds")
inventory_parts <- read_rds("data/inventory_parts.rds")

inventory_parts_themes <- inventories %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  arrange(desc(quantity)) %>%
  select(-id, -version) %>%
  inner_join(sets, by = "set_num") %>%
  inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))

batman_colors <- inventory_parts_themes %>%
  # Filter the inventory_parts_themes table for the Batman theme
  filter(name_theme == "Batman") %>%
  group_by(color_id) %>%
  summarize(total = sum(quantity)) %>%
  # Add a fraction column of the total divided by the sum of the total
  mutate(fraction = total / sum(total))

# Filter and aggregate the Star Wars set data; add a fraction column
star_wars_colors <- inventory_parts_themes %>%
    filter(name_theme == "Star Wars") %>%
    group_by(color_id) %>%
    summarize(total = sum(quantity)) %>%
    mutate(fraction = total / sum(total))
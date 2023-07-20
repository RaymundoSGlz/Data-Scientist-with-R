# Combine the batman_colors and star_wars_colors tables;
# asegúrese de incluir todas las observaciones de ambas tablas.
# Reemplace los NA en las columnas total_batman y total_star_wars.

# Agregue una columna de diferencia
# que sea la diferencia entre fraction_batman y fraction_star_wars,
# y una columna total, que es la suma de total_batman y total_star_wars.
# Agregue un filtro para seleccionar observaciones
# donde el total sea al menos 200.

# Cargamos los datasets
library(dplyr)
library(readr)
library(tidyr)
inventories <- read_rds("data/inventories.rds")
sets <- read_rds("data/sets.rds")
themes <- read_rds("data/themes.rds")
inventory_parts <- read_rds("data/inventory_parts.rds")
colors <- read_rds("data/colors.rds")

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

batman_colors %>%
    # Join the Batman and Star Wars colors
    full_join(star_wars_colors,
        by = "color_id",
        suffix = c("_batman", "_star_wars")
    ) %>%
    # Replace NAs in the total_batman and total_star_wars columns
    replace_na(list(total_batman = 0, total_star_wars = 0)) %>%
    inner_join(colors, by = c("color_id" = "id")) %>%
    # Create the difference and total columns
    mutate(
        difference = fraction_batman - fraction_star_wars,
        total = total_batman + total_star_wars
    ) %>%
    # Filter for totals greater than 200
    filter(total >= 200)

# Crear un gráfico de barras utilizando la tabla colors_joined
# para mostrar los colores más prominentes en los temas
# de Batman y Star Wars, con las barras coloreadas por su nombre.
# Cargamos los datasets
library(dplyr)
library(readr)
library(tidyr)
library(ggplot2)
library(forcats)
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

colors_joined <- batman_colors %>%
    inner_join(star_wars_colors,
        by = "color_id",
        suffix = c("_batman", "_star_wars")
    ) %>%
    replace_na(list(total_batman = 0, total_star_wars = 0)) %>%
    inner_join(colors, by = c("color_id" = "id")) %>%
    mutate(
        difference = fraction_batman - fraction_star_wars,
        total = total_batman + total_star_wars
    ) %>%
    filter(total >= 200) %>%
    mutate(name = fct_reorder(name, difference))

color_palette <- setNames(colors_joined$rgb, colors_joined$name)
# Create a bar plot using colors_joined and the name and difference columns
ggplot(colors_joined, aes(name, difference, fill = name)) +
    geom_col() +
    coord_flip() +
    scale_fill_manual(values = color_palette, guide = "none") +
    labs(y = "Difference: Batman - Star Wars")

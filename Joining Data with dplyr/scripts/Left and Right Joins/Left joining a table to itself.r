# Hacer un join izquierdo de la tabla themes con sus propios hijos,
# con los sufijos _parent y _child respectivamente.
# Filtrar el resultado del join para encontrar temas que no tienen hijos.

# Cargamos el dataset
library(dplyr)
library(readr)
themes <- read_rds("data/themes.rds")

themes %>%
    # Left join the themes table to its own children
    left_join(themes,
        by = c("id" = "parent_id"),
        suffix = c("_parent", "_child")
    ) %>%
    # Filter for themes that have no child themes
    filter(is.na(name_child))

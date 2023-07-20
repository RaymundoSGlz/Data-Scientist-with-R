# Use la tabla inventory_parts para encontrar
# los colores que están incluidos en al menos un set.

# Cargamos los datasets
library(dplyr)
library(readr)
inventory_parts <- read_rds("data/inventory_parts.rds")
sets <- read_rds("data/sets.rds")
colors <- read_rds("data/colors.rds")

# Use inventory_parts to find colors included in at least one set
colors %>%
    semi_join(inventory_parts, by = c("id" = "color_id"))
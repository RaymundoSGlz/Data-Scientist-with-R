library(dplyr)
library(forcats)
sfo_survey <- readRDS("data/sfo_survey_ch2_1.rds")

# Contar las categorías de dest_region de sfo_survey.

# Count categories of dest_region
sfo_survey %>%
  count(dest_region)

# Crear un vector llamado europe_categories que contenga
# los tres valores de dest_region que deben colapsarse.
# Agrega una nueva columna a sfo_survey llamada dest_region_collapsed
# que contenga los valores de la columna dest_region, excepto
# las categorías almacenadas en europe_categories que deben colapsarse a Europa.
# Cuenta las categorías de dest_region_collapsed.

# Count categories of dest_region
sfo_survey %>%
  count(dest_region)

# Categories to map to Europe
europe_categories <- c("EU", "eur", "Europ")

# Add a new col dest_region_collapsed
sfo_survey %>%
  # Map all categories in europe_categories to Europe
  mutate(dest_region_collapsed = fct_collapse(dest_region,
    Europe = europe_categories
  )) %>%
  # Count categories of dest_region_collapsed
  count(dest_region_collapsed)

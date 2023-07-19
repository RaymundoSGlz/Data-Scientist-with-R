# Use el verbo count para contar cada part_cat_id en la tabla parts.
# Use un right_join para unir part_categories.
# Necesitará usar el part_cat_id de la cuenta
# y la columna id de part_categories.

# Filtrar donde la columna n es NA

# Cargamos los datasets
library(dplyr)
library(readr)
parts <- read_rds("data/parts.rds")
part_categories <- read_rds("data/part_categories.rds")

parts %>%
    # Count the part_cat_id
    count(part_cat_id) %>%
    # Right join part_categories
    right_join(part_categories, by = c("part_cat_id" = "id")) %>%
    # Filter for NA
    filter(is.na(n))

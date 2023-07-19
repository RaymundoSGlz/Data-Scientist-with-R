# Use replace_na para reemplazar NAs en la columna n con el valor 0.

# Cargamos los datasets
library(dplyr)
library(readr)
library(tidyr)
parts <- read_rds("data/parts.rds")
part_categories <- read_rds("data/part_categories.rds")

parts %>%
  count(part_cat_id) %>%
  right_join(part_categories, by = c("part_cat_id" = "id")) %>%
  # Use replace_na to replace missing values in the n column
    replace_na(list(n = 0))
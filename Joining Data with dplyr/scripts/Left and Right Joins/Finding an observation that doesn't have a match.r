# Use un left_join para unir los datasets
# sets e inventory_version_1 usando la columna común.
# Filtrar por donde la columna version es NA usando is.na.

# Cargamos los datasets
library(dplyr)
library(readr)
sets <- read_rds("data/sets.rds")
inventories <- read_rds("data/inventories.rds")

inventory_version_1 <- inventories %>%
  filter(version == 1)

# Join versions to sets
sets %>%
  left_join(inventory_version_1, by = "set_num") %>%
  # Filter for where version is na
    filter(is.na(version))
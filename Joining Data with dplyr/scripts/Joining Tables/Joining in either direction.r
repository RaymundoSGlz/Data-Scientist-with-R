# Conectar las tablas de inventory_parts y parts
# por sus números de parte usando un inner join.

# Cargamos los dataset
library(dplyr)
library(readr)
parts <- read_rds("data/parts.rds")
inventory_parts <- read_rds("data/inventory_parts.rds")

# Combine the parts and inventory_parts tables
inventory_parts %>%
    inner_join(parts, by = "part_num")
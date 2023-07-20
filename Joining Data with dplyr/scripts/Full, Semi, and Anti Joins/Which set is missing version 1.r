# Usar filter() para extraer la versión 1 de la tabla inventories;
# guardar el filtro en version_1_inventories.
# Usar anti_join para combinar version_1_inventories con sets
# para determinar qué set le falta una versión 1.

# Cargamos los datasets
library(dplyr)
library(readr)
inventories <- read_rds("data/inventories.rds")
sets <- read_rds("data/sets.rds")

# Use filter() to extract version 1
version_1_inventories <- inventories %>%
    filter(version == 1)

# Use anti_join() to find which set is missing a version 1
sets %>%
    anti_join(version_1_inventories, by = "set_num")

# Filtrar el conjunto de batwing
# para las partes que también están en el batmobile,
# independientemente de si tienen el mismo color.
# Filtrar el conjunto de batwing
# para las partes que no están en el batmobile,
# independientemente de si tienen el mismo color.

# Cargamos los datasets
library(dplyr)
library(readr)
inventories <- read_rds("data/inventories.rds")
inventory_parts <- read_rds("data/inventory_parts.rds")
sets <- read_rds("data/sets.rds")
themes <- read_rds("data/themes.rds")

inventory_parts_joined <- inventories %>%
    inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
    arrange(desc(quantity)) %>%
    select(-id, -version)

batmobile <- inventory_parts_joined %>%
  filter(set_num == "7784-1") %>%
  select(-set_num)

batwing <- inventory_parts_joined %>%
  filter(set_num == "70916-1") %>%
  select(-set_num)

# Filter the batwing set for parts that are also in the batmobile set
batwing %>%
    semi_join(batmobile, by = "part_num")

# Filter the batwing set for parts that aren't in the batmobile set
batwing %>%
    anti_join(batmobile, by = "part_num")
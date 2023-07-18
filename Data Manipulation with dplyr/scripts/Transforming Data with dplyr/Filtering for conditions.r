# Encontrar solo los condados
# que tienen una población superior a un millón (1000000).

# cargamos el .rds
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
  select(state, county, population)

counties_selected %>%
  # Filter for counties with a population above 1000000
  filter(population > 1000000)

# Encontrar solo los condados en el estado
# de California que también tienen una población superior a un millón (1000000).
counties_selected %>%
  # Filter for counties in California with a population above 1000000
  filter(state == "California", population > 1000000)

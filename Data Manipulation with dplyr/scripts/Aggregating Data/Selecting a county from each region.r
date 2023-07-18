# Encuentra el condado en cada región
# con el mayor porcentaje de ciudadanos que caminan al trabajo.

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
  select(region, state, county, metro, population, walk)

counties_selected %>%
  # Group by region
  group_by(region) %>%
  # Find the county with the highest percentage of people who walk to work
    slice_max(walk, n = 1)

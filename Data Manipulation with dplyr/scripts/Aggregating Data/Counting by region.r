# Usa count() para encontrar el número de condados en cada región,
# usando un segundo argumento para ordenar en orden descendente.

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
  select(county, region, state, population, citizens)

# Use count to find the number of counties in each region
counties_selected %>%
    count(region, sort = TRUE)

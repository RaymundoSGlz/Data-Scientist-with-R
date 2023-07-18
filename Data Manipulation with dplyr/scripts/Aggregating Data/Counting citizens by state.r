# Contar el número de condados en cada estado,
# ponderado en función de la columna de ciudadanos,
# y ordenado en orden descendente.

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
  select(county, region, state, population, citizens)

# Find number of counties per state, weighted by citizens,
# sorted in descending order
counties_selected %>%
    count(state, wt = citizens, sort = TRUE)

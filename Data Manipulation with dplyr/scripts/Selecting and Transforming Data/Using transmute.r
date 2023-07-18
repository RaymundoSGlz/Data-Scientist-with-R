# Mantener solo las columnas state, county, y population,
# y agregar una nueva columna, density, que contenga population por land_area.
# Filtrar solo los condados con una población mayor a un millón.
# Ordenar la tabla en orden ascendente de densidad.

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties %>%
  # Keep the state, county, and populations columns, and add a density column
  transmute(state, county, population, density = population / land_area) %>%
  # Filter for counties with a population greater than one million
    filter(population > 1000000) %>%
  # Sort density in ascending order
  arrange(density, desc = FALSE)

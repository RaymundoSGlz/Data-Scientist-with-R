# Seleccionar solo las columnas state, county, population, men, y women.
# Agregar una variable proporción_hombres
# con la fracción de la población del condado compuesta por hombres.
# Filtrar los condados con una población de al menos
# diez mil (10000) habitantes.
# Ordenar los condados en orden descendente de su proporción de hombres.

# Carga el archivo de datos
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties %>%
  # Select the five columns
  select(state, county, population, men, women) |>
  # Add the proportion_men variable
  mutate(proportion_men = men / population) |>
  # Filter for population of at least 10,000
    filter(population >= 10000) |>
  # Arrange proportion of men in descending order
  arrange(desc(proportion_men))

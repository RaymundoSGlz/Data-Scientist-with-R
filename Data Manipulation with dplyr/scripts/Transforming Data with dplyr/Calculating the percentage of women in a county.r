# Seleccionar las columnas estado, condado, población, hombres y mujeres.
# Agregar una nueva variable llamada proportion_women
# con la fracción de la población del condado compuesta por mujeres.

# Carga el archivo de datos
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
  # Select the columns state, county, population, men, and women
  select(state, county, population, men, women)

counties_selected %>%
  # Calculate proportion_women as
  # the fraction of the population made up of women
  mutate(proportion_women = women / population)

# Seleccionar las columnas state, county
# y poverty del conjunto de datos counties;
# en el mismo paso, renombrar la columna poverty como poverty_rate.

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties %>%
  # Select state, county, and poverty as poverty_rate
  select(state, county, poverty_rate = poverty)

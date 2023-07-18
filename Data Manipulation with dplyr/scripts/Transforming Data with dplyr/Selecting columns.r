# cargamos el .rds
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

# Seleccionamos las columnas que nos interesan
counties |>
  select(state, county, population, poverty)

# Seleccionar las columnas state, county, population,
# y todas aquellas que terminen con work.
# Filtrar solo los condados donde al menos el 50%
# de la población está empleada en trabajo público.

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties %>%
    # Select the state, county, population, and those ending with "work"
    select(state, county, population, ends_with("work")) %>%
# Filter for counties that have at least 50% of people engaged in public work
    filter(public_work >= 50)

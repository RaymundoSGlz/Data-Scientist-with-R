# Agregue un verbo para ordenar las observaciones
# de la variable public_work en orden descendente.

# cargamos el .rds
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

counties_selected %>%
  # Add a verb to sort in descending order of public_work
    arrange(desc(public_work))

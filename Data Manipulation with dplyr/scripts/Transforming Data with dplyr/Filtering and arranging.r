# Filtrar los condados en el estado de Texas
# que tienen más de diez mil personas (10000),
# y ordenarlos en orden descendente
# del porcentaje de personas empleadas en trabajo privado.

# cargamos el .rds
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

# Filter for Texas and more than 10000 people;
# sort in descending order of private_work
counties_selected %>%
  # Filter for Texas and more than 10000 people
  filter(state == "Texas", population > 10000) %>%
  # Sort in descending order of private_work
    arrange(desc(private_work))

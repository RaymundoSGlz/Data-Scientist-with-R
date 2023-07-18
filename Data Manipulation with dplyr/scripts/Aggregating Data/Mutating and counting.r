# Utilice mutate() para calcular y agregar una columna llamada population_walk,
# que contenga el número total de personas que caminan al trabajo en un condado.

# Use count() (ponderado y ordenado) para encontrar
# el número total de personas que caminan al trabajo en cada estado.

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
    select(county, region, state, population, walk)

counties_selected %>%
  # Add population_walk containing the total number of people who walk to work 
    mutate(population_walk = population * walk / 100) %>%
  # Count weighted by the new column, sort in descending order
    count(state, wt = population_walk, sort = TRUE)

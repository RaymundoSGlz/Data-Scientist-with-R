# Para cada combinación de estado y área metropolitana,
# encuentra la población total como total_pop.

# Extrae la fila más poblada de cada estado,
# que será ya sea Metro o Nonmetro.

# Desagrupa, luego cuenta cuántas veces aparece Metro o Nonmetro
# para ver cuántos estados tienen más personas viviendo en esas áreas.

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
  select(state, metro, population)

counties_selected %>%
  # Find the total population for each combination of state and metro
    group_by(state, metro) %>%
    summarize(total_pop = sum(population)) %>%
      # Extract the most populated row for each state
    slice_max(total_pop, n = 1) %>%
  # Count the states with more people in Metro or Nonmetro areas
    ungroup() %>%
    count(metro)

# Agrupar los datos por estado,
# y resumir para crear las columnas
# total_area (con el área total en millas cuadradas)
# y total_population (con la población total).

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
    select(state, county, population, land_area)

counties_selected %>%
    # Group by state
    group_by(state) %>%
    # Find the total area and population
    summarize(
        total_area = sum(land_area),
        total_population = sum(population)
    ) |>
# Agregar una columna de densidad con las personas por milla cuadrada,
# luego organizar en orden descendente.
    mutate(density = total_population / total_area) %>%
    arrange(desc(density))

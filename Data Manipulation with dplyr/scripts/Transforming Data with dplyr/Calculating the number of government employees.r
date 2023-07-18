# Use mutate() para agregar una columna llamada public_workers
# al conjunto de datos, con el número de personas empleadas
# en trabajo público (gubernamental).

# Carga el archivo de datos
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
  select(state, county, population, public_work)

counties_selected %>%
  # Add a new column public_workers with the number
  # of people employed in public work
    mutate(public_workers = public_work / 100 * population) |>
    # Ordenamos la columna public_workers en orden descendente
    arrange(desc(public_workers))

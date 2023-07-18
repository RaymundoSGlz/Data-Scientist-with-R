# Resumir el conjunto de datos de condados
# para encontrar las siguientes columnas:
# min_población (con la población más pequeña),
# max_desempleo (con el desempleo máximo),
# y ingreso_promedio (con la media de la variable de ingresos).

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
  select(county, population, income, unemployment)

counties_selected %>%
  # Summarize to find minimum population,
  # maximum unemployment, and average income
    summarize(min_population = min(population),
                max_unemployment = max(unemployment),
                average_income = mean(income))

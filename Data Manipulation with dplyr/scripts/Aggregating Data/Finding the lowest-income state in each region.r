# Calcular el ingreso promedio (como average_income)
# de los condados dentro de cada región y estado
# (nota que el group_by() ya ha sido hecho por ti).
# Encontrar el estado con el average_income más bajo en cada región.

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties_selected <- counties %>%
    select(region, state, county, population, income)

counties_selected %>%
    group_by(region, state) %>%
    # Calculate average income
    summarize(average_income = mean(income)) %>%
    # Find the lowest income state in each region
    slice_min(average_income, n = 1)

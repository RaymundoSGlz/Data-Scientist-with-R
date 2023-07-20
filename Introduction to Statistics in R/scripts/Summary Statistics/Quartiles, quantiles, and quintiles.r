# Calcular los cuartiles de la columna co2_emission
# de la tabla food_consumption.

# cargar la tabla food_consumption
library(dplyr)
library(readr)
food_consumption <- read_rds("data/food_consumption.rds")

# Calculate the quartiles of co2_emission
quantile(food_consumption$co2_emission)

# Calcular los seis cuantiles que dividen los datos en 5 piezas
# (quintiles) de la columna co2_emission de food_consumption.
quantile(food_consumption$co2_emission, probs = seq(0, 1, 0.2))

# Calcular los once cuantiles de co2_emission
# que dividen los datos en 10 piezas (deciles).
quantile(food_consumption$co2_emission, probs = seq(0, 1, 0.1))

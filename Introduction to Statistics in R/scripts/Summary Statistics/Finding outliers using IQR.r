# Calcular la emisión total de co2 por país agrupando por país
# y tomando la suma de co2_emission. Llame a la suma total_emission
# y almacene el marco de datos resultante como emissions_by_country.

# Cargamos la tabla
library(dplyr)
library(readr)
library(ggplot2)
food_consumption <- read_rds("data/food_consumption.rds")

# Calculate total co2_emission per country: emissions_by_country
emissions_by_country <- food_consumption %>%
    group_by(country) %>%
    summarize(total_emission = sum(co2_emission))

emissions_by_country

# Calcular el primer y tercer cuartil de total_emission
# y almacenarlos como q1 y q3.
# Calcular el rango intercuartil de total_emission y almacenarlo como iqr.

# Compute the first and third quartiles and IQR of total_emission
q1 <- quantile(emissions_by_country$total_emission, 0.25)
q3 <- quantile(emissions_by_country$total_emission, 0.75)
iqr <- q3 - q1

# Calcular los límites inferior y superior para los valores atípicos
# de total_emission, y almacenarlos como lower y upper.

# Calculate the lower and upper cutoffs for outliers
lower <- q1 - 1.5 * iqr
upper <- q3 + 1.5 * iqr

# Use filter() para obtener países con un total_emission
# mayor que el límite superior o un total_emission menor que el límite inferior.

# Filter emissions_by_country to find outliers
emissions_by_country %>%
    filter(total_emission < lower | total_emission > upper)

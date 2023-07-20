# Calcular la varianza y la desviación estándar de co2_emission
# para cada food_category agrupada y resumiendo
# la varianza como var_co2 y la desviación estándar como sd_co2.
# Crear un histograma de co2_emission para cada food_category
# usando facet_wrap().

# cargar la tabla food_consumption
library(dplyr)
library(readr)
library(ggplot2)
food_consumption <- read_rds("data/food_consumption.rds")

# Calculate variance and sd of co2_emission for each food_category
food_consumption %>%
    group_by(food_category) %>%
    summarize(
        var_co2 = var(co2_emission),
        sd_co2 = sd(co2_emission)
    )

# Plot food_consumption with co2_emission on x-axis
ggplot(food_consumption, aes(x = co2_emission)) +
    # Create a histogram
    geom_histogram() +
    # Create a separate sub-graph for each food_category
    facet_wrap(~food_category)

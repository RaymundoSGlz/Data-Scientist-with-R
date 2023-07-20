# Filtrar food_consumption para obtener las filas donde food_category es "rice".
# Crear un histograma usando ggplot2 de co2_emission para rice.

# Cargamos el dataset
library(dplyr)
library(ggplot2)
library(readr)
food_consumption <- read_rds("data/food_consumption.rds")

food_consumption |>
  filter(food_category == "rice") |>
  ggplot(aes(x = co2_emission)) +
  geom_histogram()

# Filtrar food_consumption para obtener las filas donde food_category es "rice".
# Resumir los datos para obtener la media y la mediana de co2_emission,
# llamándolos mean_co2 y median_co2.

food_consumption %>%
  # Filter for rice food category
  filter(food_category == "rice") %>%
  # Get mean_co2 and median_co2
  summarize(
    mean_co2 = mean(co2_emission, na.rm = TRUE),
    median_co2 = median(co2_emission, na.rm = TRUE)
  )

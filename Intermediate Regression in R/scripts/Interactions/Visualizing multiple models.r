library(dplyr)
library(ggplot2)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

taiwan_0_to_15 <- taiwan_real_estate %>%
  filter(house_age_years == "0 to 15")

taiwan_15_to_30 <- taiwan_real_estate %>%
  filter(house_age_years == "15 to 30")

taiwan_30_to_45 <- taiwan_real_estate %>%
  filter(house_age_years == "30 to 45")

mdl_0_to_15 <- lm(price_twd_msq ~ n_convenience, data = taiwan_0_to_15)

mdl_15_to_30 <- lm(price_twd_msq ~ n_convenience, data = taiwan_15_to_30)

mdl_30_to_45 <- lm(price_twd_msq ~ n_convenience, data = taiwan_30_to_45)

explanatory_data <- tibble(
  n_convenience = seq(0, 10, by = 1)
)

prediction_data_0_to_15 <- explanatory_data %>%
  mutate(price_twd_msq = predict(mdl_0_to_15, explanatory_data))

prediction_data_15_to_30 <- explanatory_data %>%
  mutate(price_twd_msq = predict(mdl_15_to_30, explanatory_data))

prediction_data_30_to_45 <- explanatory_data %>%
  mutate(price_twd_msq = predict(mdl_30_to_45, explanatory_data))

# 1. Usando `taiwan_real_estate`, traza `price_twd_msq` versus `n_convenience`
## coloreado por `house_age_years`.
#   - Añade una capa de puntos.
#   - Añade líneas de tendencia suaves para cada color utilizando
## el método de regresión lineal y apagando la cinta de error estándar.

# Using taiwan_real_estate, plot price vs. no. of conv. stores
## colored by house age
ggplot(
  taiwan_real_estate,
  aes(x = n_convenience, y = price_twd_msq, color = house_age_years)
) +
  # Make it a scatter plot
  geom_point() +
  # Add smooth linear regression trend lines, no ribbon
  geom_smooth(method = "lm", se = FALSE)

# 2. Extiende la trama añadiendo los puntos de predicción de
## `prediction_data_0_to_15`. Coloréelos de rojo, con tamaño 3 y forma 15.
#   - Añade puntos de predicción de `prediction_data_15_to_30`,
## coloreados de verde, tamaño 3 y forma 15.
#   - Añade puntos de predicción de `prediction_data_30_to_45`,
## coloreados de azul, tamaño 3 y forma 15.

# Extend the plot to include prediction points
ggplot(
  taiwan_real_estate,
  aes(n_convenience, price_twd_msq, color = house_age_years)
) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  # Add points using prediction_data_0_to_15, colored red, size 3, shape 15
  geom_point(
    data = prediction_data_0_to_15,
    color = "red", size = 3, shape = 15
  ) +
  # Add points using prediction_data_15_to_30, colored green, size 3, shape 15
  geom_point(
    data = prediction_data_15_to_30,
    color = "green", size = 3, shape = 15
  ) +
  # Add points using prediction_data_30_to_45, colored blue, size 3, shape 15
  geom_point(
    data = prediction_data_30_to_45,
    color = "blue", size = 3, shape = 15
  )

library(dplyr)
library(tidyr)
library(ggplot2)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

# 1. Ajusta una regresión lineal del precio de la casa versus
## el número de tiendas de conveniencia y
## la raíz cuadrada de la distancia a las estaciones de MRT más cercanas,
## *con* una interacción, utilizando el conjunto de datos `taiwan_real_estate`.

# Fit a linear regression of price vs. no. of conv. stores
## and sqrt dist. to nearest MRT, with interaction
mdl_price_vs_conv_dist <- lm(
  price_twd_msq ~ n_convenience * sqrt(dist_to_mrt_m),
  data = taiwan_real_estate
)

# See the result
mdl_price_vs_conv_dist

# 2. Crea una cuadrícula expandida de variables explicativas
## con el número de tiendas de conveniencia de 0 a 10 y
## la distancia a la estación de MRT más cercana como una secuencia de 0 a 80
## en pasos de 10, todo al cuadrado (0, 100, 400, ..., 6400).
## Asigna a `explanatory_data`.
#   - Agrega una columna de predicciones a `explanatory_data` usando
## `mdl_price_vs_conv_dist` y `explanatory_data`. Asigna a `prediction_data`.

# Create expanded grid of explanatory variables with no. of conv. stores
# and  dist. to nearest MRT
explanatory_data <- expand_grid(
  n_convenience = seq(0, 10, by = 1),
  dist_to_mrt_m = (seq(0, 80, by = 10))^2
)

# Add predictions using mdl_price_vs_conv_dist and explanatory_data
prediction_data <- explanatory_data %>%
  mutate(
    price_twd_msq = predict(mdl_price_vs_conv_dist, newdata = .)
  )

# See the result
prediction_data

# 3. Extiende el gráfico para agregar una capa de puntos utilizando
## los datos de predicción, coloreados de amarillo, con tamaño 3.

# Add predictions to plot
ggplot(
  taiwan_real_estate,
  aes(n_convenience, sqrt(dist_to_mrt_m), color = price_twd_msq)
) +
  geom_point() +
  scale_color_viridis_c(option = "plasma") +
  # Add prediction points colored yellow, size 3
  geom_point(
    data = prediction_data,
    size = 3,
    color = "yellow"
  )

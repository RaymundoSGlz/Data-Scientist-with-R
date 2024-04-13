library(ggplot2)
library(dplyr)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")

# 1. *Ejecuta el código proporcionado y mira el gráfico.*
# Edita el gráfico para que la estética del eje x se transforme en raíz cuadrada
##  - *Mira el nuevo gráfico. Observa cómo han cambiado los números en el eje x.
## Esta es una línea diferente a la que se mostró antes.
## ¿Los puntos siguen la línea más de cerca?*

# Run the code to see the plot
# Edit so x-axis is square root of dist_to_mrt_m
ggplot(taiwan_real_estate, aes(sqrt(dist_to_mrt_m), price_twd_msq)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# 2. Ejecuta una regresión lineal de `price_twd_msq` versus
## la raíz cuadrada de `dist_to_mrt_m` usando `taiwan_real_estate`.

# Run a linear regression of price_twd_msq vs. square root of dist_to_mrt_m
## using taiwan_real_estate
mdl_price_vs_dist <- lm(
  price_twd_msq ~ sqrt(dist_to_mrt_m),
  data = taiwan_real_estate
)

# See the result
mdl_price_vs_dist

# 3. Crea un marco de datos de predicción llamado `prediction_data`.
## Comienza con `explanatory_data`,
## y agrega una columna nombrada después de la variable de respuesta.
## Predice valores usando `mdl_price_vs_dist` y `explanatory_data`.

explanatory_data <- tibble(
  dist_to_mrt_m = seq(0, 80, 10) ^ 2
)

# Use mdl_price_vs_dist to predict explanatory_data
prediction_data <- explanatory_data %>%
  mutate(
    price_twd_msq = predict(mdl_price_vs_dist, explanatory_data)
  )

# See the result
prediction_data

# 4. Edita el gráfico para agregar una capa de puntos desde `prediction_data`,
## de color `"green"`, tamaño `5`.

ggplot(taiwan_real_estate, aes(sqrt(dist_to_mrt_m), price_twd_msq)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  # Add points from prediction_data, colored green, size 5
  geom_point(data = prediction_data, color = "green", size = 5)
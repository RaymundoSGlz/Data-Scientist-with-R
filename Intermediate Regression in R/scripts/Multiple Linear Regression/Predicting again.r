library(dplyr)
library(tidyr)
library(ggplot2)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

mdl_price_vs_all_3_way_inter <- lm(
  price_twd_msq ~ n_convenience * sqrt(dist_to_mrt_m) * house_age_years + 0,
  data = taiwan_real_estate
)

# 1. Haga una cuadrícula de datos explicativos,
## formada por combinaciones de las siguientes variables.
#   - `dist_to_mrt_m` debe tomar una secuencia de cero a ochenta
## en pasos de diez, todos al cuadrado (0, 100, 400, ..., 6400).
#   - `n_convenience` debe tomar los números del cero al diez.
#   - `house_age_years` debe tomar los valores únicos de la columna
## `house_age_years` de `taiwan_real_estate`.

# Make a grid of explanatory data
explanatory_data <- expand_grid(
  # Set dist_to_mrt_m a seq from 0 to 80 by 10s, squared
  dist_to_mrt_m = seq(0, 80, 10)^2,
  # Set n_convenience to 0 to 10
  n_convenience = seq(0, 10),
  # Set house_age_years to the unique values of that variable
  house_age_years = unique(taiwan_real_estate$house_age_years)
)

# See the result
explanatory_data

# 2. Agregue una columna a los `explanatory_data`,
## asignando a `prediction_data`.
#   - La columna debe llevar el nombre de la variable de respuesta,
## y contener predicciones hechas usando `mdl_price_vs_all_3_way_inter`
## y `explanatory_data`.

# Add predictions to the data frame
prediction_data <- explanatory_data %>%
  mutate(
    price_twd_msq = predict(mdl_price_vs_all_3_way_inter, newdata = .)
  )

# See the result
prediction_data

# 3. Amplíe el gráfico para incluir predicciones como puntos de
## `prediction_data`, con tamaño 3 y forma 15.
#   - *Mire el gráfico. ¿Qué le dicen los puntos de predicción?*

# Extend the plot
ggplot(
  taiwan_real_estate,
  aes(sqrt(dist_to_mrt_m), n_convenience, color = price_twd_msq)
) +
  geom_point() +
  scale_color_viridis_c(option = "plasma") +
  facet_wrap(vars(house_age_years)) +
  # Add points from prediction data, size 3, shape 15
  geom_point(
    data = prediction_data,
    size = 3, shape = 15
  )

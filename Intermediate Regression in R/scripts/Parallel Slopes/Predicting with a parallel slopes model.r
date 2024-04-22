library(dplyr)
library(tidyr)
library(ggplot2)
library(moderndive)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")
mdl_price_vs_both <- lm(
  price_twd_msq ~ n_convenience + house_age_years + 0,
  data = taiwan_real_estate
)

# 1. Haz una cuadrícula de datos explicativos,
## formada a partir de combinaciones de las siguientes variables.
#   - `n_convenience` debe tomar los números del cero al diez.
#   - `house_age_years` debe tomar los valores únicos
##   de la columna `house_age_years` de `taiwan_real_estate`.

# Make a grid of explanatory data
explanatory_data <- expand_grid(
  # Set n_convenience to zero to ten
  n_convenience = 0:10,
  # Set house_age_years to the unique values of that variable
  house_age_years = unique(taiwan_real_estate$house_age_years)
)

# See the result
explanatory_data

# 2. Añade una columna a los `explanatory_data`
## nombrada para la variable de respuesta, asignándola a `prediction_data`.
#   - La columna de respuesta contiene predicciones realizadas
##   utilizando `mdl_price_vs_both` y `explanatory_data`.

prediction_data <- explanatory_data %>%
  mutate(
    price_twd_msq = predict(mdl_price_vs_both, explanatory_data)
  )

# See the result
prediction_data

# 3. Actualiza el gráfico para añadir una capa de puntos de predicciones.
## Utiliza los `prediction_data`,
## establece el tamaño del punto a 5 y la forma del punto a 15.
# Add predictions to the data frame

taiwan_real_estate %>%
  ggplot(aes(n_convenience, price_twd_msq, color = house_age_years)) +
  geom_point() +
  geom_parallel_slopes(se = FALSE) +
  # Add points using prediction_data, with size 5 and shape 15
  geom_point(data = prediction_data, size = 5, shape = 15)

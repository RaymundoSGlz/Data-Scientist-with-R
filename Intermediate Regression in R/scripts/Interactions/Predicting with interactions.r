library(dplyr)
library(tidyr)
library(ggplot2)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

mdl_price_vs_both_inter <- lm(
  price_twd_msq ~
    house_age_years + n_convenience:house_age_years + 0,
  data = taiwan_real_estate
)

# 1. Haga una cuadrícula de datos explicativos,
## formada a partir de combinaciones de las siguientes variables.
#   - `n_convenience` debería tomar los números del cero al diez.
#   - `house_age_years` debería tomar los valores únicos de la columna
## `house_age_years` de `taiwan_real_estate`.

# Make a grid of explanatory data
explanatory_data <- expand_grid(
  # Set n_convenience to zero to ten
  n_convenience = seq(0, 10, by = 1),
  # Set house_age_years to the unique values of that variable
  house_age_years = unique(taiwan_real_estate$house_age_years)
)

# See the result
explanatory_data

# 2. Añada una columna a los `explanatory_data`,
## asignándola a `prediction_data`.
#   - La columna debería llevar el nombre de la variable de respuesta,
## y contener las predicciones realizadas utilizando `mdl_price_vs_both_inter`
## y `explanatory_data`.

# Add predictions to the data frame
prediction_data <- explanatory_data %>%
  mutate(
    # Predict the price
    price_twd_msq = predict(mdl_price_vs_both_inter, explanatory_data)
  )

# See the result
prediction_data

# 3. Usando `taiwan_real_estate`, trace `price_twd_msq` versus
## `n_convenience`, coloreado por `house_age_years`.
#   - Añada una capa de puntos.
#   - Añada líneas de tendencia suaves usando regresión lineal,
## sin cinta de error estándar.
#   - Añada otra capa de puntos usando `prediction_data`,
## con `size` `5` y `shape` `15`.

# Using taiwan_real_estate, plot price vs. no. of convenience stores,
## colored by house age
ggplot(
  taiwan_real_estate,
  aes(n_convenience, price_twd_msq, color = house_age_years)
) +
  # Make it a scatter plot
  geom_point() +
  # Add linear regression trend lines, no ribbon
  geom_smooth(method = "lm", se = FALSE) +
  # Add points from prediction_data, size 5, shape 15
  geom_point(
    data = prediction_data,
    size = 5,
    shape = 15
  )

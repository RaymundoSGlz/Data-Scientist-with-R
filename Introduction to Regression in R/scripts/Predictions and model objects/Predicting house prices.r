library(dplyr)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")
mdl_price_vs_conv <- lm(
  price_twd_msq ~ n_convenience,
  data = taiwan_real_estate
)

# 1. Crea un tibble de datos explicativos,
## donde el número de tiendas de conveniencia, `n_convenience`,
## toma los valores enteros del cero al diez.

# Create a tibble with n_convenience column from zero to ten
explanatory_data <- tibble(
  n_convenience = 0:10
)

# 2. Utiliza el modelo `mdl_price_vs_conv` para hacer predicciones
## a partir de `explanatory_data`.

# Use mdl_price_vs_conv to predict with explanatory_data
predict(mdl_price_vs_conv, explanatory_data)

# 3. Crea un tibble de predicciones llamado `prediction_data`.
#   - Comienza con `explanatory_data`.
#   - Añade una columna extra, `price_twd_msq`, que contenga las predicciones.

# Edit this, so predictions are stored in prediction_data
prediction_data <- explanatory_data %>%
  mutate(
    price_twd_msq = predict(
      mdl_price_vs_conv, explanatory_data
    )
  )

# See the result
prediction_data

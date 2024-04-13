library(broom)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")
mdl_price_vs_conv <- lm(
  price_twd_msq ~ n_convenience,
  data = taiwan_real_estate
)
# 1. Ordena el modelo para imprimir los elementos a nivel de coeficiente
## de `mdl_price_vs_conv`.
# 2. Aumenta el modelo para imprimir los elementos a nivel de observación
## de `mdl_price_vs_conv`.
# 3. Echa un vistazo al modelo para imprimir los elementos a nivel de modelo
## de `mdl_price_vs_conv`.

# Get the coefficient-level elements of the model
tidy(mdl_price_vs_conv)

# Get the observation-level elements of the model
augment(mdl_price_vs_conv)

# Get the model-level elements of the model
glance(mdl_price_vs_conv)
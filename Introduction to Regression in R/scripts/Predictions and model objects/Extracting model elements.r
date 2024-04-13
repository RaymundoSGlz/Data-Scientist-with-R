library(dplyr)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")
mdl_price_vs_conv <- lm(
  price_twd_msq ~ n_convenience,
  data = taiwan_real_estate
)

# 1. Imprime los coeficientes de `mdl_price_vs_conv`.
# 2. Imprime los valores ajustados de `mdl_price_vs_conv`.
# 3. Imprime los residuos de `mdl_price_vs_conv`.
# 4. Imprime un resumen de `mdl_price_vs_conv`.

# Get the model coefficients of mdl_price_vs_conv
coefficients(mdl_price_vs_conv)

# Get the fitted values of mdl_price_vs_conv
fitted(mdl_price_vs_conv)

# Get the residuals of mdl_price_vs_conv
residuals(mdl_price_vs_conv)

# Print a summary of mdl_price_vs_conv
summary(mdl_price_vs_conv)
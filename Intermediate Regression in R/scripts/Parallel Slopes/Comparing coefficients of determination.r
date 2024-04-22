library(dplyr)
library(broom)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")
mdl_price_vs_age <- lm(
  price_twd_msq ~ house_age_years + 0,
  data = taiwan_real_estate
)
mdl_price_vs_conv <- lm(
  price_twd_msq ~ n_convenience,
  data = taiwan_real_estate
)
mdl_price_vs_both <- lm(
  price_twd_msq ~ n_convenience + house_age_years + 0,
  data = taiwan_real_estate
)

# 1. Obtén los coeficientes de determinación ajustados y no ajustados
## para `mdl_price_vs_conv` echando un vistazo al modelo,
## luego seleccionando los valores `r.squared` y `adj.r.squared`.
#   - Haz lo mismo para `mdl_price_vs_age` y `mdl_price_vs_both`.

mdl_price_vs_conv %>%
  # Get the model-level coefficients
  glance() %>%
  # Select the coeffs of determination
  select(r.squared, adj.r.squared)

# Get the coeffs of determination for mdl_price_vs_age
mdl_price_vs_age %>%
  glance() %>%
  select(r.squared, adj.r.squared)

# Get the coeffs of determination for mdl_price_vs_both
mdl_price_vs_both %>%
  glance() %>%
  select(r.squared, adj.r.squared)

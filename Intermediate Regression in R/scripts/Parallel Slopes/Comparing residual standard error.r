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

# 1. Obtén el error estándar residual para `mdl_price_vs_conv`
## echando un vistazo al modelo, luego extrae el valor `sigma`.
#   - Haz lo mismo para `mdl_price_vs_age`.
#   - Haz lo mismo para `mdl_price_vs_both`.

mdl_price_vs_conv %>%
  # Get the model-level coefficients
  glance() %>%
  # Pull out the RSE
  pull(sigma)

# Get the RSE for mdl_price_vs_age
mdl_price_vs_age %>%
  glance() %>%
  pull(sigma)

# Get the RSE for mdl_price_vs_both
mdl_price_vs_both %>%
  glance() %>%
  pull(sigma)

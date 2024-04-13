library(dplyr)
library(broom)
library(fst)
ad_conversion <- read_fst("data/ad_conversion.fst")
mdl_click_vs_impression_orig <- lm(
  n_clicks ~ n_impressions,
  data = ad_conversion
)
mdl_click_vs_impression_trans <- lm(
  I(n_clicks^0.25) ~ I(n_impressions^0.25),
  data = ad_conversion
)

# 1. Imprima un resumen de `mdl_click_vs_impression_orig`.
## Haga lo mismo para `mdl_click_vs_impression_trans`.

# Print a summary of mdl_click_vs_impression_orig
summary(mdl_click_vs_impression_orig)

# Print a summary of mdl_click_vs_impression_trans
summary(mdl_click_vs_impression_trans)

# 2. Obtenga el coeficiente de determinación para `mdl_click_vs_impression_orig`
## mirando el modelo, luego extrayendo el valor `r.squared`.
#  - Haga lo mismo para `mdl_click_vs_impression_trans`.

# Get coeff of determination for mdl_click_vs_impression_orig
mdl_click_vs_impression_orig %>%
  # Get the model-level details
  glance() %>%
  # Pull out r.squared
  pull(r.squared)

# Do the same for the transformed model
mdl_click_vs_impression_trans %>%
  glance() %>%
  pull(r.squared)
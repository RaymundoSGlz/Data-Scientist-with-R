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

# Get RSE for mdl_click_vs_impression_orig
mdl_click_vs_impression_orig %>%
  # Get the model-level details
  glance() %>%
  # Pull out sigma
  pull(sigma)

# Do the same for the transformed model
mdl_click_vs_impression_trans %>%
  glance() %>%
  pull(sigma)
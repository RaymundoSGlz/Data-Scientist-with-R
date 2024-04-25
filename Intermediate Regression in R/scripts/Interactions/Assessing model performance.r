library(dplyr)
library(ggplot2)
library(broom)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

taiwan_0_to_15 <- taiwan_real_estate %>%
  filter(house_age_years == "0 to 15")

taiwan_15_to_30 <- taiwan_real_estate %>%
  filter(house_age_years == "15 to 30")

taiwan_30_to_45 <- taiwan_real_estate %>%
  filter(house_age_years == "30 to 45")

mdl_all_ages <- lm(price_twd_msq ~ n_convenience, data = taiwan_real_estate)

mdl_0_to_15 <- lm(price_twd_msq ~ n_convenience, data = taiwan_0_to_15)

mdl_15_to_30 <- lm(price_twd_msq ~ n_convenience, data = taiwan_15_to_30)

mdl_30_to_45 <- lm(price_twd_msq ~ n_convenience, data = taiwan_30_to_45)

# 1. Obtén el coeficiente de determinación para `mdl_all_ages`,
## `mdl_0_to_15`, `mdl_15_to_30`, y `mdl_30_to_45`.

# Get the coeff. of determination for mdl_all_ages
mdl_all_ages %>%
  glance() %>%
  pull(r.squared)

# Get the coeff. of determination for mdl_0_to_15
mdl_0_to_15 %>%
  glance() %>%
  pull(r.squared)

# Get the coeff. of determination for mdl_15_to_30
mdl_15_to_30 %>%
  glance() %>%
  pull(r.squared)

# Get the coeff. of determination for mdl_30_to_45
mdl_30_to_45 %>%
  glance() %>%
  pull(r.squared)

# 2. Obtén el error estándar residual para `mdl_all_ages`, `mdl_0_to_15`,
## `mdl_15_to_30`, y `mdl_30_to_45`.

# Get the RSE for mdl_all
mdl_all_ages %>%
  glance() %>%
  pull(sigma)

# Get the RSE for mdl_0_to_15
mdl_0_to_15 %>%
  glance() %>%
  pull(sigma)

# Get the RSE for mdl_15_to_30
mdl_15_to_30 %>%
  glance() %>%
  pull(sigma)

# Get the RSE for mdl_30_to_45
mdl_30_to_45 %>%
  glance() %>%
  pull(sigma)

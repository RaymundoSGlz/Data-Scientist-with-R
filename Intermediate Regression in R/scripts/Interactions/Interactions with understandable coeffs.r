library(dplyr)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

taiwan_0_to_15 <- taiwan_real_estate %>%
  filter(house_age_years == "0 to 15")

taiwan_15_to_30 <- taiwan_real_estate %>%
  filter(house_age_years == "15 to 30")

taiwan_30_to_45 <- taiwan_real_estate %>%
  filter(house_age_years == "30 to 45")

mdl_0_to_15 <- lm(price_twd_msq ~ n_convenience, data = taiwan_0_to_15)

mdl_15_to_30 <- lm(price_twd_msq ~ n_convenience, data = taiwan_15_to_30)

mdl_30_to_45 <- lm(price_twd_msq ~ n_convenience, data = taiwan_30_to_45)

# 1. Ajusta una regresión lineal de `price_twd_msq` versus `house_age_years`
## más una interacción entre `n_convenience` y `house_age_years`,
## y sin intercepción global,
## utilizando el conjunto de datos `taiwan_real_estate`.
#  - Para comparación, obtén los coeficientes para los tres modelos
## para cada categoría: `mdl_0_to_15`, `mdl_15_to_30`, y `mdl_30_to_45`.

# Model price vs. house age plus an interaction, no intercept
mdl_readable_inter <- lm(
  price_twd_msq ~
    house_age_years + n_convenience:house_age_years + 0,
  data = taiwan_real_estate
)

# See the result
mdl_readable_inter

# Get coefficients for mdl_0_to_15
coefficients(mdl_0_to_15)

# Get coefficients for mdl_15_to_30
coefficients(mdl_15_to_30)

# Get coefficients for mdl_30_to_45
coefficients(mdl_30_to_45)
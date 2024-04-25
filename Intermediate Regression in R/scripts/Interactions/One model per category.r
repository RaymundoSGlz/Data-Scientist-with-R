library(dplyr)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

# 1. Filtra `taiwan_real_estate` para las filas donde `house_age_years` es
## `"0 to 15"`, asignándolo a `taiwan_0_to_15`.
# - Repite esto para las categorías de edad de la casa `"15 to 30"` y
## `"30 to 45"`.

# Filter for rows where house age is 0 to 15 years
taiwan_0_to_15 <- taiwan_real_estate %>%
  filter(house_age_years == "0 to 15")

# Filter for rows where house age is 15 to 30 years
taiwan_15_to_30 <- taiwan_real_estate %>%
  filter(house_age_years == "15 to 30")


# Filter for rows where house age is 30 to 45 years
taiwan_30_to_45 <- taiwan_real_estate %>%
  filter(house_age_years == "30 to 45")

# 2. Ejecuta una regresión lineal de `price_twd_msq` versus `n_convenience`
## usando el conjunto de datos `taiwan_0_to_15`.
# - Repite esto para `taiwan_15_to_30` y `taiwan_30_to_45`.

# Model price vs. no. convenience stores using 0 to 15 data
mdl_0_to_15 <- lm(price_twd_msq ~ n_convenience, data = taiwan_0_to_15)

# Model price vs. no. convenience stores using 15 to 30 data
mdl_15_to_30 <- lm(price_twd_msq ~ n_convenience, data = taiwan_15_to_30)

# Model price vs. no. convenience stores using 30 to 45 data
mdl_30_to_45 <- lm(price_twd_msq ~ n_convenience, data = taiwan_30_to_45)

# See the results
mdl_0_to_15
mdl_15_to_30
mdl_30_to_45

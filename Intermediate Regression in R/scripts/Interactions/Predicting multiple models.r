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

# 1. Crea un tibble de datos explicativos, estableciendo `n_convenience`
## en un vector de cero a diez, asignando a `explanatory_data_0_to_15`.

# Create a tibble of explanatory data, setting no. of conv stores to 0 to 10
explanatory_data <- tibble(
  n_convenience = seq(0, 10, by = 1)
)

# 2. Agrega una columna de predicciones llamada `price_twd_msq`
## a `explanatory_data`, usando `mdl_0_to_15` y `explanatory_data`.
## Asigna a `prediction_data_0_to_15`.
#  - Repite esto para las categorías de edad de la casa de
## 15 a 30 años y de 30 a 45 años.

# Add column of predictions using "0 to 15" model and explanatory data
prediction_data_0_to_15 <- explanatory_data %>%
  mutate(price_twd_msq = predict(mdl_0_to_15, explanatory_data))

# Same again, with "15 to 30"
prediction_data_15_to_30 <- explanatory_data %>%
  mutate(price_twd_msq = predict(mdl_15_to_30, explanatory_data))

# Same again, with "30 to 45"
prediction_data_30_to_45 <- explanatory_data %>%
  mutate(price_twd_msq = predict(mdl_30_to_45, explanatory_data))

library(dplyr)
library(tidyr)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

mdl_price_vs_both_inter <- lm(
  price_twd_msq ~
    house_age_years + n_convenience:house_age_years + 0,
  data = taiwan_real_estate
)

explanatory_data <- expand_grid(
  n_convenience = seq(0, 10, by = 1),
  house_age_years = unique(taiwan_real_estate$house_age_years)
)

# 1.Obtén los coeficientes de `mdl_price_vs_both_inter`, asignándolos a `coeffs`
#   - Obtén los tres coeficientes de intercepción de `coeffs`,
## asignándolos a `intercept_0_15`, `intercept_15_30` y `intercept_30_45`.
#   - Obtén los tres coeficientes de pendiente de `coeffs`,
## asignándolos a `slope_0_15`, `slope_15_30` y `slope_30_45`.

# Get the coefficients from mdl_price_vs_both_inter
coeffs <- coefficients(mdl_price_vs_both_inter)

# Get the intercept for 0 to 15 year age group
intercept_0_15 <- coeffs[1]

# Get the intercept for 15 to 30 year age group
intercept_15_30 <- coeffs[2]

# Get the intercept for 30 to 45 year age group
intercept_30_45 <- coeffs[3]

# Get the slope for 0 to 15 year age group
slope_0_15 <- coeffs[4]

# Get the slope for 15 to 30 year age group
slope_15_30 <- coeffs[5]

# Get the slope for 30 to 45 year age group
slope_30_45 <- coeffs[6]

# 2. Añade una columna `price_twd_msq` a `explanatory_data`
## que contenga las predicciones.
#   - En el caso de que `house_age_years` sea `"0 to 15"`,
## elige la intercepción apropiada más la pendiente apropiada
## multiplicada por el número de tiendas de conveniencia cercanas.
#   - Haz lo mismo para los casos en que la edad de la casa sea
## `"15 to 30"` y `"30 to 45"`.

prediction_data <- explanatory_data %>%
  mutate(
    # Consider the 3 cases to choose the price
    price_twd_msq = case_when(
      house_age_years == "0 to 15" ~
        intercept_0_15 + slope_0_15 * n_convenience,
      house_age_years == "15 to 30" ~
        intercept_15_30 + slope_15_30 * n_convenience,
      house_age_years == "30 to 45" ~
        intercept_30_45 + slope_30_45 * n_convenience
    )
  )

# See the result
prediction_data

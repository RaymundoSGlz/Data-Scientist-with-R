library(dplyr)
library(tidyr)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")
mdl_price_vs_both <- lm(
  price_twd_msq ~ n_convenience + house_age_years + 0,
  data = taiwan_real_estate
)
explanatory_data <- expand_grid(
  n_convenience = 0:10,
  house_age_years = unique(taiwan_real_estate$house_age_years)
)

# 1. Obtén los coeficientes de `mdl_price_vs_both`, asignándolos a `coeffs`.
#   - Asigna cada uno de los elementos de `coeffs` a la variable apropiada.

# Get the coefficients from mdl_price_vs_both
coeffs <- coefficients(mdl_price_vs_both)

# Extract the slope coefficient
slope <- coeffs[1]

# Extract the intercept coefficient for 0 to 15
intercept_0_15 <- coeffs[2]

# Extract the intercept coefficient for 15 to 30
intercept_15_30 <- coeffs[3]

# Extract the intercept coefficient for 30 to 45
intercept_30_45 <- coeffs[4]

# 2. Añade columnas a `explanatory_data`.
#   - Para elegir el `intercept`,
## en el caso de que `house_age_years` sea `"0 to 15"`, elige `intercept_0_15`.
## En el caso de que `house_age_years` sea `"15 to 30"`, elige `intercept_15_30`
## Haz lo mismo para `"30 to 45"`.
#   - Calcula manualmente las predicciones
## como la intersección más la pendiente veces `n_convenience`.
#   - Assign each of the elements of `coeffs` to the appropriate variable.

prediction_data <- explanatory_data %>%
  mutate(
    # Consider the 3 cases to choose the intercept
    intercept = case_when(
      house_age_years == "0 to 15" ~ intercept_0_15,
      house_age_years == "15 to 30" ~ intercept_15_30,
      house_age_years == "30 to 45" ~ intercept_30_45
    ),
    # Manually calculate the predictions
    price_twd_msq = intercept + slope * n_convenience
  )

# See the results
prediction_data

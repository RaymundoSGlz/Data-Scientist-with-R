library(dplyr)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")
mdl_price_vs_conv <- lm(
  price_twd_msq ~ n_convenience,
  data = taiwan_real_estate
)
explanatory_data <- tibble(
  n_convenience = 0:10
)
# - Obtén los coeficientes de `mdl_price_vs_conv`, asignándolos a `coeffs`.
# - Obtén la intersección, que es el primer elemento de `coeffs`,
## asignándola a `intercept`.
# - Obten la pendiente, que es el segundo elemento de `coeffs`,
## asignándola a `slope`.
# - Predice manualmente `price_twd_msq`
## usando la intersección, la pendiente y `n_convenience`.

# Get the coefficients of mdl_price_vs_conv
coeffs <- coefficients(mdl_price_vs_conv)

# Get the intercept
intercept <- coeffs[1]

# Get the slope
slope <- coeffs[2]

explanatory_data %>%
  mutate(
    # Manually calculate the predictions
    price_twd_msq = intercept + slope * n_convenience
  )

# Compare to the results from predict()
predict(mdl_price_vs_conv, explanatory_data)

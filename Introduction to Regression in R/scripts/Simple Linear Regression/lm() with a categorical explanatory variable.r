library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate.fst")

# 1.Ejecute una regresión lineal con `price_twd_msq` como variable de respuesta,
## `house_age_years` como variable explicativa y `taiwan_real_estate`
## como el conjunto de datos. Asigne a `mdl_price_vs_age`.

# Run a linear regression of price_twd_msq vs. house_age_years
mdl_price_vs_age <- lm(
  price_twd_msq ~ house_age_years,
  data = taiwan_real_estate
)

# See the result
mdl_price_vs_age

# 2.Actualice la fórmula del modelo para que no se incluya
# intercepción en el modelo. Asigne a `mdl_price_vs_age_no_intercept`.

# Update the model formula to remove the intercept
mdl_price_vs_age_no_intercept <- lm(
  price_twd_msq ~ house_age_years + 0,
  data = taiwan_real_estate
)

# See the result
mdl_price_vs_age_no_intercept

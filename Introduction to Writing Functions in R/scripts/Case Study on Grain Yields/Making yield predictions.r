library(mgcv)
library(dplyr)
corn <- readRDS("data/corn.rds")
wheat <- readRDS("data/wheat.rds")
run_gam_yield_vs_year_by_region <- function(data) {
  gam(yield_kg_per_ha ~ s(year) + census_region, data = data)
}
corn_model <- run_gam_yield_vs_year_by_region(corn)
wheat_model <- run_gam_yield_vs_year_by_region(wheat)
census_regions <- unique(corn$census_region)

# 1. En `predict_this`, establece el año de predicción a 2050.
#   - Predice el rendimiento usando `corn_model`
##    y los casos especificados en `predict_this`.
#   - Mutate `predict_this` para agregar el vector de predicción
##    como una nueva columna llamada `pred_yield_kg_per_ha`.

# Make predictions in 2050
predict_this <- data.frame(
  year = 2050,
  census_region = census_regions
)

# Predict the yield
pred_yield_kg_per_ha <- predict(corn_model, predict_this, type = "response")

predict_this %>%
  # Add the prediction as a column of predict_this
  mutate(pred_yield_kg_per_ha = pred_yield_kg_per_ha)

# 2. Envuelve el script en una función, predict_yields.
## Debería tomar dos argumentos, model y year, sin valores predeterminados.
## Recuerda actualizar 2050 al argumento year.
## Prueba predict_yields() en wheat_model con year establecido en 2050.

# Wrap this prediction code into a function
predict_yields <- function(model, year) {
  predict_this <- data.frame(
    year = year,
    census_region = census_regions
  )
  pred_yield_kg_per_ha <- predict(model, predict_this, type = "response")
  predict_this %>%
    mutate(pred_yield_kg_per_ha = pred_yield_kg_per_ha)
}

# Try it on the wheat dataset
predict_yields(wheat_model, 2050)
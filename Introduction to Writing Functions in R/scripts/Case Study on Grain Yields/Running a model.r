library(mgcv)
library(dplyr)
corn <- readRDS("data/corn.rds")
wheat <- readRDS("data/wheat.rds")

# 1. Ejecute un GAM de `yield_kg_per_ha` versus el año suavizado
## y la región del censo, utilizando el conjunto de datos `corn`.

# Run a generalized additive model of yield vs. smoothed year and census region
gam(yield_kg_per_ha ~ s(year) + census_region, data = corn)

# 2. Envuelva el código de modelado en una función,
## `run_gam_yield_vs_year_by_region`.
## Esto debería tomar un solo argumento, `data`, sin ningún valor predeterminado

# Wrap the model code into a function
run_gam_yield_vs_year_by_region <- function(data) {
  gam(yield_kg_per_ha ~ s(year) + census_region, data = data)
}

# Try it on the wheat dataset
run_gam_yield_vs_year_by_region(wheat)
library(dplyr)
library(ggplot2)
library(mgcv)
barley <- readRDS("data/nass.barley.rds")
source("scripts/functions.r") # Load the functions

# 1. Fortalecer los datos de `barley` con unidades métricas,
## luego con regiones censales.

fortified_barley <- barley %>%
  # Fortify with metric units
  fortify_with_metric_units("barley") %>%
  # Fortify with census regions
  fortify_with_census_region()

# See the result
glimpse(fortified_barley)

# 2. Utilizando los datos fortalecidos de barley,
## trazar el rendimiento versus el año por región censal.

# Plot yield vs. year by region
plot_yield_vs_year_by_region(fortified_barley)

# 3. Utilizando los datos fortalecidos de barley,
## ejecute un GAM de rendimiento versus año por región censal,
## luego prediga los rendimientos en 2050.

fortified_barley %>%
  # Run a GAM of yield vs. year by region
  run_gam_yield_vs_year_by_region() %>%
  # Make predictions of yields in 2050
  predict_yields(2050)

library(dplyr)
corn <- readRDS("data/nass.corn.metric.rds")
wheat <- readRDS("data/nass.wheat.metric.rds")
usa_census_regions <- readRDS("data/usa_census_regions.rds")

# 1. Hacer un inner join de `corn` a `usa_census_regions` por `"state"`.

# Inner join the corn dataset to usa_census_regions by state
corn %>%
  inner_join(usa_census_regions, by = "state")

# 2. Convertir el código en una función, `fortify_with_census_region()`.
## Esto debería aceptar un solo argumento, `data`.

# Wrap this code into a function
fortify_with_census_region <- function(data) {
  data %>%
    inner_join(usa_census_regions, by = "state")
}

# Try it on the wheat dataset
fortify_with_census_region(wheat)
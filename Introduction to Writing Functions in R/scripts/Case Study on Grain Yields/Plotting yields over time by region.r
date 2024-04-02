library(dplyr)
library(ggplot2)
corn <- readRDS("data/corn.rds")
wheat <- readRDS("data/wheat.rds")
plot_yield_vs_year <- function(data) {
  ggplot(data, aes(year, yield_kg_per_ha)) +
    geom_line(aes(group = state)) +
    geom_smooth()
}

# 1. Utilice la función que escribió para trazar el rendimiento versus el año
# para el conjunto de datos `corn`,
## luego divida el gráfico, envuelto por `census_region`.

# Plot yield vs. year for the corn dataset
plot_yield_vs_year(corn) +
  # Facet, wrapped by census region
  facet_wrap(~census_region)

# 2. Convierta el código en una función, `plot_yield_vs_year_by_region()`,
## que debería tomar un solo argumento, `data`.

# Wrap this code into a function
plot_yield_vs_year_by_region <- function(data) {
  ggplot(data, aes(year, yield_kg_per_ha)) +
    geom_line(aes(group = state)) +
    geom_smooth() +
    facet_wrap(~census_region)
}

# Try it on the wheat dataset
plot_yield_vs_year_by_region(wheat)
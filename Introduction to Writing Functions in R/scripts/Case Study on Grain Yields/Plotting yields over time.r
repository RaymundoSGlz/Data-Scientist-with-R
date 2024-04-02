library(ggplot2)
corn <- readRDS("data/nass.corn.metric.rds")
wheat <- readRDS("data/nass.wheat.metric.rds")

# 1. Usando el conjunto de datos `corn`, gráfica `yield_kg_per_ha` versus `year`
## Añade una capa de línea agrupada por `state` y una capa de tendencia suave.

# Using corn, plot yield (kg/ha) vs. year
ggplot(corn, aes(year, yield_kg_per_ha)) +
  # Add a line layer, grouped by state
  geom_line(aes(group = state)) +
  # Add a smooth trend layer
  geom_smooth()

# 2. Convierte el código de graficación en una función, `plot_yield_vs_year()`.
## Esta debería aceptar un único argumento, `data`.

# Wrap this plotting code into a function
plot_yield_vs_year <- function(data) {
  ggplot(data, aes(year, yield_kg_per_ha)) +
    geom_line(aes(group = state)) +
    geom_smooth()
}

# Test it on the wheat dataset
plot_yield_vs_year(wheat)

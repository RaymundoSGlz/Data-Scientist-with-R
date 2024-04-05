library(ggplot2)
library(dplyr)
cars <- read.csv("data/cars04.csv")

# Usa gráficos de densidad o gráficos de caja para construir
## las siguientes visualizaciones.
## Para cada variable, prueba ambos gráficos
## y envía el que sea mejor para capturar la estructura importante.

# - Muestra la distribución de `city_mpg`.
# - Muestra la distribución de `width`.

# Create plot of city_mpg
cars %>%
  ggplot(aes(x = 1, y = city_mpg)) +
  geom_boxplot()

# Create plot of width
cars %>%
  ggplot(aes(x = width)) +
  geom_density()

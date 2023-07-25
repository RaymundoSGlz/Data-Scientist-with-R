library(ggplot2)
library(dplyr)
mtcars <- mtcars %>%
  mutate(fcyl = factor(cyl))

# 1. Ejecutar el código para ver el gráfico de barras apiladas.
# Agregue (+) un sistema de coordenadas polares,
# asignando el ángulo a la variable y estableciendo theta en "y".

# Run the code, view the plot, then update it
ggplot(mtcars, aes(x = 1, fill = fcyl)) +
  geom_bar() +
  # Add a polar coordinate system
  coord_polar(theta = "y")

# 2. Reduzca el ancho de las barras a 0.1.
# Haga un gráfico de anillo
# agregando una escala x continua con límites de 0.5 a 1.5.

ggplot(mtcars, aes(x = 1, fill = fcyl)) +
  # Reduce the bar width to 0.1
  geom_bar(width = 0.1) +
  coord_polar(theta = "y") +
  # Add a continuous x scale from 0.5 to 1.5
  scale_x_continuous(limits = c(0.5, 1.5))

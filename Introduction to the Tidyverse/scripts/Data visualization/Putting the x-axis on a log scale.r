# Cambiar el gráfico de dispersión existente (código proporcionado)
# para poner el eje x (que representa la población) en una escala logarítmica.

library(gapminder)
library(dplyr)
library(ggplot2)

gapminder_1952 <- gapminder |>
  filter(year == 1952)

# Change this plot to put the x-axis on a log scale
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() +
  scale_x_log10()

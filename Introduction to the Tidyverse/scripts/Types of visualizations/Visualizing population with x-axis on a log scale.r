# Utilice el conjunto de datos gapminder_1952 (se proporciona el código)
# para crear un histograma de la población del país (pop) en el año 1952,
# colocando el eje x en una escala logarítmica con scale_x_log10().

library(gapminder)
library(dplyr)
library(ggplot2)

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a histogram of population (pop), with x on a log scale
ggplot(gapminder_1952, aes(x = pop)) +
  geom_histogram() +
  scale_x_log10()

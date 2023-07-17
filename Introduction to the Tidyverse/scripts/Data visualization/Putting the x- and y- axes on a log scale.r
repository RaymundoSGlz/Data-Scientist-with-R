# Crear un gráfico de dispersión con población (pop) en el eje x
# y el PIB per cápita (gdpPercap) en el eje y.
# Poner tanto el eje x como el eje y en una escala logarítmica.

library(gapminder)
library(dplyr)
library(ggplot2)

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Scatter plot comparing pop and gdpPercap, with both axes on a log scale
gapminder_1952 %>%
  ggplot(aes(x = pop, y = gdpPercap)) +
  geom_point() +
  scale_x_log10() +
  scale_y_log10()

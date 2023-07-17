# Cambiar el gráfico de dispersion gapminder_1952
# para que (pop) se encuentre en el eje x y
# GDP per capita (gdpPercap) en el eje y.

library(gapminder)
library(dplyr)
library(ggplot2)

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Change to put pop on the x-axis and gdpPercap on the y-axis
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) +
  geom_point()

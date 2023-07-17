# Crear un gráfico de dispersión con la población (pop) en el eje x,
# la esperanza de vida (lifeExp) en el eje y,
# y con el continente (continent) representado por el color de los puntos.
# Colocar el eje x en una escala logarítmica.

library(gapminder)
library(dplyr)
library(ggplot2)

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Scatter plot comparing pop and lifeExp, with color representing continent
gapminder_1952 |>
    ggplot(aes(x = pop, y = lifeExp, color = continent)) +
    geom_point() +
    scale_x_log10()

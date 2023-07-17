# Crear un gráfico de dispersión de los datos de gapminder:
# Colocar el PIB per cápita (gdpPercap) en el eje x
# y la esperanza de vida (lifeExp) en el eje y,
# con el continente (continent) representado por color
# y la población (pop) representada por tamaño.
# Colocar el eje x en una escala logarítmica
# Facetar por la variable de año

library(gapminder)
library(dplyr)
library(ggplot2)

# Scatter plot comparing gdpPercap and lifeExp,
# with color representing continent
# and size representing population, faceted by year

ggplot(gapminder, aes(
    x = gdpPercap, y = lifeExp,
    color = continent, size = pop
)) +
    geom_point(alpha = 0.5) +
    scale_x_log10() +
    facet_wrap(~year)

# Modificar el gráfico de dispersión
# para que el tamaño de los puntos represente
# el PIB per cápita (gdpPercap) de cada país.

library(gapminder)
library(dplyr)
library(ggplot2)

gapminder_1952 <- gapminder %>%
    filter(year == 1952)

# Add the size aesthetic to represent a country's gdpPercap
ggplot(gapminder_1952, aes(
    x = pop, y = lifeExp, color = continent,
    size = gdpPercap
)) +
    geom_point() +
    scale_x_log10()

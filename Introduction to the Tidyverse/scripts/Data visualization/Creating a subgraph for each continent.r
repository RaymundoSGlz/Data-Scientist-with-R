# Crear un gráfico de dispersión de gapminder_1952
# con el eje x representando la población (pop),
# el eje y representando la esperanza de vida (lifeExp),
# y facetado para tener un subgráfico por continente (continent).
# Colocar el eje x en una escala logarítmica.

library(gapminder)
library(dplyr)
library(ggplot2)

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Scatter plot comparing pop and lifeExp, faceted by continent
gapminder_1952 |>
    ggplot(aes(x = pop, y = lifeExp)) +
    geom_point() +
    scale_x_log10() +
    facet_wrap(~ continent)

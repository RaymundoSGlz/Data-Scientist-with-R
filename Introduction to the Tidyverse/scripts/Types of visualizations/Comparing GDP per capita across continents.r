# Utilice el conjunto de datos gapminder_1952 (se proporciona el código)
# para crear un diagrama de caja que compare el PIB per cápita (gdpPercap)
# entre continentes.
# Coloque el eje y en una escala logarítmica con scale_y_log10().

library(gapminder)
library(dplyr)
library(ggplot2)

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a boxplot comparing gdpPercap among continents
gapminder_1952 |>
    ggplot(aes(x = continent, y = gdpPercap)) +
    geom_boxplot() +
    scale_y_log10()

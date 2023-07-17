# Utiliza el conjunto de datos "by_year" para crear un gráfico de dispersión
# que muestre el cambio de la esperanza de vida media a lo largo del tiempo,
# con el año en el eje x y la esperanza de vida media en el eje y.
# Asegúrate de agregar "expand_limits(y = 0)"
# para asegurarte de que el eje y del gráfico incluya el cero.

library(gapminder)
library(dplyr)
library(ggplot2)

by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))

# Create a scatter plot showing the change in medianLifeExp over time
by_year |>
    ggplot(aes(x = year, y = medianLifeExp)) +
    geom_point() +
    expand_limits(y = 0)

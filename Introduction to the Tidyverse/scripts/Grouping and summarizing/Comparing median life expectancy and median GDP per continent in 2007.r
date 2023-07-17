# Filtra el conjunto de datos gapminder para el año 2007,
# luego resume el PIB per cápita mediano
# y la esperanza de vida mediana dentro de cada continente,
# en columnas llamadas medianLifeExp y medianGdpPercap.
# Guarda esto como by_continent_2007.

# Usa los datos by_continent_2007 para crear un diagrama de dispersión
# comparando estas estadísticas resumidas para los continentes en 2007,
# colocando el PIB per cápita mediano en el eje x
# a la esperanza de vida mediana en el eje y.
# Colorea el diagrama de dispersión por continente.
# No es necesario agregar expand_limits(y = 0) para este gráfico.

library(gapminder)
library(dplyr)
library(ggplot2)

# Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 <- gapminder |>
    filter(year == 2007) |>
    group_by(continent) |>
    summarize(
        medianLifeExp = median(lifeExp),
        medianGdpPercap = median(gdpPercap)
    )

# Use a scatter plot to compare the median GDP and median life expectancy
by_continent_2007 |>
    ggplot(aes(x = medianGdpPercap, y = medianLifeExp, color = continent)) +
    geom_point()

# Usar group_by() y summarize()
# para encontrar el PIB per cápita mediano
# dentro de cada continente en el año 1952,
# llamando a la columna de salida medianGdpPercap.
# Usar el operador de asignación <-
# para guardarlo en un conjunto de datos llamado by_continent.

# Usar el conjunto de datos by_continent
# para crear un gráfico de barras
# que muestre el PIB per cápita mediano en cada continente.

library(gapminder)
library(dplyr)
library(ggplot2)

# Summarize the median gdpPercap by continent in 1952
by_continent <- gapminder |>
    filter(year == 1952) |>
    group_by(continent) |>
    summarize(medianGdpPercap = median(gdpPercap))

# Create a bar plot showing medianGdp by continent
by_continent |>
    ggplot(aes(x = continent, y = medianGdpPercap)) +
    geom_col()

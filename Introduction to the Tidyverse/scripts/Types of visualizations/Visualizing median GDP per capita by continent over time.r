# Usa group_by() y summarize()
# para encontrar el PIB per cápita mediano dentro de cada año y continente,
# llamando a la columna de salida medianGdpPercap.
# Usa el operador de asignación <- 
# para guardarlo en un conjunto de datos llamado by_year_continent.

# Usa el conjunto de datos by_year_continent
# para crear un gráfico de línea que muestre
# el cambio en el PIB per cápita mediano a lo largo del tiempo,
# con el color representando el continente.
# Asegúrate de usar expand_limits(y = 0) para incluir 0 en el eje y.

library(gapminder)
library(dplyr)
library(ggplot2)

# Summarize the median gdpPercap by year & continent, save as by_year_continent
by_year_continent <- gapminder |>
  group_by(year, continent) |>
  summarize(medianGdpPercap = median(gdpPercap))

# Create a line plot showing the change
# in medianGdpPercap by continent over time
by_year_continent |>
    ggplot(aes(x = year, y = medianGdpPercap, color = continent)) +
    geom_line() +
    expand_limits(y = 0)

# Usar group_by() y summarize()
# para encontrar el PIB per cápita mediano dentro de cada año,
# llamando a la columna de salida medianGdpPercap.
# Usar el operador de asignación <-
# para guardarlo en un conjunto de datos llamado by_year.
# Usar el conjunto de datos by_year para crear un gráfico de línea
# que muestre el cambio en el PIB per cápita mediano a lo largo del tiempo.
# Asegurarse de usar expand_limits(y = 0) para incluir 0 en el eje y.

library(gapminder)
library(dplyr)
library(ggplot2)

# Summarize the median gdpPercap by year, then save it as by_year
by_year <- gapminder |>
    group_by(year) |>
    summarize(medianGdpPercap = median(gdpPercap))

# Create a line plot showing the change in medianGdpPercap over time
by_year |>
    ggplot(aes(x = year, y = medianGdpPercap)) +
    geom_line() +
    expand_limits(y = 0)

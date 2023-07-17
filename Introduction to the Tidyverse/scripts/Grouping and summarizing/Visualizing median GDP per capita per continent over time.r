# Resumir el conjunto de datos gapminder por continente y año,
# encontrando la mediana del PIB per cápita (gdpPercap)
# dentro de cada uno y ponerlo en una columna llamada medianGdpPercap.
# Usar el operador de asignación <-
# para guardar estos datos resumidos como by_year_continent.

# Crear un gráfico de dispersión que muestre
# el cambio en medianGdpPercap por continente a lo largo del tiempo.
# Usar el color para distinguir entre continentes,
# y asegurarse de agregar expand_limits(y = 0)
# para que el eje y comience en cero.

library(gapminder)
library(dplyr)
library(ggplot2)

# Summarize medianGdpPercap within each continent
# within each year: by_year_continent
by_year_continent <- gapminder |>
  group_by(continent, year) |>
  summarize(medianGdpPercap = median(gdpPercap))

# Plot the change in medianGdpPercap in each continent over time
by_year_continent |>
  ggplot(aes(x = year, y = medianGdpPercap, color = continent)) +
  geom_point() +
  expand_limits(y = 0)

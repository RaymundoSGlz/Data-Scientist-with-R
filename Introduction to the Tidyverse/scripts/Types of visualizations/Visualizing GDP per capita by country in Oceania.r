# Filtrar las observaciones del continente de Oceanía en el año 1952.
# Guardar esto como oceania_1952.
# Usar el conjunto de datos oceania_1952 para crear un gráfico de barras,
# con el país en el eje x y el gdpPercap en el eje y.

library(gapminder)
library(dplyr)
library(ggplot2)

# Filter for observations in the Oceania continent in 1952
oceania_1952 <- gapminder |>
    filter(continent == "Oceania", year == 1952)

# Create a bar plot of gdpPercap by country
oceania_1952 |>
    ggplot(aes(x = country, y = gdpPercap)) +
    geom_col()

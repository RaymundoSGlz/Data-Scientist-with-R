# Filtrar los datos de gapminder para el año 1957.
# Luego encontrar la esperanza de vida mediana (lifeExp) y
# el PIB per cápita máximo (gdpPercap) dentro de cada continente,
# guardándolos en medianLifeExp y maxGdpPercap, respectivamente.

library(gapminder)
library(dplyr)

# Find median life expectancy and
# maximum GDP per capita in each continent in 1957
gapminder |>
    filter(year == 1957) |>
    group_by(continent) |>
    summarize(medianLifeExp = median(lifeExp),
                maxGdpPercap = max(gdpPercap))

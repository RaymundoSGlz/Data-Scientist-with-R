# Encuentra la esperanza de vida mediana (lifeExp) y
# el PIB per cápita máximo (gdpPercap)
# dentro de cada combinación de continente y año,
# guárdalos en medianLifeExp y maxGdpPercap, respectivamente.

library(gapminder)
library(dplyr)

# Find median life expectancy and maximum GDP per capita
# in each continent/year combination
gapminder |>
    group_by(continent, year) |>
    summarize(medianLifeExp = median(lifeExp),
                maxGdpPercap = max(gdpPercap))

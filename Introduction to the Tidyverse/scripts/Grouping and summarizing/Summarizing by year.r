# Encuentra la esperanza de vida mediana (lifeExp) y
# el PIB per cápita máximo (gdpPercap) dentro de cada año,
# guardándolos en medianLifeExp y maxGdpPercap, respectivamente.

library(gapminder)
library(dplyr)

# Find median life expectancy and maximum GDP per capita in each year
gapminder |>
    group_by(year) |>
    summarize(medianLifeExp = median(lifeExp),
                maxGdpPercap = max(gdpPercap))

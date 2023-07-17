# Encuentra tanto la esperanza de vida mediana (lifeExp) como
# el PIB per cápita máximo (gdpPercap) en el año 1957,
# llamándolos medianLifeExp y maxGdpPercap respectivamente.
# Puedes usar la función max() para encontrar el máximo.

library(gapminder)
library(dplyr)

# Filter for 1957 then summarize the median life expectancy
# and the maximum GDP per capita
gapminder |>
    filter(year == 1957) |>
    summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

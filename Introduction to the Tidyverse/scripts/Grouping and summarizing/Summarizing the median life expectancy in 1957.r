# Filtrar para el año 1957,
# luego usar la función median() dentro de un summarize()
# para calcular la esperanza de vida mediana en una columna llamada
# medianLifeExp.

library(gapminder)
library(dplyr)

# Filter for 1957 then summarize the median life expectancy
gapminder |>
    filter(year == 1957) |>
    summarize(medianLifeExp = median(lifeExp))

# Usa la función median() dentro de un summarize()
# para encontrar la esperanza de vida mediana.
# Guárdala en una columna llamada medianLifeExp.

library(gapminder)
library(dplyr)

# Summarize to find the median life expectancy
gapminder |>
    summarize(medianLifeExp = median(lifeExp))

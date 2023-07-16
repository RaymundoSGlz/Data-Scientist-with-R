# Ordenar el conjunto de datos gapminder en orden ascendente
# de esperanza de vida (lifeExp).
# Ordenar el conjunto de datos gapminder en orden descendente
# de esperanza de vida.

library(gapminder)
library(dplyr)

# Sort in ascending order of lifeExp
gapminder |>
    arrange(lifeExp)

# Sort in descending order of lifeExp
gapminder |>
    arrange(desc(lifeExp))

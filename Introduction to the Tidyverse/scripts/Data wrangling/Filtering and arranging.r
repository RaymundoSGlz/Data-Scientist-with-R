# Usar filter() para extraer observaciones solo del año 1957,
# luego usar arrange() para ordenar en orden descendente la población (pop).

library(gapminder)
library(dplyr)

# Filter for the year 1957, then arrange in descending order of population
gapminder |>
    filter(year == 1957) |>
    arrange(desc(pop))

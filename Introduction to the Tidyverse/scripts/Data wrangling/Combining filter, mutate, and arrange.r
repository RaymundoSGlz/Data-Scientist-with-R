# En una secuencia de pipe en el conjunto de datos gapminder:
# filter() para observaciones del año 2007,
# mutate() para crear una columna lifeExpMonths, calculada como 12 * lifeExp, y
# arrange() en orden descendente de esa nueva columna

library(gapminder)
library(dplyr)

# Filter, mutate, and arrange the gapminder dataset
gapminder |>
  filter(year == 2007) |>
  mutate(lifeExpMonths = 12 * lifeExp) |>
  arrange(desc(lifeExpMonths))

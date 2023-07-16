# Agrega una línea filter() después del operador pipe (%>%)
# para extraer solo las observaciones del año 1957.
# Recuerda que se usa == para comparar dos valores.

library(gapminder)
library(dplyr)

# Filter the gapminder dataset for the year 1957
gapminder |>
  filter(year == 1957)

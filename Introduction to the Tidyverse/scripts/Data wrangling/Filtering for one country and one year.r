# Filtrar los datos de gapminder para obtener solo
# la observación de China en el año 2002.

library(gapminder)
library(dplyr)

# Filter for China in 2002
gapminder |>
    filter(country == "China", year == 2002)

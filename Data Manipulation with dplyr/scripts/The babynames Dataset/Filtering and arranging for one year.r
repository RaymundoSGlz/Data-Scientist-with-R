# Filtrar solo el año 1990.
# Ordenar la tabla en orden descendente según el número de bebés nacidos.

# Cargamos el dataset
library(babynames)
library(dplyr)

babynames %>%
    # Filter for the year 1990
    filter(year == 1990) %>%
    # Sort the number column in descending order
    arrange(desc(n))

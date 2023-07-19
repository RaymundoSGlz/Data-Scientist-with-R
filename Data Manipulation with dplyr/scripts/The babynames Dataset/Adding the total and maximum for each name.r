# Use una mutación agrupada para agregar dos columnas:

# name_total: la suma del número de bebés nacidos
# con ese nombre en todo el conjunto de datos.
# name_max: el número máximo de bebés nacidos con ese nombre en cualquier año.

# Agregue otra etapa para desagrupar la tabla.
# Agregue una columna llamada fraction_max
# que contenga el número en el año dividido por name_max.

# Cargamos el dataset desde el rds
library(readr)
library(dplyr)
babynames <- read_rds("data//babynames.rds")

babynames %>%
    # Add columns name_total and name_max for each name
    group_by(name) %>%
    mutate(
        name_total = sum(number),
        name_max = max(number)
    ) %>%
    # Ungroup the table
    ungroup() %>%
    # Add the fraction_max column containing the number by the name maximum
    mutate(fraction_max = number / name_max)

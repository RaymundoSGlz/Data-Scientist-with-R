# Ordenar los datos en orden ascendente de nombre y luego año.

# Agrupar por nombre para que su mutación funcione dentro de cada nombre.

# Agregue una columna de relación que contenga
# la relación (no la diferencia) de fracción entre cada año.

# Cargamos el dataset desde rds
library(dplyr)
library(readr)
babynames <- read_rds("data/babynames.rds")

babynames_fraction <- babynames |>
        group_by(year) |>
        mutate(year_total = sum(number)) |>
        ungroup() |>
        mutate(fraction = number / year_total)

babynames_fraction %>%
    # Arrange the data in order of name, then year
    arrange(name, year) %>%
    # Group the data by name
    group_by(name) %>%
    # Add a ratio column that contains the ratio of fraction between each year
    mutate(ratio = fraction / lag(fraction))

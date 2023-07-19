# Para cada nombre en los datos, mantenga la observación (el año)
# con la mayor relación;
# tenga en cuenta que los datos ya están agrupados por nombre.

# Ordene la columna de relación en orden descendente.

# Filtrar aún más los datos de babynames_ratios_filtered
# filtrando la columna de fracción para mostrar
# solo los resultados mayores o iguales a 0.001.

# Cargamos el dataset desde rds
library(dplyr)
library(readr)
babynames <- read_rds("data/babynames.rds")

babynames_fraction <- babynames |>
    group_by(year) |>
    mutate(year_total = sum(number)) |>
    ungroup() |>
    mutate(fraction = number / year_total)

babynames_ratios_filtered <- babynames_fraction %>%
    arrange(name, year) %>%
    group_by(name) %>%
    mutate(ratio = fraction / lag(fraction)) %>%
    filter(fraction >= 0.00001)

babynames_ratios_filtered %>%
    # Extract the largest ratio from each name
    slice_max(ratio) %>%
    # Sort the ratio column in descending order
    arrange(desc(ratio)) %>%
    # Filter for fractions greater than or equal to 0.001
    filter(fraction >= 0.001)

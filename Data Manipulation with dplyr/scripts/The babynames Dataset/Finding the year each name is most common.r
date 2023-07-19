# Primero calcula el número total de personas nacidas en ese año
# en este conjunto de datos como year_total.

# A continuación, use year_total para calcular
# la fracción de personas nacidas en cada año que tienen cada nombre.

# Ahora use su columna de fracción recién calculada,
# en combinación con slice_max (),
# para identificar el año en que cada nombre fue más común.

# Cargamos el dataset
library(babynames)
library(dplyr)

# Calculate the fraction of people born each year with the same name
babynames %>%
    group_by(year) %>%
    mutate(year_total = sum(n)) %>%
    ungroup() %>%
    mutate(fraction = n / year_total) %>%
    # Find the year each name is most common
    group_by(name) %>%
    slice_max(fraction)

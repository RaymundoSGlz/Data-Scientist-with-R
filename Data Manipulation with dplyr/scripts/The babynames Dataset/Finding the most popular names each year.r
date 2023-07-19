# Use group_by() y slice_max() para encontrar
# el nombre más común para bebés estadounidenses en cada año.

# Cargamos el dataset
library(babynames)
library(dplyr)

babynames %>%
  # Find the most common name in each year
    group_by(year) %>%
    slice_max(n)

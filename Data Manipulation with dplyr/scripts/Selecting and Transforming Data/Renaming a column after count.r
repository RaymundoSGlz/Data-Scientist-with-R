# Usa count() para determinar cuántos condados hay en cada estado.
# use rename() para cambiar el nombre de n a num_counties.

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

counties %>%
    # Count the number of counties in each state
    count(state) %>%
    # Rename the n column to num_counties
    rename(num_counties = n)

# cargamos el .rds
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

# Verificamos los datos utilizando la función glimpse()
glimpse(counties)

# Usa glimpse() para examinar todas las variables en la tabla de counties.
# Selecciona las columnas para state, county, population,
# y (usando dos puntos) las cinco variables relacionadas con la industria;
# hay cinco variables consecutivas
# en la tabla relacionadas con la industria del trabajo de las personas:
# professional, service, office, construction, y production.
# Organiza la tabla en orden descendente
# de service para encontrar qué condados tienen
# las tasas más altas de trabajo en la industria de servicios.

# Cargamos el dataset counties
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

# Glimpse the counties table
glimpse(counties)

counties %>%
    # Select state, county, population, and industry-related columns
    select(state, county, population, professional:production) %>%
    # Arrange service in descending order
    arrange(desc(service))

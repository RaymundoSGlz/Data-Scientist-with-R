# Elija el verbo correcto para cambiar
# el nombre de la columna de unemployment a unemployment_rate.

# Elija el verbo correcto para mantener solo
# las columnas state, county y aquellas que contengan poverty.

# Calcule una nueva columna llamada fraction_women
# con la fracción de la población compuesta por mujeres,
# sin eliminar ninguna columna.

# Mantenga solo tres columnas:
# state, county, y employed / population,
# que llamará employment_rate.

# Cargamos el dataset
library(dplyr)
library(readr)
counties <- read_rds("data/counties.rds")

# Change the name of the unemployment column
counties %>%
  rename(unemployment_rate = unemployment)

# Keep the state and county columns, and the columns containing poverty
counties %>%
  select(state, county, contains("poverty"))

# Calculate the fraction_women column without dropping the other columns
counties %>%
  mutate(fraction_women = women / population)

# Keep only the state, county, and employment_rate columns
counties %>%
  transmute(state, county, employment_rate = employed / population)

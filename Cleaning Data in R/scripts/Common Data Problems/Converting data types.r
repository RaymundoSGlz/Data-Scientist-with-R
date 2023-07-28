library(dplyr)
library(assertive)
bike_share_rides <- readRDS("data/bike_share_rides_ch1_1.rds")
# Examinar los tipos de datos de las columnas de bike_share_rides.
# Obtener un resumen de la columna user_birth_year de bike_share_rides.

# Glimpse at bike_share_rides
glimpse(bike_share_rides)

# Summary of user_birth_year
summary(bike_share_rides$user_birth_year)

# Agregar una nueva columna a bike_share_rides llamada user_birth_year_fct,
# que contiene user_birth_year, convertido en un factor.
# Afirmar que user_birth_year_fct es un factor para confirmar la conversión.

# Convert user_birth_year to factor: user_birth_year_fct
bike_share_rides <- bike_share_rides %>%
  mutate(user_birth_year_fct = as.factor(user_birth_year))

# Assert user_birth_year_fct is a factor
assert_is_factor(bike_share_rides$user_birth_year_fct)

# Summary of user_birth_year_fct
summary(bike_share_rides$user_birth_year_fct)

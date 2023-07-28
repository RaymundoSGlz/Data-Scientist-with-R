library(dplyr)
library(assertive)
bike_share_rides <- readRDS("data/bike_share_rides_ch1_1.rds")
# Convertir la columna date de bike_share_rides de character a tipo Date.
# Asegurar que todos los valores en la columna de fecha ocurrieron
# en algún momento en el pasado y no en el futuro.
# Filtrar bike_share_rides para obtener solo los viajes del pasado o de hoy,
# y guardar esto como bike_share_rides_pasado.
# Asegurar que las fechas en bike_share_rides_pasado
# ocurrieron solo en el pasado.

library(lubridate)
# Convert date to Date type
bike_share_rides <- bike_share_rides %>%
  mutate(date = as.Date(date))

# Make sure all dates are in the past
assert_all_are_in_past(bike_share_rides$date)

# Filter for rides that occurred before or on today's date
bike_share_rides_past <- bike_share_rides %>%
  filter(date <= today())

# Make sure all dates from bike_share_rides_past are in the past
assert_all_are_in_past(bike_share_rides_past$date)

library(dplyr)
library(assertive)
library(stringr)
bike_share_rides <- readRDS("data/bike_share_rides_ch1_1.rds")
# Usar str_remove() para eliminar "minutes"
# de la columna duration de bike_share_rides.
# Agregar esto como una nueva columna llamada duration_trimmed.
# Convertir la columna duration_trimmed a un tipo numérico
# y agregar esto como una nueva columna llamada duration_mins.
# Glimpse at bike_share_rides
# y afirmar que la columna duration_mins es numérica.
# Calcular la media de duration_mins.

bike_share_rides <- bike_share_rides %>%
  # Remove 'minutes' from duration: duration_trimmed
  mutate(
    duration_trimmed = str_remove(duration, "minutes"),
    # Convert duration_trimmed to numeric: duration_mins
    duration_mins = as.numeric(duration_trimmed)
  )

# Glimpse at bike_share_rides
glimpse(bike_share_rides)

# Assert duration_mins is numeric
assert_is_numeric(bike_share_rides$duration_mins)

# Calculate mean duration
mean(bike_share_rides$duration_mins)

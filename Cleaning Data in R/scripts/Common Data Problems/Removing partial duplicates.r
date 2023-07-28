library(dplyr)
bike_share_rides <- readRDS("data/bike_share_rides_ch1_1.rds")
# Contar el número de ocurrencias de cada ride_id.
# Filtrar para ride_ids que ocurren varias veces.

# Find duplicated ride_ids
bike_share_rides %>%
  # Count the number of occurrences of each ride_id
  count(ride_id) %>%
  # Filter for rows with a count > 1
  filter(n > 1)

# Eliminar duplicados completos y parciales de bike_share_rides
# basado en ride_id solamente, manteniendo todas las columnas.
# Almacenar esto como bike_share_rides_unique.

# Remove full and partial duplicates
bike_share_rides_unique <- bike_share_rides %>%
  # Only based on ride_id instead of all cols
  distinct(ride_id, .keep_all = TRUE)

# Encuentra los ride_ids duplicados en bike_share_rides_unique.
bike_share_rides_unique %>%
  # Count the number of occurrences of each ride_id
  count(ride_id) %>%
  # Filter for rows with a count > 1
  filter(n > 1)

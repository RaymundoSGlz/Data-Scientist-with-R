library(dplyr)
library(stringr)
bike_share_rides <- readRDS("data/bike_share_rides_ch1_1.rds")
bike_share_rides <- bike_share_rides %>%
  # Remove 'minutes' from duration: duration_trimmed
  mutate(
    duration_trimmed = str_remove(duration, "minutes"),
    # Convert duration_trimmed to numeric: duration_mins
    duration_min = as.numeric(duration_trimmed)
  )
# Agrupar bike_share_rides por ride_id y date.
# Agregar una columna llamada duration_min_avg que contenga
# la duración media del viaje para el ride_id y date de la fila.
# Eliminar duplicados basados en ride_id y date,
# manteniendo todas las columnas del data frame.
# Eliminar la columna duration_min.

bike_share_rides %>%
  # Group by ride_id and date
  group_by(ride_id, date) %>%
  # Add duration_min_avg column
  mutate(duration_min_avg = mean(duration_min)) %>%
  # Remove duplicates based on ride_id and date, keep all cols
  distinct(ride_id, date, .keep_all = TRUE) %>%
  # Remove duration_min column
  select(-duration_min)

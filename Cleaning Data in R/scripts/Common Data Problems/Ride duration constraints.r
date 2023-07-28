library(ggplot2)
library(dplyr)
library(assertive)
library(stringr)
bike_share_rides <- readRDS("data/bike_share_rides_ch1_1.rds")
bike_share_rides <- bike_share_rides %>%
  # Remove 'minutes' from duration: duration_trimmed
  mutate(
    duration_trimmed = str_remove(duration, "minutes"),
    # Convert duration_trimmed to numeric: duration_mins
    duration_min = as.numeric(duration_trimmed)
  )
# Crear un histograma de tres contenedores
# de la columna duration_min de bike_share_rides
# usando ggplot2 para identificar si hay datos fuera de rango.

# Create breaks
breaks <- c(
  min(bike_share_rides$duration_min),
  0, 1440,
  max(bike_share_rides$duration_min)
)

# Create a histogram of duration_min
ggplot(bike_share_rides, aes(duration_min)) +
  geom_histogram(breaks = breaks)

# Reemplazar los valores de duration_min que son mayores
# que 1440 minutos (24 horas) con 1440.
# Agregue esto a bike_share_rides como una nueva columna
# llamada duration_min_const.
# Asegúrese de que todos los valores de duration_min_const estén entre 0 y 1440.

# duration_min_const: replace vals of duration_min > 1440 with 1440
bike_share_rides <- bike_share_rides %>%
  mutate(duration_min_const = replace(duration_min, duration_min > 1440, 1440))

# Make sure all values of duration_min_const are between 0 and 1440
assert_all_are_in_closed_range(
  bike_share_rides$duration_min_const,
  lower = 0, upper = 1440
)

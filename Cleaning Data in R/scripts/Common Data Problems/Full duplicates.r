library(dplyr)
bike_share_rides <- readRDS("data/bike_share_rides_ch1_1.rds")
# Obtener el número total de duplicados completos en bike_share_rides.
# Eliminar todos los duplicados completos de bike_share_rides
# y guardar el nuevo dataframe como bike_share_rides_unique.
# Obtener el número total de duplicados completos
# en el nuevo dataframe bike_share_rides_unique.

# Count the number of full duplicates
sum(duplicated(bike_share_rides))

# Remove duplicates
bike_share_rides_unique <- bike_share_rides %>%
  distinct()

# Count the full duplicates in bike_share_rides_unique
sum(duplicated(bike_share_rides_unique))

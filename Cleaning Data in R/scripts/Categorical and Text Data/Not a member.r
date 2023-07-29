library(dplyr)
# Crear los datos
dest_sizes <- data.frame(
  dest_size = c("Small", "Medium", "Large", "Hub"),
  passengers_per_day = c("0-20K", "20K-70K", "70K-100K", "100K+")
)
sfo_survey <- readRDS("data/sfo_survey_ch2_1.rds")
# Contar el número de ocurrencias de cada dest_size en sfo_survey.

# Count the number of occurrences of dest_size
sfo_survey %>%
  count(dest_size)

# Usar el tipo correcto de filtering join en el data frame sfo_survey
# y el data frame dest_sizes para obtener las filas de sfo_survey
# con valores de dest_size inválidos.
# Obtener las columnas id, airline, destination y dest_size.

# Find bad dest_size rows
sfo_survey %>%
  # Join with dest_sizes data frame to get bad dest_size rows
  anti_join(dest_sizes, by = "dest_size") %>%
  # Select id, airline, destination, and dest_size cols
  select(id, airline, destination, dest_size)

# Usar el tipo correcto de filtering join en sfo_survey y dest_sizes
# para obtener las filas de sfo_survey con valores de dest_size válidos.
# Contar el número de veces que ocurre cada dest_size
# para asegurarse de que no queden valores inválidos.

# Remove bad dest_size rows
sfo_survey %>%
  # Join with dest_sizes
  semi_join(dest_sizes, by = "dest_size") %>%
  # Count the number of each dest_size
  count(dest_size)

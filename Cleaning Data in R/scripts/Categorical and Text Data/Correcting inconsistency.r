library(dplyr)
library(stringr)
sfo_survey <- readRDS("data/sfo_survey_ch2_1.rds")
# Agrega una columna a sfo_survey llamada dest_size_trimmed
# que contenga los valores de la columna dest_size
# con todos los espacios en blanco al inicio y al final eliminados.

# Agrega otra columna llamada cleanliness_lower que contenga
# los valores de la columna cleanliness convertidos a minúsculas.

# Cuenta el número de ocurrencias de cada categoría en dest_size_trimmed.

# Cuenta el número de ocurrencias de cada categoría en cleanliness_lower.

# Add new columns to sfo_survey
sfo_survey <- sfo_survey %>%
  # dest_size_trimmed: dest_size without whitespace
  mutate(
    dest_size_trimmed = str_trim(dest_size),
    # cleanliness_lower: cleanliness converted to lowercase
    cleanliness_lower = str_to_lower(cleanliness)
  )

# Count values of dest_size_trimmed
sfo_survey %>%
  count(dest_size_trimmed)

# Count values of cleanliness_lower
sfo_survey %>%
  count(cleanliness_lower)

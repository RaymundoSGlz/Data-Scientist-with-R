library(dplyr)
sfo_survey <- readRDS("data/sfo_survey_ch2_1.rds")

# Contar el número de ocurrencias de cada categoría
# de la variable dest_size de sfo_survey.

# Count dest_size
sfo_survey %>%
  count(dest_size)

# Contar el número de ocurrencias de cada categoría
# de la variable cleanliness de sfo_survey.

# Count cleanliness
sfo_survey %>%
  count(cleanliness)

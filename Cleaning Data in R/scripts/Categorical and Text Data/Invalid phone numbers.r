library(dplyr)
library(stringr)
sfo_survey <- readRDS("data/sfo_survey_ch2_1.rds")
# Examinar números de teléfono no válidos filtrando
# para números cuya longitud no sea igual a 12.

# Elimine las filas con números no válidos filtrando
# para números con una longitud de exactamente 12.

# Check out the invalid numbers
sfo_survey %>%
  filter(str_length(phone) != 12)

# Remove rows with invalid numbers
sfo_survey %>%
  filter(str_length(phone) == 12)

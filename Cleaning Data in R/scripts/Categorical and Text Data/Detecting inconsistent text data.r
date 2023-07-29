library(dplyr)
library(stringr)
sfo_survey <- readRDS("data/sfo_survey_ch2_1.rds")
# 1. Filtrar por filas con números de teléfono que contengan "-" s.

# Filter for rows with "-" in the phone column
sfo_survey %>%
  filter(str_detect(phone, "-"))

# 2. Filtrar por filas con números de teléfono que contengan "(", o ")".
# Recuerde usar fixed () al buscar paréntesis.

# Filter for rows with "(" or ")" in the phone column
sfo_survey %>%
  filter(str_detect(phone, fixed("(")) | str_detect(phone, fixed(")")))

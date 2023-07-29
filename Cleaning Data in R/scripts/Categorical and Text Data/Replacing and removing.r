library(dplyr)
library(stringr)
sfo_survey <- readRDS("data/sfo_survey_ch2_1.rds")

# Eliminar paréntesis de apertura y cierre de la columna phone.
# Almacene esto como una variable llamada phone_no_parens.
# ¡Recuerde usar fixed ()!

# Remove parentheses from phone column
phone_no_parens <- sfo_survey$phone %>%
  # Remove "("s
  str_remove_all(fixed("(")) %>%
  # Remove ")"s
  str_remove_all(fixed(")"))

# Agregar una nueva columna a sfo_survey llamada
# phone_no_parens que contenga el contenido de phone_no_parens.
# Add phone_no_parens as column
sfo_survey %>%
  mutate(phone_no_parens = phone_no_parens)

# Crear una nueva columna de sfo_survey llamada phone_clean
# que contenga los valores de phone_no_parens
# con todos los guiones reemplazados con espacios.

# Add phone_no_parens as column
sfo_survey %>%
  mutate(
    phone_no_parens = phone_no_parens,
    # Replace all hyphens in phone_no_parens with spaces
    phone_clean = str_replace_all(phone_no_parens, "-", " ")
  )

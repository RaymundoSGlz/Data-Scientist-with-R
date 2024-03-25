library(lubridate)
# - Crea `today_8am()` añadiendo un periodo de 8 horas a `today()`
# - Crea una secuencia de periodos desde un periodo de dos semanas,
## hasta 26 periodos de dos semanas.
# - Añade `every_two_weeks` a `today_8am`.

# Add a period of 8 hours to today
today_8am <- today() + hours(8)

# Sequence of two weeks from 1 to 26
every_two_weeks <- weeks(2) * 1:26

# Create datetime for every two weeks for a year
today_8am + every_two_weeks
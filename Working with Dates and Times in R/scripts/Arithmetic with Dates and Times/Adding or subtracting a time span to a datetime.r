library(lubridate)
# - Es lunes 27 de agosto de 2018 a las 2pm y quieres recordarte
## a ti mismo la próxima semana a esta hora para enviar un correo electrónico.
## Agrega un período de una semana a `mon_2pm`.
# - Es martes 28 de agosto de 2018 a las 9am y estás comenzando un código
## que generalmente tarda unas 81 horas en ejecutarse.
## ¿Cuándo terminará? Agrega una duración de 81 horas a `tue_9am`.
# - ¿Qué estabas haciendo hace cinco años?
## Resta un período de 5 años de `today()`.
# - Resta una duración de 5 años de `today()`. *¿Esto dará una fecha diferente?*

# Add a period of one week to mon_2pm
mon_2pm <- dmy_hm("27 Aug 2018 14:00")
mon_2pm + weeks()

# Add a duration of 81 hours to tue_9am
tue_9am <- dmy_hm("28 Aug 2018 9:00")
tue_9am + hours(81)

# Subtract a period of five years from today()
today() - years(5)

# Subtract a duration of five years from today()
today() - dyears(5)
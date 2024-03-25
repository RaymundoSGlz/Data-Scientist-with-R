library(lubridate)
# Hemos puesto código para definir tres tiempos en tu script:
## el mediodía del 11 de marzo, 12 de marzo y 13 de marzo de 2017
## en la zona horaria del Pacífico de EE. UU.

# - Encuentra la diferencia de tiempo entre `mar_13` y `mar_12` en segundos.
## *Esto debería coincidir con tu intuición*.
# - Ahora, encuentra la diferencia de tiempo entre `mar_12` y `mar_11`
## en segundos. *¿Sorprendido?*

# Three dates
mar_11 <- ymd_hms("2017-03-11 12:00:00",
  tz = "America/Los_Angeles"
)
mar_12 <- ymd_hms("2017-03-12 12:00:00",
  tz = "America/Los_Angeles"
)
mar_13 <- ymd_hms("2017-03-13 12:00:00",
  tz = "America/Los_Angeles"
)

# Difference between mar_13 and mar_12 in seconds
difftime(mar_13, mar_12, units = "secs")

# Difference between mar_12 and mar_11 in seconds
difftime(mar_12, mar_11, units = "secs")

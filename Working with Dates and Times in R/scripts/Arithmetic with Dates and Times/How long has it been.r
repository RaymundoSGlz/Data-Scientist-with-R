library(lubridate)
# - Apollo 11 aterrizó el 20 de julio de 1969.
## Usa `difftime()` para encontrar el número de días
## entre `today()` y `date_landing`.
# - Neil Armstrong pisó la superficie a las 02:56:15 UTC.
## Usa `difftime()` para encontrar el número de segundos
## entre `now()` y `moment_step`.

# The date of landing and moment of step
date_landing <- mdy("July 20, 1969")
moment_step <- mdy_hms("July 20, 1969, 02:56:15", tz = "UTC")

# How many days since the first man on the moon?
difftime(today(), date_landing, units = "days")

# How many seconds since the first man on the moon?
difftime(now(), moment_step, units = "secs")

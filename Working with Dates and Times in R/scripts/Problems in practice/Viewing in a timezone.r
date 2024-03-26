library(lubridate)
game2 <- mdy_hm("June 11 2015 19:00")
game3 <- mdy_hm("June 15 2015 18:30")
game2_local <- force_tz(game2, tzone = "America/Edmonton")
game3_local <- force_tz(game3, tzone = "America/Winnipeg")

# - La mayoría de los fans sintonizarán desde Nueva Zelanda.
## Utilice `with_tz()` para mostrar `game2_local` en horario de Nueva Zelanda.
## Nueva Zelanda se encuentra en la zona horaria `"Pacific/Auckland"`.
# - Yo estaré en Corvallis, Oregon. Utilice `with_tz()`
## para mostrar `game2_local` en mi horario.
## Corvallis se encuentra en la zona horaria `"America/Los_Angeles"`.
# - Finalmente, utilice `with_tz()` para mostrar `game3_local`
## en horario de Nueva Zelanda.

# What time is game2_local in NZ?
with_tz(game2_local, tzone = "Pacific/Auckland")

# What time is game2_local in Corvallis, Oregon?
with_tz(game2_local, tzone = "America/Los_Angeles")

# What time is game3_local in NZ?
with_tz(game3_local, tzone = "Pacific/Auckland")
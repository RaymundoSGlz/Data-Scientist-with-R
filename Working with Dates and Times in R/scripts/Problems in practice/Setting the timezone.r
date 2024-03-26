library(lubridate)
# He puesto los horarios tal como se enumeran en el sitio web de la FIFA
## para los juegos 2 y 3 en la etapa de grupos para Nueva Zelanda en tu código.

# - El juego 2 se jugó en Edmonton. Usa `force_tz()`
## para establecer la zona horaria del juego 2 a `"America/Edmonton"`.
# - El juego 3 se jugó en Winnipeg. Usa `force_tz()`
## para establecer la zona horaria del juego 3 a `"America/Winnipeg"`.
# - Descubre cuánto tiempo tuvo el equipo para descansar entre los dos juegos,
## utilizando `as.period()` en el intervalo entre `game2_local` y `game3_local`.

# Game2: CAN vs NZL in Edmonton
game2 <- mdy_hm("June 11 2015 19:00")

# Game3: CHN vs NZL in Winnipeg
game3 <- mdy_hm("June 15 2015 18:30")

# Set the timezone to "America/Edmonton"
game2_local <- force_tz(game2, tzone = "America/Edmonton")
game2_local

# Set the timezone to "America/Winnipeg"
game3_local <- force_tz(game3, tzone = "America/Winnipeg")
game3_local

# How long does the team have to rest?
as.period(game2_local %--% game3_local)

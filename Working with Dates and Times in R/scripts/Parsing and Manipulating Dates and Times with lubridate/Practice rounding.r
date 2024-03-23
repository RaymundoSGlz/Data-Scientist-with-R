library(lubridate)
# - Elige la función correcta y las unidades para redondear `r_3_4_1`
## hacia abajo al día más cercano.
# - Elige la función correcta y las unidades para redondear `r_3_4_1`
## a los 5 minutos más cercanos.
# - Elige la función correcta y las unidades para redondear `r_3_4_1`
## hacia arriba a la semana más cercana.
# - Encuentra el tiempo transcurrido en el día del lanzamiento
## en el momento del lanzamiento restando `r_3_4_1`
## redondeado hacia abajo al día desde `r_3_4_1`.

r_3_4_1 <- ymd_hms("2016-05-03 07:13:28 UTC")

# Round down to day
floor_date(r_3_4_1, unit = "day")

# Round to nearest 5 minutes
round_date(r_3_4_1, unit = "5 minutes")

# Round up to week
ceiling_date(r_3_4_1, unit = "week")

# Subtract r_3_4_1 rounded down to day
r_3_4_1 - floor_date(r_3_4_1, unit = "day")

library(tidyverse)
akl_hourly <- read_csv("data/akl_weather_hourly_2016.csv")
akl_hourly <- akl_hourly |>
  mutate(
    date = make_date(year = year, month = month, day = mday),
    datetime_string = paste(date, time, sep = "T"),
    datetime = as_datetime(datetime_string)
  )

# Los datos están disponibles en el set de datos `akl_hourly`.

# - ¿En qué zona horaria están `datetime` y `date_utc` actualmente?
## Examina el inicio de las columnas `datetime` y `date_utc` para averiguarlo.
# - Corrige `datetime` para tener la zona horaria de `"Pacific/Auckland"`.
# - Reexamina el inicio de la columna `datetime`
## para verificar que las horas tienen la misma hora de reloj,
## pero ahora están en la zona horaria correcta.
# - Ahora resume la diferencia entre las columnas `datetime` y `date_utc`.
## *Debería ser cero si nuestra hipótesis era correcta*.

# Examine datetime and date_utc columns
head(akl_hourly$datetime)
head(akl_hourly$date_utc)

# Force datetime to Pacific/Auckland
akl_hourly <- akl_hourly %>%
  mutate(
    datetime = force_tz(datetime, tzone = "Pacific/Auckland")
  )

# Reexamine datetime
head(akl_hourly$datetime)

# Are datetime and date_utc the same moments
table(akl_hourly$datetime - akl_hourly$date_utc)

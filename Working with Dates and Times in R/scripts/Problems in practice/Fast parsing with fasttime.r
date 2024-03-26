library(tidyverse)
akl_hourly <- read_csv("data/akl_weather_hourly_2016.csv")
akl_hourly <- akl_hourly |>
  mutate(
    date = make_date(year = year, month = month, day = mday),
    datetime_string = paste(date, time, sep = "T"),
    datetime = as_datetime(datetime_string)
  )
dates <- akl_hourly$datetime_string
# Hemos cargado las fechas y horas de los datos por hora de Auckland
## como cadenas en el vector `dates`.

# - Examina la estructura de `dates`
## para verificar que es una cadena y está en el formato ISO 8601.
# - Analiza `dates` con `fasttime` y canaliza a `str()`
## para verificar que `fastPOSIXct` las analiza correctamente.
# - Ahora, para comparar el tiempo, llama a `microbenchmark`
## donde el primer argumento usa `ymd_hms()` para analizar `dates`
## y el segundo usa `fastPOSIXct()`.

library(microbenchmark)
library(fasttime)

# Examine structure of dates
str(dates)

# Use fastPOSIXct() to parse dates
fastPOSIXct(dates) %>% str()

# Compare speed of fastPOSIXct() to ymd_hms()
microbenchmark(
  ymd_hms = ymd_hms(dates),
  fasttime = fastPOSIXct(dates),
  times = 20
)

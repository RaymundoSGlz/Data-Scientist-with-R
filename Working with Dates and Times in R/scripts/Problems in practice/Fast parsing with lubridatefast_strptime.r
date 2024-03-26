library(tidyverse)
library(microbenchmark)
library(fasttime)
akl_hourly <- read_csv("data/akl_weather_hourly_2016.csv")
akl_hourly <- akl_hourly |>
  mutate(
    date = make_date(year = year, month = month, day = mday),
    datetime_string = paste(date, time, sep = "T"),
    datetime_string = paste0(datetime_string, "Z"),
    datetime = as_datetime(datetime_string)
  )
dates <- akl_hourly$datetime_string

# `dates` está nuevamente en tu espacio de trabajo.

# - Examina el inicio de `dates`. *¿Qué componentes están presentes?
## ¿Qué separadores se utilizan?*
# - Analiza `dates` con `fast_strptime()`
## especificando la cadena de formato adecuada.
# - Compara el tiempo de `fast_strptime()` con `fasttime` y `ymd_hms()`.

# Head of dates
head(dates)

# Parse dates with fast_strptime
fast_strptime(dates,
  format = "%Y-%m-%dT%H:%M:%SZ"
) %>% str()

# Comparse speed to ymd_hms() and fasttime
microbenchmark(
  ymd_hms = ymd_hms(dates),
  fasttime = fastPOSIXct(dates),
  fast_strptime = fast_strptime(dates,
    format = "%Y-%m-%dT%H:%M:%SZ"
  ),
  times = 20
)

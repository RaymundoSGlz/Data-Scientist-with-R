library(readr)
library(lubridate)
library(dplyr)

akl_hourly_raw <- read_csv("data/akl_weather_hourly_2016.csv")

akl_hourly <- akl_hourly_raw |>
  mutate(date = make_date(year = year, month = month, day = mday))

akl_hourly <- akl_hourly |>
  mutate(
    datetime_string = paste(date, time, sep = "T"),
    datetime = as_datetime(datetime_string)
  )

# - Crea una nueva columna llamada `day_hour` que sea `datetime`
## redondeada a la hora más cercana.
# - Usa `count()` en `day_hour` para contar cuántas observaciones hay
## en cada hora. *¿Qué parece ser el valor más común?*
# - Extiende el pipe, de modo que después de contar,
## filtras las observaciones donde `n` no es igual a `2`.

# Create day_hour, datetime rounded down to hour
akl_hourly <- akl_hourly %>%
  mutate(
    day_hour = floor_date(datetime, unit = "hour")
  )

# Count observations per hour
akl_hourly %>%
  count(day_hour)

# Find day_hours with n != 2
akl_hourly %>%
  count(day_hour) %>%
  filter(n != 2) %>%
  arrange(desc(n))

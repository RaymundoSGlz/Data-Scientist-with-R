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

# - Crea nuevas columnas para la hora y el mes
## de la observación desde `datetime`. Asegúrate de etiquetar el mes.
# - Filtra solo las observaciones diurnas,
## donde la hora es mayor o igual a `8` y menor o igual a `22`.
# - Agrupa las observaciones primero por `mes`, luego por `fecha`,
## y resume utilizando `any()` en la columna `rainy`.
## *Esto resulta en un valor por día*
# - Resume nuevamente sumando `any_rain`. *Esto resulta en un valor por mes*

# Create new columns hour, month and rainy
akl_hourly <- akl_hourly %>%
  mutate(
    hour = hour(datetime),
    month = month(datetime, label = TRUE),
    rainy = weather == "Precipitation"
  )

# Filter for hours between 8am and 10pm (inclusive)
akl_day <- akl_hourly %>%
  filter(hour >= 8, hour <= 22)

# Summarise for each date if there is any rain
rainy_days <- akl_day %>%
  group_by(month, date) %>%
  summarise(
    any_rain = any(rainy)
  )

# Summarise for each month, the number of days with rain
rainy_days %>%
  summarise(
    days_rainy = sum(any_rain)
  )

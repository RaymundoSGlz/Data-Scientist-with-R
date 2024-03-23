# - Importa los datos por hora,`"akl_weather_hourly_2016.csv"` con `read_csv()`,
## luego imprime `akl_hourly_raw`
## para confirmar que la fecha se distribuye en `year`, `month` y `mday`.
# - Usando `mutate()` crea la columna `date` con `make_date()`.
# - Hemos pegado juntas las columnas `date` y `time`.
## Crea `datetime` analizando la columna `datetime_string`.
# - Echa un vistazo a las columnas `date`, `time` y `datetime`
## para verificar que coinciden.
# - Echa un vistazo a los datos trazando `datetime` en el eje x
## y `temperature` en el eje y.

library(lubridate)
library(readr)
library(dplyr)
library(ggplot2)

# Import "akl_weather_hourly_2016.csv"
akl_hourly_raw <- read_csv("data/akl_weather_hourly_2016.csv")

# Print akl_hourly_raw
akl_hourly_raw

# Use make_date() to combine year, month and mday
akl_hourly <- akl_hourly_raw %>%
  mutate(date = make_date(year = year, month = month, day = mday))

# Parse datetime_string
akl_hourly <- akl_hourly %>%
  mutate(
    datetime_string = paste(date, time, sep = "T"),
    datetime = as_datetime(datetime_string)
  )

# Print date, time and datetime columns of akl_hourly
akl_hourly %>% select(date, time, datetime)

# Plot to check work
ggplot(akl_hourly, aes(x = datetime, y = temperature)) +
  geom_line()

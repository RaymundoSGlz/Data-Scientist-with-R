# - Importa los datos diarios, `"akl_weather_daily.csv"` con `read_csv()`.
# - Imprime `akl_daily_raw` para confirmar que la columna `date`
## no ha sido interpretada como una fecha. *¿Puedes ver por qué?*
# - Usa `mutate()` para sobrescribir la columna `date`
## con una versión analizada de `date`.
## Necesitas especificar la función de análisis.
## Pista: la primera fecha debe ser el 1 de septiembre.
# - Imprime `akl_daily` para verificar que la columna `date`
## es ahora una `Date`.
# - Echa un vistazo a los datos trazando `date` en el eje x
## y `max_temp` en el eje y.

library(lubridate)
library(readr)
library(dplyr)
library(ggplot2)

# Import CSV with read_csv()
akl_daily_raw <- read_csv("data/akl_weather_daily.csv")

# Print akl_daily_raw
akl_daily_raw

# Parse date
akl_daily <- akl_daily_raw %>%
  mutate(date = as.Date(date))

# Print akl_daily
akl_daily

# Plot to check work
ggplot(akl_daily, aes(x = date, y = max_temp)) +
  geom_line()

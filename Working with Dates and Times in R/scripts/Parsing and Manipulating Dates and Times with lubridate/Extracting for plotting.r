library(readr)
library(lubridate)
akl_daily <- read_csv("data/akl_weather_daily.csv")

akl_daily$date <- as.Date(akl_daily$date)

# - Usa `mutate()` para crear tres nuevas columnas: `year`, `yday` y `month`
# que contengan respectivamente los mismos componentes de la columna `date`.
## No olvides etiquetar los meses con sus nombres.
# - Crea un gráfico de `yday` en el eje x, `max_temp` en el eje y
## donde las líneas estén agrupadas por `year`.
## *Cada año es una línea en este gráfico,
## con el eje x que va desde el 1 de enero hasta el 31 de diciembre.*
# - Para tener una visión alternativa,
## crea un gráfico de líneas de montaña (anteriormente conocido como un joyplot)
## con `max_temp` en el eje x, `month` en el eje y,
## usando `geom_density_ridges()` del paquete `ggridges`.

library(ggplot2)
library(dplyr)
library(ggridges)

# Add columns for year, yday and month
akl_daily <- akl_daily %>%
  mutate(
    year = year(date),
    yday = yday(date),
    month = month(date, label = TRUE)
  )

# Plot max_temp by yday for all years
ggplot(akl_daily, aes(x = yday, y = max_temp)) +
  geom_line(aes(group = year), alpha = 0.5)

# Examine distribution of max_temp by month
ggplot(akl_daily, aes(x = max_temp, y = month, height = ..density..)) +
  geom_density_ridges(stat = "density")

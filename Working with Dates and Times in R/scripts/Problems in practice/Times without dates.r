library(tidyverse)
# - Usa `read_csv()` para leer `"akl_weather_hourly_2016.csv"`.
## *`readr` conoce la clase `hms`,
## por lo que si se encuentra con algo que parece un tiempo, la utilizará*.
# - En este caso, la columna `time`
## se ha analizado como un tiempo sin una fecha.
## Echa un vistazo a la estructura de la columna `time`
## para verificar que tiene la clase `hms`.
# - Los objetos `hms` se imprimen como deberían los tiempos.
## Echa un vistazo examinando el encabezado de la columna `time`.
# - También puedes usar objetos `hms` en los gráficos.
## Crea un gráfico con `time` en el eje x, `temperature` en el eje y,
## con líneas agrupadas por `date`.

# Import auckland hourly data
akl_hourly <- read_csv("data/akl_weather_hourly_2016.csv")

# Examine structure of time column
str(akl_hourly$time)

# Examine head of time column
head(akl_hourly$time)

# A plot using just time
ggplot(akl_hourly, aes(x = time, y = temperature)) +
  geom_line(aes(group = make_date(year, month, mday)), alpha = 0.2)

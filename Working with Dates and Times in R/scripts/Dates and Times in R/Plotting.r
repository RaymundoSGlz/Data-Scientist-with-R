library(readr)
releases <- read_csv("data/rversions.csv")

# - Haz un gráfico de las versiones a lo largo del tiempo
## estableciendo el argumento `x` de la función `aes()` en la columna `fecha`.
# - Acércate al período de 2010 a 2014 especificando límites desde
## `"2010-01-01"` hasta `"2014-01-01"`.
## *Observa que estas cadenas necesitan estar envueltas en `as.Date()`
## para ser interpretadas como objetos `Fecha`*.
# - Ajusta la etiquetado del eje especificando `date_breaks`
## de `"10 years"` y `date_labels` de `"%Y"`.

library(ggplot2)

# Set the x axis to the date column
ggplot(releases, aes(x = date, y = type)) +
  geom_line(aes(group = 1, color = factor(major)))

# Limit the axis to between 2010-01-01 and 2014-01-01
ggplot(releases, aes(x = date, y = type)) +
  geom_line(aes(group = 1, color = factor(major))) +
  xlim(as.Date("2010-01-01"), as.Date("2014-01-01"))

# Specify breaks every ten years and labels with "%Y"
ggplot(releases, aes(x = date, y = type)) +
  geom_line(aes(group = 1, color = factor(major))) +
  scale_x_date(date_breaks = "10 years", date_labels = "%Y")

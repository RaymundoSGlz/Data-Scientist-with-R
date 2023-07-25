library(ggplot2)
library(openair)
library(dplyr)
wind <- mydata |>
  select(date, ws, wd) |>
  # Eliminar valores atípicos
  filter(ws <= 14) |>
  # Creamos grupos de ws
  mutate(ws = cut(ws, breaks = c(0, 2, 4, 6, 8, 10, 12, 14))) |>
  # Creamos 16 grupos de wd
  mutate(wd = cut(wd, breaks = 16)) |>
  # Eliminar NA
  na.omit()
# Hacer un gráfico de barras clásico que mapee wd en el estético x
# y ws en relleno.
# Use una capa geom_bar (), ya que queremos agregar
# todos los valores de fecha, y establezca el argumento de ancho en 1,
# para eliminar cualquier espacio entre las barras.

# Using wind, plot wd filled by ws
ggplot(wind, aes(wd, fill = ws)) +
  # Add a bar layer with width 1
  geom_bar(width = 1)

# Convertir a coordenadas polares con coord_polar()
# Convert to polar coordinates:
ggplot(wind, aes(wd, fill = ws)) +
  geom_bar(width = 1) +
  coord_polar()

# Establecer el argumento de inicio en -pi / 16
# para posicionar el norte en la parte superior del gráfico.

# Convert to polar coordinates:
ggplot(wind, aes(wd, fill = ws)) +
  geom_bar(width = 1) +
  coord_polar(start = -pi / 16)

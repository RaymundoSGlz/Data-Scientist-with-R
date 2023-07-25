library(ggplot2)
# 1. Agregar coordenadas cartesianas con expansión cero,
# para eliminar todos los márgenes de búfer tanto en los ejes x como en los y.

ggplot(mtcars, aes(wt, mpg)) +
  geom_point(size = 2) +
  # Add Cartesian coordinates with zero expansion
  coord_cartesian(expand = 0) +
  theme_classic()

# 2. Establecer la expansión en 0
# hizo que los puntos en el borde del panel de trazado se cortaran.
# Establezca el argumento de clip en "off" para evitar esto.
# Elimine las líneas de los ejes estableciendo el argumento
# de línea de eje en element_blank () en la función de capa theme().

ggplot(mtcars, aes(wt, mpg)) +
  geom_point(size = 2) +
  # Turn clipping off
  coord_cartesian(expand = 0, clip = "off") +
  theme_classic() +
  # Remove axis lines
  theme(axis.line = element_blank())

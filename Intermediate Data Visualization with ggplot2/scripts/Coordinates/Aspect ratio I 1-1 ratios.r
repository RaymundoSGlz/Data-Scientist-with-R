library(ggplot2)
# Agregar una capa de coordenadas fijas para forzar una relación de aspecto 1:1

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_jitter() +
  geom_smooth(method = "lm", se = FALSE) +
  # Fix the coordinate ratio
  coord_fixed()

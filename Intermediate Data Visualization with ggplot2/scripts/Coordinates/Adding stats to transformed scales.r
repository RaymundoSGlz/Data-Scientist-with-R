library(ggplot2)
# 1. Agregar escalas transformadas log10 a los ejes x e y.

# Plot with a scale_*_*() function:
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  # Add a log10 x scale
  scale_x_log10() +
  # Add a log10 y scale
  scale_y_log10() +
  ggtitle("Scale functions")

# 2. Agregue una transformación de coordenadas log10
# tanto para los ejes x como para los y.
# ¿Notas la diferencia entre los dos gráficos?

# Plot with transformed coordinates
ggplot(msleep, aes(bodywt, brainwt)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  # Add a log10 coordinate transformation for x and y axes
  coord_trans(x = "log10", y = "log10")

library(ggplot2)
# 1. Actualizar el gráfico para facetar columnas por cyl.

ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Facet columns by cyl
  facet_grid(cols = vars(cyl))

# 2. Actualizar el facetado para que las escalas del eje x sean libres.

ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Update the faceting to free the x-axis scales
  facet_grid(cols = vars(cyl), scales = "free_x")

# 3. Facetar filas por cyl (en lugar de columnas).
# Escalas y libres (en lugar de x).

ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Swap cols for rows; free the y-axis scales
  facet_grid(rows = vars(cyl), scales = "free_y")

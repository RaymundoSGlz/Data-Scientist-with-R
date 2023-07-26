library(ggplot2)
# 1. Divide el gráfico en una cuadrícula,
# con cada valor de "am" en su propia fila.

ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Facet rows by am using formula notation
  facet_grid(am ~ .)

# 2. Divide el gráfico en una cuadrícula,
# con cada valor de "cyl" en su propia columna.

ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Facet columns by cyl using formula notation
  facet_grid(. ~ cyl)

# 3. Divide el gráfico en una cuadrícula,
# con cada valor de "am" en su propia fila
# y cada valor de "cyl" en su propia columna.

ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Facet rows by am and columns by cyl using formula notation
  facet_grid(am ~ cyl)

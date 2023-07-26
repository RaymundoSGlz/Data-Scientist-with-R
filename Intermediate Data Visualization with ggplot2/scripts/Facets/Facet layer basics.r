library(ggplot2)
# 1. Divide el gráfico en una cuadrícula,
# con cada valor de "am" en su propia fila.

ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Facet rows by am
  facet_grid(rows = vars(am))

# 2. Divide el gráfico en una cuadrícula,
# con cada valor de "cyl" en su propia columna.

ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Facet columns by cyl
  facet_grid(cols = vars(cyl))

# 3. Divide el gráfico en una cuadrícula,
# con cada valor de "am" en su propia fila y
# cada valor de "cyl" en su propia columna.

ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Facet rows by am and columns by cyl
  facet_grid(rows = vars(am), cols = vars(cyl))

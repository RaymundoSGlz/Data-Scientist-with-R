library(ggplot2)
library(dplyr)
fam <- c(
  1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1
)
mtcars <- mtcars %>%
  mutate(fam = factor(fam,
    labels = c("automatic", "manual")
  )) %>%
  mutate(fcyl = factor(cyl))
mtcars <- mtcars %>%
  mutate(car = rownames(mtcars)) %>%
  mutate(car = factor(car))
# 1. Dividir el gráfico por filas según gear usando vars().
# Observe que cada automóvil está listado en cada faceta,
# lo que resulta en muchas líneas sin datos.

ggplot(mtcars, aes(x = mpg, y = car, color = fam)) +
  geom_point() +
  # Facet rows by gear
  facet_grid(rows = vars(gear))

# 2. Para eliminar las líneas en blanco, establezca los argumentos
# de escalas y espacio en facet_grid() en free_y.

ggplot(mtcars, aes(x = mpg, y = car, color = fam)) +
  geom_point() +
  # Free the y scales and space
  facet_grid(rows = vars(gear), scales = "free_y", space = "free_y")

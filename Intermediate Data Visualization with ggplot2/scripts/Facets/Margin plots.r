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
  mutate(fcyl = factor(cyl), fvs = factor(vs))
# 1. Actualizar el gráfico para facetar las filas por fvs y fam,
# y las columnas por gear.

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  # Facet rows by fvs and cols by fam
  facet_grid(rows = vars(fvs, fam), cols = vars(gear))

# 2. Agregar todos los márgenes posibles al gráfico.

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  # Update the facets to add margins
  facet_grid(rows = vars(fvs, fam), cols = vars(gear), margins = TRUE)

# 3. Actualizar los márgenes para mostrar solo los márgenes en "fam".

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  # Update the facets to only show margins on fam
  facet_grid(rows = vars(fvs, fam), cols = vars(gear), margins = "fam")

# 4. Actualizar los márgenes para mostrar solo los márgenes en "gear" y "fvs".

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  # Update the facets to only show margins on gear and fvs
  facet_grid(
    rows = vars(fvs, fam), cols = vars(gear),
    margins = c("gear", "fvs")
  )

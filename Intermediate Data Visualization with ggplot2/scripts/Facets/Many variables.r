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
  mutate(fcyl_fam = interaction(fcyl, fam, sep = ":"))

# 1. Mapear fcyl_fam en la estética de color.
# Agregar una capa scale_color_brewer() y establecer "Paired" como la paleta.

# See the interaction column
mtcars$fcyl_fam

# Color the points by fcyl_fam
ggplot(mtcars, aes(x = wt, y = mpg, color = fcyl_fam)) +
  geom_point() +
  # Use a paired color palette
  scale_color_brewer(palette = "Paired")

# 2. Mapear disp, el volumen de desplazamiento de cada cilindro,
# en la estética de tamaño.

# Update the plot to map disp to size
ggplot(mtcars, aes(x = wt, y = mpg, color = fcyl_fam, size = disp)) +
  geom_point() +
  scale_color_brewer(palette = "Paired")


# 3. Agregar una capa facet_grid(), dividiendo el gráfico
# según gear en filas y vs en columnas.

# Update the plot
ggplot(mtcars, aes(x = wt, y = mpg, color = fcyl_fam, size = disp)) +
  geom_point() +
  scale_color_brewer(palette = "Paired") +
  # Grid facet on gear and vs
  facet_grid(rows = vars(gear), cols = vars(vs))

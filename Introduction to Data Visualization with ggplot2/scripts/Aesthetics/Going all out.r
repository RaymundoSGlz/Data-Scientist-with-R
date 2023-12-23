library(ggplot2)
library(dplyr)
mtcars <- mtcars %>%
  mutate(fcyl = factor(cyl), fam = factor(am))

# 1. Use mtcars para dibujar un gráfico de qsec vs. mpg, coloreado por fcyl.
# Agregue una capa de puntos.

# 3 aesthetics: qsec vs. mpg, colored by fcyl
ggplot(mtcars, aes(mpg, qsec, color = fcyl)) +
  # Add points layer
  geom_point()

# 2. Agregue otro estético: mapee fam sobre shape.

# 4 aesthetics: add a mapping of shape to fam
ggplot(mtcars, aes(mpg, qsec, color = fcyl, shape = fam)) +
  geom_point()

# 3. Agregue otros dos estéticos: mapee hp dividido por wt sobre size.

# 5 aesthetics: add a mapping of size to hp / wt
ggplot(mtcars, aes(mpg, qsec,
  color = fcyl,
  shape = fam, size = hp / wt
)) +
  geom_point()

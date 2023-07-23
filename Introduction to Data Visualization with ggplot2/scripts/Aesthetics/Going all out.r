library(ggplot2)
library(dplyr)
fam <- c(
    "manual", "manual", "manual", "automatic", "automatic", "automatic", "automatic",
    "automatic", "automatic", "automatic", "automatic", "automatic", "automatic", "automatic",
    "automatic", "automatic", "automatic", "manual", "manual", "manual", "automatic",
    "automatic", "automatic", "automatic", "automatic", "manual", "manual", "manual",
    "manual", "manual", "manual", "manual"
)
mtcars <- mtcars %>% mutate(fam = factor(fam))

# 1. Use mtcars para dibujar un gráfico de qsec vs. mpg, coloreado por fcyl.
# Agregue una capa de puntos.

# 3 aesthetics: qsec vs. mpg, colored by fcyl
ggplot(mtcars, aes(mpg, qsec, color = factor(cyl))) +
    # Add points layer
    geom_point()

# 2. Agregue otro estético: mapee fam sobre shape.

# 4 aesthetics: add a mapping of shape to fam
ggplot(mtcars, aes(mpg, qsec, color = factor(cyl), shape = fam)) +
    geom_point()

# 3. Agregue otros dos estéticos: mapee hp dividido por wt sobre size.

# 5 aesthetics: add a mapping of size to hp / wt
ggplot(mtcars, aes(mpg, qsec,
    color = factor(cyl),
    shape = fam, size = hp / wt
)) +
    geom_point()

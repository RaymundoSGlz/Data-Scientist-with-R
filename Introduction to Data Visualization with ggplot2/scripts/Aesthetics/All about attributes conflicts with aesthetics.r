library(ggplot2)
library(dplyr)
mtcars <- mtcars %>% mutate(fcyl = factor(cyl))
# 1. Agregar una capa de puntos, estableciendo alpha, la transparencia, en 0.5.

ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
    # Add point layer with alpha 0.5
    geom_point(alpha = 0.5)

# 2. Agregar una capa de texto,
# estableciendo la etiqueta en los nombres de fila del conjunto de datos mtcars,
# y el color en "red".

ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
    # Add text layer with label rownames(mtcars) and color red
    geom_text(label = rownames(mtcars), color = "red")

# 3. Agregar una capa de puntos, estableciendo shape en 24 y color en "yellow".
ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
    # Add points layer with shape 24 and color yellow
    geom_point(shape = 24, color = "yellow")

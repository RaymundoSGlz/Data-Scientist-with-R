library(ggplot2)
# 1. Explícitamente etiquetar los valores 0 y 1 de la columna am como
# "automatic" y "manual", respectivamente.

# Make factor, set proper labels explicitly
mtcars$fam <- factor(mtcars$am, labels = c(
  `0` = "automatic",
  `1` = "manual"
))
# Default order is alphabetical
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  facet_grid(cols = vars(fam))

# 2. Definir un orden específico usando los argumentos
# separate levels y labels. Recuerda que 1 es "manual" y 0 es "automatic".

# Make factor, set proper labels explictly, and
# manually set the label order
mtcars$fam <- factor(mtcars$am,
  levels = c(1, 0),
  labels = c("manual", "automatic")
)

# View again
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  facet_grid(cols = vars(fam))

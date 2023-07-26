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
# Usando mtcars, graficar wt versus fcyl.
# Agregar una barra de estadísticas resumiendo,
# agregando los wts por su media, llenando las barras en un color skyblue.
# Agregar una barra de error de estadísticas resumiendo,
# agregando los wts por mean_sdl.

# Plot wt vs. fcyl
ggplot(mtcars, aes(x = fcyl, y = wt)) +
  # Add a bar summary stat of means, colored skyblue
  stat_summary(fun = mean, geom = "bar", fill = "skyblue") +
  # Add an errorbar summary stat std deviation limits
  stat_summary(
    fun.data = mean_sdl,
    fun.args = list(mult = 1), geom = "errorbar", width = 0.1
  )

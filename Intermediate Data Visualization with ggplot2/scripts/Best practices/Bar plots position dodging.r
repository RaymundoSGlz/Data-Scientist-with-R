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
# Agregar dos estéticas más para que las barras
# estén coloreadas y llenas por fam.

# Update the aesthetics to color and fill by fam
ggplot(mtcars, aes(x = fcyl, y = wt, color = fam, fill = fam)) +
  stat_summary(fun = mean, geom = "bar") +
  stat_summary(
    fun.data = mean_sdl,
    fun.args = list(mult = 1),
    geom = "errorbar", width = 0.1
  )

# Las barras apiladas son difíciles de interpretar.
# Hacerlas transparentes y lado a lado.
# Hacer la estadística de resumen de barras transparente
# estableciendo alpha en 0.5.
# Para cada una de las estadísticas de resumen,
# establezca la posición de las barras en "dodge".

# Set alpha for the first and set position for each stat summary function
ggplot(mtcars, aes(x = fcyl, y = wt, color = fam, fill = fam)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge", alpha = 0.5) +
  stat_summary(
    fun.data = mean_sdl,
    fun.args = list(mult = 1),
    geom = "errorbar", position = "dodge", width = 0.1
  )

# Las barras de error están posicionadas incorrectamente.
# Use un objeto de posición dodge con ancho 0.9, asignado a posn_d.
# Para cada una de las estadísticas de resumen,
# establezca la posición de las barras en posn_d.

# Define a dodge position object with width 0.9
posn_d <- position_dodge(width = 0.9)
# For each summary stat, update the position to posn_d
ggplot(mtcars, aes(x = fcyl, y = wt, color = fam, fill = fam)) +
  stat_summary(fun = mean, geom = "bar", position = posn_d, alpha = 0.5) +
  stat_summary(
    fun.data = mean_sdl,
    fun.args = list(mult = 1), width = 0.1,
    position = posn_d, geom = "errorbar"
  )

library(ggplot2)
library(dplyr)
fam <- c(
  "manual", "manual", "manual", "automatic", "automatic", "automatic",
  "automatic", "automatic", "automatic", "automatic", "automatic",
  "automatic", "automatic", "automatic", "automatic", "automatic",
  "automatic", "manual", "manual", "manual", "automatic",
  "automatic", "automatic", "automatic", "automatic", "manual",
  "manual", "manual", "manual", "manual", "manual", "manual"
)
mtcars <- mtcars %>%
  mutate(fam = factor(fam)) %>%
  mutate(fcyl = factor(cyl))

posn_j <- position_jitter(width = 0.2)
posn_d <- position_dodge(width = 0.1)
posn_jd <- position_jitterdodge(jitter.width = 0.2, dodge.width = 0.1)

p_wt_vs_fcyl_by_fam <- ggplot(mtcars, aes(x = fcyl, y = wt, color = fam))
p_wt_vs_fcyl_by_fam_jit <- p_wt_vs_fcyl_by_fam + geom_jitter(position = posn_j)

# 1. Agregar barras de error que representen la desviación estándar.
# Establezca la función de datos en mean_sdl (sin paréntesis).
# Dibuje 1 desviación estándar a cada lado de la media,
# pase argumentos a la función mean_sdl ()
# asignándolos a fun.args en forma de lista.
# Use posn_d para establecer la posición.

p_wt_vs_fcyl_by_fam_jit +
  # Add a summary stat of std deviation limits
  stat_summary(
    # Set the function to mean_sdl
    fun.data = mean_sdl,
    # Draw 1 standard deviation on each side of the mean
    fun.args = list(mult = 1),
    # Set the position to dodge
    position = posn_d
  )

# 2. El geom predeterminado para stat_summary ()
# es "pointrange", que ya es genial.
# Actualice el resumen stat para usar un
# geom "errorbar" asignándolo al argumento geom.

p_wt_vs_fcyl_by_fam_jit +
  # Change the geom to be an errorbar
  stat_summary(
    fun.data = mean_sdl,
    fun.args = list(mult = 1),
    position = posn_d,
    # Set the geom to be an errorbar
    geom = "errorbar"
  )

# 3. Actualice la gráfica para agregar un resumen stat
# de límites de confianza del 95%.
# Establezca la función de datos en mean_cl_normal (sin paréntesis).
# Nuevamente, use la posición dodge.

p_wt_vs_fcyl_by_fam_jit +
  # Add a summary stat of normal confidence limits
  stat_summary(
    fun.data = mean_cl_normal,
    fun.args = list(mult = 1),
    position = posn_d,
    geom = "errorbar"
  )

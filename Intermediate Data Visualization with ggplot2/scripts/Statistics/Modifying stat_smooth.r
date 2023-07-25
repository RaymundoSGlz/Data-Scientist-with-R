library(ggplot2)
# 1. Explorar el efecto del argumento de span en las curvas LOESS.
# Agregue tres estadísticas LOESS suaves,
# cada una sin la cinta de error estándar.

# Color del 1º "red"; establezca su span en 0.9.
# Color del 2º "green"; establezca su span en 0.6.
# Color del 3º "blue"; establezca su span en 0.3.
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  # Add 3 smooth LOESS stats, varying span & color
  stat_smooth(span = 0.9, color = "red", se = FALSE) +
  stat_smooth(span = 0.6, color = "green", se = FALSE) +
  stat_smooth(span = 0.3, color = "blue", se = FALSE)

# 2. Compare el suavizado de regresión LOESS y lineal
# en pequeñas regiones de datos.
# Agregue una estadística LOESS suave, sin la cinta de error estándar.
# Agregue una estadística de regresión lineal suave,
# nuevamente sin la cinta de error estándar.

# Amend the plot to color by fcyl
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  # Add a smooth LOESS stat, no ribbon
  stat_smooth(se = FALSE) +
  # Add a smooth lin. reg. stat, no ribbon
  stat_smooth(method = "lm", se = FALSE)

# 3. LOESS no es genial en secciones muy cortas de datos;
# compare las piezas de regresión lineal con LOESS sobre todo.
# Modifique la estadística LOESS suave para asignar el color
# a una variable dummy, "All".

# Amend the plot
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  # Map color to dummy variable "All"
  stat_smooth(aes(color = "All"), se = FALSE) +
  stat_smooth(method = "lm", se = FALSE)

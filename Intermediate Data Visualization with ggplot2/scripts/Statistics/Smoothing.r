library(ggplot2)
# 1. Observar la estructura de mtcars.
# Usando mtcars, dibuja un gráfico de dispersión de mpg vs. wt.

# View the structure of mtcars
str(mtcars)

# Using mtcars, draw a scatter plot of mpg vs. wt
ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point()

# 2.  Actualiza el gráfico para agregar una línea de tendencia suave.
# Utilice el método predeterminado, que utiliza el modelo LOESS
# para ajustar la curva.

# Amend the plot to add a smooth layer
ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    geom_smooth()

# 3. Actualiza la capa suave.
# Aplica un modelo lineal estableciendo el método en "lm"
# y desactiva el intervalo de confianza del 95% del modelo (la cinta)
# estableciendo se en FALSE.

# Amend the plot. Use lin. reg. smoothing; turn off std err ribbon
ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE)

# 4. Dibuja el mismo gráfico nuevamente,
# intercambiando geom_smooth () por stat_smooth ().

# Amend the plot. Swap geom_smooth() for stat_smooth().
ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point() +
    stat_smooth(method = "lm", se = FALSE)

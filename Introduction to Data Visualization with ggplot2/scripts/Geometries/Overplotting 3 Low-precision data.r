library(ggplot2)
# 1. Cambiar la capa de puntos en una capa de jitter.
# Reducir el ancho de la capa de jitter estableciendo el argumento width en 0.1.

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
    # Swap for jitter layer with width 0.1
    geom_jitter(alpha = 0.5, width = 0.1)

# 2. Usemos un enfoque diferente:
# Dentro de geom_point(), establezca position en "jitter".

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
    # Set the position to jitter
    geom_point(alpha = 0.5, position = "jitter")

# 3. Proporcione una especificación alternativa:
# Haga que el argumento position llame a position_jitter() con un ancho de 0.1.

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
    # Use a jitter position function with width 0.1
    geom_point(alpha = 0.5, position = position_jitter(width = 0.1))

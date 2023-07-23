library(ggplot2)
# 1 Mapear mpg en el estético x y fcyl en el estético y

# Map x to mpg and y to fcyl
ggplot(mtcars, aes(mpg, cyl)) +
    geom_point()

# 2 Intercambiar el mapeo del primer gráfico:
# fcyl en el estético x y mpg en el estético y.

# Map x to cyl and y to mpg
ggplot(mtcars, aes(cyl, mpg)) +
    geom_point()

# 3 Mapear wt en el estético x, mpg en el estético y
# y fcyl en el estético color.

# Map x to wt, y to mpg and color to fcyl
ggplot(mtcars, aes(wt, mpg, color = cyl)) +
    geom_point()

# 4 Modificar la capa de puntos del gráfico anterior
# cambiando el argumento shape a 1 y aumentando el size a 4.

ggplot(mtcars, aes(wt, mpg, color = cyl)) +
    # Set the shape and size of the points
    geom_point(shape = 1, size = 4)

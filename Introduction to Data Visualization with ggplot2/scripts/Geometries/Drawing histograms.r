library(ggplot2)
# 1. Usando mtcars, mapee mpg en el estético x.
# Agregue una capa de histograma usando geom_histogram ().

# Plot mpg
ggplot(mtcars, aes(x = mpg)) +
    # Add a histogram layer
    geom_histogram()

# 2. Establezca el binwidth del histograma en 1.

ggplot(mtcars, aes(mpg)) +
    # Set the binwidth to 1
    geom_histogram(binwidth = 1)

# 3. Mapee y a la variable interna ..density..
# para mostrar densidades de frecuencia.

# Map y to ..density..
ggplot(mtcars, aes(mpg, after_stat(density))) +
    geom_histogram(binwidth = 1)

# 4. Establezca el color de relleno de las barras del histograma
# en datacamp_light_blue.

datacamp_light_blue <- "#51A8C9"

ggplot(mtcars, aes(mpg, after_stat(density))) +
    # Set the fill color to datacamp_light_blue
    geom_histogram(binwidth = 1, fill = datacamp_light_blue)

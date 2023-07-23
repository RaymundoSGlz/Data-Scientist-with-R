library(ggplot2)
library(dplyr)
mtcars <- mtcars %>% mutate(fcyl = factor(cyl))
# 1. Establecer el color de los puntos a my_blue y el alfa a 0.6.

# A hexadecimal color
my_blue <- "#4ABEFF"

ggplot(mtcars, aes(wt, mpg)) +
    # Set the point color and alpha
    geom_point(color = my_blue, alpha = 0.6)

# 2. Cambiar el mapeo de color a un mapeo de relleno.
# Es decir, fcyl debe asignarse a fill.
# Establezca el color de los puntos en my_blue,
# el size en 10 y el shape en 1.

# A hexadecimal color
my_blue <- "#4ABEFF"

# Change the color mapping to a fill mapping
ggplot(mtcars, aes(wt, mpg, fill = fcyl)) +
    # Set point size and shape
    geom_point(color = my_blue, size = 10, shape = 1)

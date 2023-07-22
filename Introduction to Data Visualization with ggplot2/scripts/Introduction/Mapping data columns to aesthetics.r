# Agregar un color estético mapeado a la desplazamiento del motor del automóvil:
# dentro de aes (), agregue un argumento de color igual a disp.

# Load the ggplot2 package
library(ggplot2)

# Edit to add a color aesthetic mapped to disp
ggplot(mtcars, aes(wt, mpg, color = disp)) +
    geom_point()

# Esta vez, mapea disp al estético de tamaño.

# Edit to add a size aesthetic mapped to disp
ggplot(mtcars, aes(wt, mpg, size = disp)) +
    geom_point()

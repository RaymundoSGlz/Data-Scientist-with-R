# Cambiar el comando ggplot() envolviendo factor() alrededor de cyl.

# Load the ggplot2 package
library(ggplot2)

# Change the command below so that cyl is treated as factor
ggplot(mtcars, aes(factor(cyl), mpg)) +
    geom_point()

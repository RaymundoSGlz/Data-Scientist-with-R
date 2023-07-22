# Cargar el paquete ggplot2 usando library().
# Use str() para explorar la estructura del conjunto de datos mtcars.

# Load the ggplot2 package
library(ggplot2)

# Explore the mtcars data frame with str()
str(mtcars)

# Execute the following command
ggplot(mtcars, aes(cyl, mpg)) +
    geom_point()

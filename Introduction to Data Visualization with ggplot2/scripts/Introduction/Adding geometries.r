# Explorar el data frame diamonds con la función str().

# El dataset Diamonds esta incluido en la librería ggplot2
library(ggplot2)

# Explore the diamonds data frame with str()
str(diamonds)

# Editar el código del gráfico para agregar una geometría de punto.
# Use el operador + para agregar geom_point() al comando ggplot().

# Add geom_point() with +
ggplot(diamonds, aes(carat, price)) +
    geom_point() +

    # Agregar una geometría suave al gráfico.
    # Use el operador + para agregar geom_smooth().
    geom_smooth()

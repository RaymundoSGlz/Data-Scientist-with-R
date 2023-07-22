library(ggplot2)
# Editar el código del gráfico para mapear la estética de color
# a la variable clarity.

# Haga los puntos translúcidos estableciendo el argumento alpha en 0.4.

# Map the color aesthetic to clarity
ggplot(diamonds, aes(carat, price, color = clarity)) +
    geom_point(alpha = 0.4) +
    geom_smooth()

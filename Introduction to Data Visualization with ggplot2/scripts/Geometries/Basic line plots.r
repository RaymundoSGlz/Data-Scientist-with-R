library(ggplot2)
# 1. imprima el encabezado del conjunto de datos economics.
# 2. trazar unemployed vs. date como un gráfico de líneas.

# Print the head of economics
head(economics)

# Using economics, plot unemploy vs. date
ggplot(economics, aes(x = date, y = unemploy)) +
    # Make it a line plot
    geom_line()

# 2. Ajuste la estética del eje y de la trama para que represente
# la proporción de la población que está desempleada.

# Change the y-axis to the proportion of the population that is unemployed
ggplot(economics, aes(date, y = unemploy / pop)) +
    geom_line()

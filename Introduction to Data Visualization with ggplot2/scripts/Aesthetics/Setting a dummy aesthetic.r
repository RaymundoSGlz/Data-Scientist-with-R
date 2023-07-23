library(ggplot2)
# 1. Usando mtcars, trazar 0 vs. mpg.
# Haga un gráfico de dispersión y agréguele "jitter".

# Plot 0 vs. mpg
ggplot(mtcars, aes(mpg, 0)) +
    # Add jitter
    geom_point(position = "jitter")

# 2. Use ylim() para establecer los límites en el eje y de -2 a 2.
ggplot(mtcars, aes(mpg, 0)) +
    geom_jitter() +
    # Set the y-axis limits
    ylim(-2, 2)

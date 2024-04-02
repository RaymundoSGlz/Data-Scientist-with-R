library(dplyr)

# 1. Use el conjunto de datos `cars` y la interfaz de fórmula para `plot()`,
## dibuja un diagrama de dispersión de `dist` versus `speed`.

# Using cars, draw a scatter plot of dist vs. speed
plt_dist_vs_speed <- plot(dist ~ speed, data = cars)

# Oh no! The plot object is NULL
plt_dist_vs_speed

# 2. Proporciona a `pipeable_plot()` argumentos `data` y `formula`
## (en ese orden) y haz que dibuje el gráfico,
## luego devuelve `data` de manera invisible.
## - Dibuja el diagrama de dispersión de dist vs. speed
## nuevamente llamando a `pipeable_plot()`.

# Define a pipeable plot fn with data and formula args
pipeable_plot <- function(data, formula) {
  # Call plot() with the formula interface
  plot(formula, data = data)
  # Invisibly return the input dataset
  invisible(data)
}

# Draw the scatter plot of dist vs. speed again
plt_dist_vs_speed <- cars %>%
  pipeable_plot(formula = dist ~ speed)

# Now the plot object has a value
plt_dist_vs_speed

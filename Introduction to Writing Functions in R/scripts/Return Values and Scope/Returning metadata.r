library(dplyr)

# - Actualiza `pipeable_plot()` para que el resultado tenga un atributo llamado
## `"formula"` con el valor de `formula`.
# - *`plt_dist_vs_speed`, que previamente creaste, se muestra.
## * Examina su estructura actualizada.

pipeable_plot <- function(data, formula) {
  plot(formula, data)
  # Add a "formula" attribute to data
  attr(data, "formula") <- formula
  invisible(data)
}

# From previous exercise
plt_dist_vs_speed <- cars %>%
  pipeable_plot(dist ~ speed)

# Examine the structure of the result
str(plt_dist_vs_speed)

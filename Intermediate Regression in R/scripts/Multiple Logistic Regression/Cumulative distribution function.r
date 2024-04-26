library(ggplot2)
library(dplyr)

# 1. Crea un tibble que contenga tres columnas.
#   - Valores `x` como una secuencia de menos diez a diez en pasos de `0.1`.
#   - `logistic_x` hecho a partir de `x` transformado
## con la función de distribución acumulativa de la distribución logística.
#   - `logistic_x_man` hecho a partir de `x` transformado
## con una función logística calculada a partir de la ecuación
## cdf(x) = 1/(1 + exp(-x)).
#   - Verifica que ambas transformaciones logísticas
## (`logistic_x` y `logistic_x_man`) tengan
## los mismos valores con `all.equal()`.

logistic_distn_cdf <- tibble(
  # Make a seq from -10 to 10 in steps of 0.1
  x = seq(-10, 10, by = 0.1),
  # Transform x with built-in logistic CDF
  logistic_x = plogis(x),
  # Transform x with manual logistic
  logistic_x_man = 1 / (1 + exp(-x))
)

# Check that each logistic function gives the same results
all.equal(
  logistic_distn_cdf$logistic_x,
  logistic_distn_cdf$logistic_x_man
)

# 2. Usando el conjunto de datos `logistic_distn_cdf`,
## traza `logistic_x` versus `x` como un gráfico de línea.

# Using logistic_distn_cdf, plot logistic_x vs. x
ggplot(logistic_distn_cdf, aes(x = x, y = logistic_x)) +
  # Make it a line plot
  geom_line()

library(dplyr)
library(ggplot2)

# 1. Crear un tibble que contenga tres columnas.
#   - Valores de `x` como una secuencia desde menos `0.001`
## hasta `0.999` en pasos de `0.001`.
#   - `logit_p` hecho a partir de `p` transformado con la inversa
## de la función de distribución acumulativa logística.
#   - `logit_p_man` hecho a partir de `p` transformado
## con la ecuación log(p/(1-p)).
#   - Comprobar que ambas transformaciones logit (`logit_p` y `logit_p_man`)
## tienen los mismos valores con `all.equal()`.

logistic_distn_inv_cdf <- tibble(
  # Make a seq from 0.001 to 0.999 in steps of 0.001
  p = seq(0.001, 0.999, by = 0.001),
  # Transform with built-in logistic inverse CDF
  logit_p = qlogis(p),
  # Transform with manual logit
  logit_p_man = log(p / (1 - p))
)

# Check that each logistic function gives the same results
all.equal(
  logistic_distn_inv_cdf$logit_p,
  logistic_distn_inv_cdf$logit_p_man
)

# 2. Usando el conjunto de datos `logistic_distn_inv_cdf`,
## traza `logit_p` versus `p` como un gráfico de línea.

# Using logistic_distn_inv_cdf, plot logit_p vs. p
ggplot(logistic_distn_inv_cdf, aes(x = p, y = logit_p)) +
  # Make it a line plot
  geom_line()

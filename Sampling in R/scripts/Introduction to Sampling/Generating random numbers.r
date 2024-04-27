library(ggplot2)
n_numbers <- 5000

# 1. Completa el marco de datos de números aleatorios.
# - Genera `n_numbers`
## a partir de una distribución uniforme que varía de `3` a `3`.
# - Genera `n_numbers`
## a partir de una distribución normal con media `5` y desviación estándar `2`.

# Generate random numbers from ...
randoms <- data.frame(
  # a uniform distribution from -3 to 3
  uniform = runif(n_numbers, min = -3, max = 3),
  # a normal distribution with mean 5 and sd 2
  normal = rnorm(n_numbers, mean = 5, sd = 2)
)

# 2. Usando `randoms`, traza un histograma de la columna `uniform`,
## usando un ancho de bin de `0.25`.

# Plot a histogram of uniform values, binwidth 0.25
ggplot(randoms, aes(uniform)) +
  geom_histogram(binwidth = 0.25)

# 3. Usando `randoms`, traza un histograma de la columna `normal`,
## usando un ancho de bin de `0.5`.

# Plot a histogram of normal values, binwidth 0.5
ggplot(randoms, aes(normal)) +
  geom_histogram(binwidth = 0.5)
library(tibble)
library(ggplot2)

# 1. Muestra del uno al ocho, cinco veces, con reemplazo. Asigna a `five_rolls`.
#  - Calcula la media de `five_rolls`.

# Sample one to eight, five times, with replacement
five_rolls <- sample(1:8, 5, replace = TRUE)

# Calculate the mean of five_rolls
mean(five_rolls)

# 2. Replica el código de muestreo 1000 veces, asignándolo a sample_means_1000.

# Replicate the sampling code 1000 times
sample_means_1000 <- replicate(
  n = 1000,
  {
    five_rolls <- sample(1:8, size = 5, replace = TRUE)
    mean(five_rolls)
  }
)

# See the result
sample_means_1000

# 3. Crea un tibble y almacena sample_means_1000
## en una columna llamada sample_mean.

# Wrap sample_means_1000 in the sample_mean column of a tibble
sample_means <- tibble(
  sample_mean = sample_means_1000
)

# See the result
sample_means

# 4. Usando el conjunto de datos sample_means,
## traza sample_mean, convertido en un factor, como un gráfico de barras.

# Using sample_means, draw a bar plot of sample_mean as a factor
ggplot(sample_means, aes(factor(sample_mean))) +
  geom_bar()

# Actualmente, el monto promedio de las ventas de Amir es de $5000.
# Calcula cuál será su nuevo monto promedio si aumenta en un 20%
# y almacena esto en new_mean.
# La desviación estándar actual de Amir es de $2000.
# Calcula cuál será su nueva desviación estándar si aumenta en un 30%
# y almacena esto en new_sd.
# Agrega una nueva columna llamada amount al data frame new_sales,
# que contiene 36 montos simulados de una distribución normal
# con una media de new_mean y una desviación estándar de new_sd.
# Gráfica la distribución de los montos de new_sales
# usando un histograma con 10 bins.
library(dplyr)
library(ggplot2)
new_sales <- tibble(sale_num = 1:36)

# Calculate new average amount
new_mean <- 5000 * 1.2
# Calculate new standard deviation
new_sd <- 2000 * 1.3

# Simulate 36 sales
new_sales <- new_sales %>%
    mutate(amount = rnorm(36, new_mean, new_sd))

# Create histogram with 10 bins
ggplot(new_sales, aes(amount)) +
    geom_histogram(bins = 10)

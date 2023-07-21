# Crear un histograma de la columna num_users de amir_deals.
# Utilice 10 bins.
library(dplyr)
library(ggplot2)
amir_deals <- readRDS("data/seller_1.rds")

# Create a histogram of num_users
ggplot(amir_deals, aes(x = num_users)) +
    geom_histogram(bins = 10)

# Establecer la semilla en 104.
# Tome una muestra de tamaño 20 con reemplazo
# de la columna num_users de amir_deals y tome la media.

# Set seed to 104
set.seed(104)

# Sample 20 num_users with replacement from amir_deals
sample(amir_deals$num_users, 20, replace = TRUE) %>%
    # Take mean
    mean()

# Repita esto 100 veces y almacene como sample_means.
# Esto tomará 100 muestras diferentes y calculará la media de cada una.

# Repeat the above 100 times
sample_means <- replicate(
    100,
    sample(amir_deals$num_users,
        size = 20, replace = TRUE
    ) %>% mean()
)

# El data frame samples ha sido creado para usted con una columna mean,
# que contiene los valores de sample_means.
# Cree un histograma de la columna mean con 10 bins.

# Create data frame for plotting
samples <- data.frame(mean = sample_means)

# Histogram of sample means
ggplot(samples, aes(x = mean)) +
    geom_histogram(bins = 10)

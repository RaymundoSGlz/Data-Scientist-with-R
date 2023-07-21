# Establezca la semilla aleatoria en 321.
# Tome 30 muestras de tamaño 20 de all_deals$num_users y tome
# la media de cada muestra. Almacene las medias de muestra en sample_means.
# Tome la media de sample_means.
# Tome la media de la columna num_users de amir_deals.
library(dplyr)
amir_deals <- readRDS("data/seller_1.rds")
all_deals <- amir_deals |> select(product, num_users)

# Set seed to 321
set.seed(321)

# Take 30 samples of 20 values of num_users, take mean of each sample
sample_means <- replicate(30, sample(all_deals$num_users, 20) %>% mean())

# Calculate mean of sample_means
mean(sample_means)

# Calculate mean of num_users in amir_deals
mean(amir_deals$num_users)

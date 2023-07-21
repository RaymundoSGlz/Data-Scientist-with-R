# Establecer la semilla aleatoria a 31
# Tomar una muestra de 5 tratos sin reemplazo

# Cargar datos
library(readr)
library(dplyr)
amir_deals <- read_rds("data/seller_1.rds")

# Set random seed to 31
set.seed(31)

# Sample 5 deals without replacement
amir_deals %>%
    sample_n(5)

# Tomar una muestra de 5 tratos con reemplazo
amir_deals %>%
    sample_n(5, replace = TRUE)

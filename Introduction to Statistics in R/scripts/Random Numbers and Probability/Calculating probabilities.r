# COntar el numero de tratos que Amir trabajo en cada tipo de producto

# Cargar datos
library(readr)
library(dplyr)
amir_deals <- read_rds("data/seller_1.rds")

# Count the deals for each product
amir_deals %>%
    count(product) %>%
    # Crear una nueva columna llamada prob dividiendo n
    # por el numero total de tratos en los que Amir trabajo
    mutate(prob = n / sum(n))

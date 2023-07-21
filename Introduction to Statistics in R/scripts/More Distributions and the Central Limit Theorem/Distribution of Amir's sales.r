# Crear un histograma con 10 bins para visualizar la distribución del monto.

# Cargamos los datos
library(dplyr)
library(ggplot2)
library(readr)

amir_deals <- read_rds("data/seller_1.rds")

# Histogram of amount with 10 bins
ggplot(amir_deals, aes(x = amount)) +
    geom_histogram(bins = 10)

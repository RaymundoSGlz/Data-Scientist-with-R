library(dplyr)

zagat <- readRDS("data/zagat.rds")
fodors <- readRDS("data/fodors.rds")

# Carga el paquete reclin.
# Genera todos los pares posibles de registros
## entre los conjuntos de datos zagat y fodors.

# Load reclin
library(reclin2)

# Generate all possible pairs
pair(zagat, fodors)
# for reclin use pair_blocking instead of pair

# Utilice el bloqueo en pares para generar solo pares
## que tengan valores coincidentes en la columna city.

# Load reclin
library(reclin2)

# Generate pairs with same city
pair_blocking(zagat, fodors, "city")

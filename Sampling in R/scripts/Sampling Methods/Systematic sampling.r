library(tibble)
library(dplyr)
library(fst)
attrition_pop <- read_fst("data/attrition.fst")

# 1. Establezca el tamaño de la muestra en `200`.
#   - Obtenga el tamaño de la población de `attrition_pop`.
#   - Calcule el intervalo entre las filas que se van a muestrear.

# Set the sample size to 200
sample_size <- 200

# Get the population size from attrition_pop
pop_size <- nrow(attrition_pop)

# Calculate the interval
interval <- pop_size %/% sample_size

# 2. Obtenga los índices de las filas para la muestra como una secuencia
## numérica de `interval`, `2 * interval`, hasta `sample_size * interval`.
#   - Muestreo sistemático de `attrition_pop`, asignando a `attrition_sys_samp`.
#       - Agregue una columna de ID de fila a `attrition_pop`.
#       - Obtenga las filas de la población correspondientes a `row_indexes`.

# Get row indexes for the sample
row_indexes <- seq_len(sample_size) * interval

attrition_sys_samp <- attrition_pop %>%
  # Add a row ID column
  rowid_to_column() %>%
  # Get 200 rows using systematic sampling
  slice(row_indexes)

# See the result
View(attrition_sys_samp)

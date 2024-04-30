library(tibble)
library(dplyr)
library(fst)
attrition_pop <- read_fst("data/attrition.fst")

# - Ver el conjunto de datos `attrition_pop`.
## *Explóralo en el visor hasta que tengas claro lo que contiene.*
# - Establecer la semilla aleatoria a un valor de tu elección.
# - Agrega una columna de ID de fila al conjunto de datos,
## luego usa el muestreo aleatorio simple para obtener 200 filas.
# - Ver el conjunto de datos de muestra, `attrition_samp`.
## *¿Qué notas sobre los ID de las filas?*

# View the attrition_pop dataset
View(attrition_pop)

# Set the seed
set.seed(123)

attrition_samp <- attrition_pop %>%
  # Add a row ID column
  rowid_to_column() %>%
  # Get 200 rows using simple random sampling
  slice_sample(n = 200)

# View the attrition_samp dataset
View(attrition_samp)

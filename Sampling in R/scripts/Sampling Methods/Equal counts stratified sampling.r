library(dplyr)
library(fst)
attrition_pop <- read_fst("data/attrition.fst")

# 1. Utilice un muestreo estratificado con recuentos iguales en
## `attrition_pop` para obtener 30 empleados de cada grupo de `Education`.
## Es decir, agrupe por `Education` y realice una muestra aleatoria simple
## de tamaño `30` en cada grupo.
#   - Desagrupe la muestra estratificada.

# Use equal counts stratified sampling to get 30 employees
# from each Education group
attrition_eq <- attrition_pop %>%
  # Group by Education
  group_by(Education) %>%
  # Sample 30 employees from each group
  slice_sample(n = 30) %>%
  # Ungroup the data
  ungroup()

# See the results
attrition_eq

# 2. Obtenga los recuentos de empleados por nivel de
## `Education` de `attrition_eq`, ordenados por recuento descendente.
#   - Agregue una columna de `percent` de porcentajes
## (100 veces el recuento dividido por el recuento total).

# Get the counts and percents from attrition_eq
education_counts_eq <- attrition_eq %>%
  # Count the number of employees in each Education group
  count(Education, sort = TRUE) %>%
  # Add a column with the percentage of employees in each group
  mutate(percent = n / sum(n) * 100)

# See the results
education_counts_eq
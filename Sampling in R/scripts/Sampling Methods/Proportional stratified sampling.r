library(dplyr)
library(fst)
attrition_pop <- read_fst("data/attrition.fst")

# 1. Obtén los recuentos de empleados por nivel de `Educación`
## de `attrition_pop`, ordenados por recuento descendente
#   - Agrega una columna de `porcentaje` de porcentajes
## (100 veces el recuento dividido por el recuento total).

education_counts_pop <- attrition_pop %>%
  # Count the employees by Education level, sorting by n
  count(Education, sort = TRUE) %>%
  # Add a percent column
  mutate(percent = n / sum(n) * 100)

# See the results
education_counts_pop

# 2. Usa el muestreo estratificado proporcional en `attrition_pop`
## para obtener el 40% de cada grupo de `Educación`.
## Es decir, agrupa por `Educación` y realiza
## una muestra aleatoria simple de proporción `0.4` en cada grupo.
#   - Desagrupa la muestra estratificada.

attrition_strat <- attrition_pop %>%
  # Group by Education
  group_by(Education) %>%
  # Sample 40% of each group
  slice_sample(prop = 0.4) %>%
  # Ungroup the data
  ungroup()

# See the result
attrition_strat

# 3. Como lo hiciste con `attrition_pop`,
## obtén los recuentos de empleados por nivel de `Educación`
## de `attrition_strat`, ordenados por recuento descendente,
## luego agrega una columna de `porcentaje` de porcentajes.
# Use proportional stratified sampling to get 40% of each Education group

# Get the counts and percents from attrition_strat
education_counts_strat <- attrition_strat %>%
  # Count the employees by Education level, sorting by n
  count(Education, sort = TRUE) %>%
  # Add a percent column
  mutate(percent = n / sum(n) * 100)

# See the results
education_counts_strat
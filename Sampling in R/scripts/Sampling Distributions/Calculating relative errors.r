library(dplyr)
library(fst)
attrition_pop <- read_fst("data/attrition.fst")
mean_attrition_pop <- attrition_pop %>%
  summarize(mean_attrition = mean(Attrition == "Yes"))

# 1. Genera una muestra aleatoria simple de `attrition_pop` de diez filas.
##   - Resuma para calcular la proporción media de rotación de empleados
##  (`Attrition` es igual a `"Yes"`).
##   - Calcule el error relativo entre `mean_attrition_srs10`
##  y `mean_attrition_pop` como un porcentaje.

# Generate a simple random sample of 10 rows
attrition_srs10 <- attrition_pop %>%
  slice_sample(n = 10)

# Calculate the proportion of employee attrition in the sample
mean_attrition_srs10 <- attrition_srs10 %>%
  summarize(mean_attrition = mean(Attrition == "Yes"))

# Calculate the relative error percentage
rel_error_pct10 <- 100 * abs(
  mean_attrition_srs10 - mean_attrition_pop
) / mean_attrition_pop

# See the result
rel_error_pct10

# 2. Calcule el porcentaje de error relativo nuevamente.
## Esta vez, use una muestra aleatoria simple de cien filas de attrition_pop.

# Calculate the relative error percentage again with a sample of 100 rows
attrition_srs100 <- attrition_pop %>%
  slice_sample(n = 100)

mean_attrition_srs100 <- attrition_srs100 %>%
  summarize(mean_attrition = mean(Attrition == "Yes"))

rel_error_pct100 <- 100 * abs(
  mean_attrition_srs100 - mean_attrition_pop
) / mean_attrition_pop

# See the result
rel_error_pct100
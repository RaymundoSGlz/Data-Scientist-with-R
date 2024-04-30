library(dplyr)
library(ggplot2)
library(fst)
attrition_pop <- read_fst("data/attrition.fst")
# 1. Usando `attrition_pop`, traza `YearsAtCompany` como un histograma
## con un ancho de bin de `1`.

# Using attrition_pop, plot YearsAtCompany as a histogram with binwidth 1
ggplot(attrition_pop, aes(x = YearsAtCompany)) +
  geom_histogram(binwidth = 1)
# 2. Muestra 400 empleados de `attrition_pop` ponderados por `YearsAtCompany`.

# Sample 400 employees weighted by YearsAtCompany
attrition_weight <- attrition_pop %>%
  # Sample 400 employees
  slice_sample(n = 400, weight_by = YearsAtCompany)

# See the results
attrition_weight

# 3. Usando `attrition_weight`, traza `YearsAtCompany` como un histograma
## con un ancho de bin de `1`.

# Using attrition_weight, plot YearsAtCompany as a histogram with binwidth 1
ggplot(attrition_weight, aes(x = YearsAtCompany)) +
  geom_histogram(binwidth = 1)

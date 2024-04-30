library(dplyr)
library(fst)
attrition_pop <- read_fst("data/attrition.fst")

# 1. Obtenga los valores únicos de `JobRole` de `attrition_pop`.
#   - Muestree aleatoriamente cuatro valores de `JobRole` de `job_roles_pop`.

# Get unique JobRole values
job_roles_pop <- unique(attrition_pop$JobRole)

# Randomly sample four JobRole values
job_roles_samp <- sample(job_roles_pop, size = 4)

# See the result
job_roles_samp

# 2. Filtra `attrition_pop` para los roles de trabajo muestreados. Es decir,
## filtre las filas donde `JobRole` está en `job_roles_samp`.
#   - Para cada rol de trabajo en el conjunto de datos filtrado,
## tome una muestra aleatoria de diez filas.

# Filter for rows where JobRole is in job_roles_samp
attrition_filtered <- attrition_pop %>%
  filter(JobRole %in% job_roles_samp)

# Randomly sample 10 employees from each sampled job role
attrition_clus <- attrition_filtered %>%
  group_by(JobRole) %>%
  sample_n(size = 10, replace = FALSE)

# See the result
attrition_clus

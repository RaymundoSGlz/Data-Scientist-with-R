library(dplyr)
library(fst)
attrition_pop <- read_fst("data/attrition.fst")

# 1. Realiza un muestreo aleatorio simple en `attrition_pop`
## para obtener un cuarto de la población.

# Perform simple random sampling to get 0.25 of the population
attrition_srs <- attrition_pop %>%
  slice_sample(prop = 0.25)

# 2. Realiza un muestreo estratificado en `attrition_pop`
## para obtener un cuarto de la población de cada grupo
## de `RelationshipSatisfaction`. Recuerda desagrupar el resultado.

# Perform stratified sampling to get 0.25 of each relationship group
attrition_strat <- attrition_pop %>%
  group_by(RelationshipSatisfaction) %>%
  slice_sample(prop = 0.25) %>%
  ungroup()

# 3. Obtén los valores únicos de la columna `RelationshipSatisfaction`
## de `attrition_pop`.
#   - Muestra aleatoriamente `satisfaction_unique` para obtener dos valores.
#   - Realiza un muestreo por conglomerados en los grupos de satisfacción
## seleccionados, muestreando un cuarto de la *población*
## y desagrupando el resultado.

# Get unique values of RelationshipSatisfaction
satisfaction_unique <- unique(attrition_pop$RelationshipSatisfaction)

# Randomly sample for 2 of the unique satisfaction values
satisfaction_samp <- sample(satisfaction_unique, 2)

# Perform cluster sampling on the selected group getting 0.25 of the population
attrition_clust <- attrition_pop %>%
  filter(RelationshipSatisfaction %in% satisfaction_samp) %>%
  group_by(RelationshipSatisfaction) %>%
  slice_sample(n = nrow(attrition_pop) %/% 4) %>%
  ungroup()

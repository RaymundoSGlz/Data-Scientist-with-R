library(dplyr)
library(fst)
attrition_pop <- read_fst("data/attrition.fst")

attrition_srs <- attrition_pop %>%
  slice_sample(prop = 0.25)

attrition_strat <- attrition_pop %>%
  group_by(RelationshipSatisfaction) %>%
  slice_sample(prop = 0.25) %>%
  ungroup()

satisfaction_unique <- unique(attrition_pop$RelationshipSatisfaction)
satisfaction_samp <- sample(satisfaction_unique, 2)

attrition_clust <- attrition_pop %>%
  filter(RelationshipSatisfaction %in% satisfaction_samp) %>%
  group_by(RelationshipSatisfaction) %>%
  slice_sample(n = nrow(attrition_pop) %/% 4) %>%
  ungroup()

# 1. Agrupar por nivel de `RelationshipSatisfaction`.
#   - Resumir para calcular una columna llamada `mean_attrition`
## como la media de los casos donde `Attrition` es igual a `"Yes"`.

# Use the whole population dataset
mean_attrition_pop <- attrition_pop %>%
  # Group by relationship satisfaction level
  group_by(RelationshipSatisfaction) %>%
  # Calculate the proportion of employee attrition
  summarize(mean_attrition = mean(Attrition == "Yes"))

# See the result
mean_attrition_pop

# 2. Calcular la proporción de rotación de empleados para cada grupo de
## satisfacción de relación, esta vez en la muestra aleatoria simple,
## `attrition_srs`.

# Calculate the same thing for the simple random sample
mean_attrition_srs <- attrition_srs %>%
  # Group by relationship satisfaction level
  group_by(RelationshipSatisfaction) %>%
  # Calculate the proportion of employee attrition
  summarize(mean_attrition = mean(Attrition == "Yes"))

# See the result
mean_attrition_srs

# 3. Calcular la proporción de rotación de empleados para cada grupo de
## satisfacción de relación, esta vez en la muestra estratificada,
## `attrition_strat`.

# Calculate the same thing for the stratified sample
mean_attrition_strat <- attrition_strat %>%
  # Group by relationship satisfaction level
  group_by(RelationshipSatisfaction) %>%
  # Calculate the proportion of employee attrition
  summarize(mean_attrition = mean(Attrition == "Yes"))

# See the result
mean_attrition_strat

# 4. Calcular la proporción de rotación de empleados para cada grupo de
## satisfacción de relación, esta vez en la muestra de conglomerados,
## `attrition_clust`.

# Calculate the same thing for the cluster sample
mean_attrition_clust <- attrition_clust %>%
  # Group by relationship satisfaction level
  group_by(RelationshipSatisfaction) %>%
  # Calculate the proportion of employee attrition
  summarize(mean_attrition = mean(Attrition == "Yes"))

# See the result
mean_attrition_clust

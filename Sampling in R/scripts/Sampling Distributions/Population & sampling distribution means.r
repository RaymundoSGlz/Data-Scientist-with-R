library(dplyr)
library(fst)
attrition_pop <- read_fst("data/attrition.fst")
source("scripts/sampling_distribution_fun.r")

sampling_distribution_5 <- sampling_distribution_fun(5)
sampling_distribution_50 <- sampling_distribution_fun(50)
sampling_distribution_500 <- sampling_distribution_fun(500)

# 1. Utilizando `sampling_distribution_5`,
## calcula la media a través de todas las réplicas
## de `mean_attrition` (una media de medias de muestra).
## Almacena esto en una columna llamada `mean_mean_attrition`.
#  - Haz el mismo cálculo utilizando `sampling_distribution_50`
## y `sampling_distribution_500`.

# Calculate the mean across replicates of the mean attritions
## in sampling_distribution_5
mean_of_means_5 <- sampling_distribution_5 %>%
  summarize(mean_mean_attrition = mean(mean_attrition))

# Do the same for sampling_distribution_50
mean_of_means_50 <- sampling_distribution_50 %>%
  summarize(mean_mean_attrition = mean(mean_attrition))


# ... and for sampling_distribution_500
mean_of_means_500 <- sampling_distribution_500 %>%
  summarize(mean_mean_attrition = mean(mean_attrition))

# See the results
mean_of_means_5
mean_of_means_50
mean_of_means_500

# For comparison: the mean attrition in the population
attrition_pop %>%
  summarize(mean_attrition = mean(Attrition == "Yes"))

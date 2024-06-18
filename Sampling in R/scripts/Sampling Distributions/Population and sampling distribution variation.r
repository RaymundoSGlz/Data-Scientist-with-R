library(dplyr)
library(fst)
attrition_pop <- read_fst("data/attrition.fst")
source("scripts/sampling_distribution_fun.r")

sampling_distribution_5 <- sampling_distribution_fun(5)
sampling_distribution_50 <- sampling_distribution_fun(50)
sampling_distribution_500 <- sampling_distribution_fun(500)

# 1. Usando `sampling_distribution_5`,
## calcule la desviación estándar en todas las réplicas de los `mean_attrition`s
## (una desviación estándar de las medias de las muestras).
## Guarde esto en una columna llamada `sd_mean_attrition`.
#  - Haga el mismo cálculo usando `sampling_distribution_50`
## y `sampling_distribution_500`.

# Calculate the standard deviation across replicates of the mean attritions
## in sampling_distribution_5
sd_of_means_5 <- sampling_distribution_5 %>%
  summarize(sd_mean_attrition = sd(mean_attrition))

# Do the same for sampling_distribution_50
sd_of_means_50 <- sampling_distribution_50 %>%
  summarize(sd_mean_attrition = sd(mean_attrition))

# ... and for sampling_distribution_500
sd_of_means_500 <- sampling_distribution_500 %>%
  summarize(sd_mean_attrition = sd(mean_attrition))

# See the results
sd_of_means_5
sd_of_means_50
sd_of_means_500

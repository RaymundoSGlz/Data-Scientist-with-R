library(dplyr)
library(fst)
library(ggplot2)
attrition_pop <- read_fst("data/attrition.fst")

# 1. Replica el código proporcionado para que se ejecute 500 veces.
# Asigna el vector resultante de medias de muestra a mean_attritions.

# Replicate this code 500 times
mean_attritions <- replicate(
  500,
  attrition_pop %>%
    slice_sample(n = 20) %>%
    summarize(mean_attrition = mean(Attrition == "Yes")) %>%
    pull(mean_attrition)
)

# See the result
head(mean_attritions)

# 2. Crea un tibble con una columna llamada `sample_mean`
## para almacenar `mean_attritions`.
#  - Usando `sample_means`, dibuja un histograma de la columna `sample_mean`
## con un ancho de bin de `0.05`.

# Store mean_attritions in a tibble in a column named sample_mean
sample_means <- tibble(sample_mean = mean_attritions)

# Plot a histogram of the `sample_mean` column, binwidth 0.05
sample_means %>%
  ggplot(aes(x = sample_mean)) +
  geom_histogram(binwidth = 0.05)
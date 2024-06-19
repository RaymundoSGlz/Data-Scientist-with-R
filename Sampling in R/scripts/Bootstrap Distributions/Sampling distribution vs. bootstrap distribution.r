library(dplyr)
library(fst)
spotify_population <- read_fst("data/spotify_2000_2020.fst")
spotify_sample <- spotify_population %>%
  slice_sample(n = 500)

# 1. Genera una distribución de muestreo de 2000 réplicas.
#   - Muestra 500 filas de la población sin reemplazo.
#   - Calcula la estadística de interés (la media `popularity`)
##    en la columna `mean_popularity`.
#   - Extrae la estadística para que sea un valor numérico único (no un tibble).

# Generate a sampling distribution
mean_popularity_2000_samp <- replicate(
  # Use 2000 replicates
  n = 2000,
  expr = {
    # Start with the population
    spotify_population %>%
      # Sample 500 rows without replacement
      slice_sample(n = 500) %>%
      # Calculate the mean popularity as mean_popularity
      summarize(mean_popularity = mean(popularity)) %>%
      # Pull out the mean popularity
      pull(mean_popularity)
  }
)

# See the result
mean_popularity_2000_samp

# 2. Genera una distribución de arranque de 2000 réplicas.
#   - Muestra 500 filas de la muestra con reemplazo.
#   - Calcula la estadística de interés (la media `popularity`)
#    en la columna `mean_popularity`.
#   - Extrae la estadística para que sea un valor numérico único (no un tibble).

# Generate a bootstrap distribution
mean_popularity_2000_boot <- replicate(
  # Use 2000 replicates
  n = 2000,
  expr = {
    # Start with the sample
    spotify_sample %>%
      # Sample same number of rows with replacement
      slice_sample(prop = 1, replace = TRUE) %>%
      # Calculate the mean popularity
      summarize(mean_popularity = mean(popularity)) %>%
      # Pull out the mean popularity
      pull(mean_popularity)
  }
)

# See the result
mean_popularity_2000_boot

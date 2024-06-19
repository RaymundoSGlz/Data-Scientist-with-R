library(dplyr)
library(ggplot2)
library(fst)
library(tibble)
spotify_population <- read_fst("data/spotify_2000_2020.fst")
spotify_sample <- spotify_population %>%
  select(artists, name, danceability) %>%
  slice_sample(n = 1000) %>%
  rowid_to_column()

# 1. Genere una única muestra de bootstrap de spotify_sample.

# Generate 1 bootstrap resample
spotify_1_resample <- spotify_sample %>%
  slice_sample(prop = 1, replace = TRUE)

# See the result
spotify_1_resample

# 2. Resumir para calcular la media danceability de spotify_1_resample
## como mean_danceability,
## luego extraer este valor para obtener un vector numérico de longitud 1.

# Calculate mean danceability of resample
mean_danceability_1 <- spotify_1_resample %>%
  summarize(mean_danceability = mean(danceability)) %>%
  pull()

# See the result
mean_danceability_1

# 3. Replica la expresión proporcionada 1000 veces.

# Replicate this 1000 times
mean_danceability_1000 <- replicate(
  n = 1000,
  expr = {
    spotify_1_resample <- spotify_sample %>%
      slice_sample(prop = 1, replace = TRUE)
    spotify_1_resample %>%
      summarize(mean_danceability = mean(danceability)) %>%
      pull(mean_danceability)
  }
)

# See the result
mean_danceability_1000

# 4. Almacene `mean_danceability_1000` en un tibble,
## en una columna llamada `resample_mean`.
#  - Utilizando `bootstrap_distn`,
## dibuje un histograma de los `resample_mean` con un ancho de bin de `0.002`.

# Store the resamples in a tibble
bootstrap_distn <- tibble(
  resample_mean = mean_danceability_1000
)

# Draw a histogram of the resample means with binwidth 0.002
ggplot(bootstrap_distn, aes(x = resample_mean)) +
  geom_histogram(binwidth = 0.002)

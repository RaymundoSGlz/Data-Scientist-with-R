library(dplyr)
library(fst)
spotify_population <- read_fst("data/spotify_2000_2020.fst")
spotify_sample <- spotify_population %>%
  slice_sample(n = 500)

sampling_distribution <- tibble(
  sample_mean = replicate(
    n = 2000,
    expr = {
      spotify_population %>%
        slice_sample(n = 500) %>%
        summarize(mean_popularity = mean(popularity)) %>%
        pull(mean_popularity)
    }
  )
)

bootstrap_distribution <- tibble(
  resample_mean = replicate(
    n = 2000,
    expr = {
      spotify_sample %>%
        slice_sample(prop = 1, replace = TRUE) %>%
        summarize(mean_popularity = mean(popularity)) %>%
        pull(mean_popularity)
    }
  )
)

# 1. Calcula la desviación estándar de `popularity` con `summarize()`
##   de 4 maneras.
#  - Población: de `spotify_population`,
##   toma la desviación estándar de `popularity`.
#  - Muestra original: de `spotify_sample`,
##   toma la desviación estándar de `popularity`.
#  - Distribución de muestreo: de `sampling_distribution`,
##   toma la desviación estándar de `sample_mean`
##   y multiplica por la raíz cuadrada del tamaño de la muestra (`500`).
#  - Distribución de bootstrap: de `bootstrap_distribution`,
##   toma la desviación estándar de `resample_mean`
##   y multiplica por la raíz cuadrada del tamaño de la muestra.

# Calculate the true popluation std dev popularity
pop_sd <- spotify_population %>%
  summarize(sd(popularity))

# Calculate the true sample std dev popularity
samp_sd <- spotify_sample %>%
  summarize(sd(popularity))

# Calculate the sampling dist'n estimate of std dev popularity
samp_distn_sd <- sampling_distribution %>%
  summarize(sd(sample_mean)) * sqrt(500)

# Calculate the bootstrap dist'n estimate of std dev popularity
boot_distn_sd <- bootstrap_distribution %>%
  summarize(sd(resample_mean)) * sqrt(nrow(spotify_sample))

# See the results
c(
  pop = pop_sd,
  samp = samp_sd,
  sam_distn = samp_distn_sd,
  boot_distn = boot_distn_sd
)

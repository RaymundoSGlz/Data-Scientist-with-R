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

# 1. Calcule la media `popularity` con `summarize()` de 4 maneras.
#   - Población: desde `spotify_population`, tome la media de `popularity`.
#   - Muestra: desde `spotify_sample`, tome la media de `popularity`.
#   - Distribución de muestreo: desde `sampling_distribution`,
##    tome la media de `sample_mean`.
#   - Distribución de bootstrap: desde `bootstrap_distribution`,
##    tome la media de `resample_mean`.

# Calculate the true population mean popularity
pop_mean <- spotify_population %>%
  summarize(mean(popularity))

# Calculate the original sample mean popularity
samp_mean <- spotify_sample %>%
  summarize(mean(popularity))
# Calculate the sampling dist'n estimate of mean popularity
samp_distn_mean <- sampling_distribution %>%
  summarize(mean(sample_mean))

# Calculate the bootstrap dist'n estimate of mean popularity
boot_distn_mean <- bootstrap_distribution %>%
  summarize(mean(resample_mean))

# See the results
c(
  pop = pop_mean,
  samp = samp_mean,
  sam_distn = samp_distn_mean,
  boot_distn = boot_distn_mean
)

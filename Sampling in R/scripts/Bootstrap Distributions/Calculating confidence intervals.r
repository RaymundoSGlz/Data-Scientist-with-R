library(dplyr)
library(fst)
spotify_population <- read_fst("data/spotify_2000_2020.fst")
spotify_sample <- spotify_population %>%
  slice_sample(n = 500)

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

# 1. Genere un intervalo de confianza del 95% utilizando el método de cuantil.
#  - Resuma para obtener el cuantil `0.025` como `inferior`,
##   y el cuantil `0.975` como `superior`.

# Generate a 95% confidence interval using the quantile method
conf_int_quantile <- bootstrap_distribution %>%
  summarize(
    inferior = quantile(resample_mean, 0.025),
    superior = quantile(resample_mean, 0.975)
  )

# See the result
conf_int_quantile

# 2. Genera un intervalo de confianza del 95% utilizando
##   el método de error estándar.
#  - Calcula `point_estimate` como la media de `resample_mean`,
##   y `standard_error` como la desviación estándar de `resample_mean`.
#  - Calcula `lower` como el cuantil `0.025` de una CDF inversa
##   de una distribución normal con media `point_estimate`
##   y desviación estándar `standard_error`.
#  - Calcula `upper` como el cuantil `0.975` de esa misma CDF inversa.

# Generate a 95% confidence interval using the std error method
conf_int_std_error <- bootstrap_distribution %>%
  summarize(
    point_estimate = mean(resample_mean),
    standard_error = sd(resample_mean),
    lower = qnorm(0.025, mean = point_estimate, sd = standard_error),
    upper = qnorm(0.975, mean = point_estimate, sd = standard_error)
  )

# See the result
conf_int_std_error
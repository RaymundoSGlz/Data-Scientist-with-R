library(dplyr)
library(fst)
spotify_population <- read_fst("data/spotify_2000_2020.fst")

# 1. Use `View()` para ver el conjunto de datos `spotify_population`.
## *Explóralo en el visor hasta que tengas claro lo que contiene.*
#   - Use `dplyr` para tomar una muestra de 1000 filas de `spotify_population`,
## asignándolas a `spotify_sample`.

# View the whole population dataset
View(spotify_population)

# Sample 1000 rows from spotify_population
spotify_sample <- spotify_population %>%
  slice_sample(n = 1000)


# See the result
spotify_sample

# 2. Utilizando el conjunto de datos `spotify_population`,
## calcula la duración media en minutos. Llama a la columna calculada `mean_dur`
#  - Utilizando el conjunto de datos `spotify_sample`,
## realiza el mismo cálculo en otra columna llamada `mean_dur`.
#   - *Mira los dos valores. ¿Cuánto difieren?*

# Calculate the mean duration in mins from spotify_population
mean_dur_pop <- spotify_population %>%
  summarize(mean_dur = mean(duration_minutes))


# Calculate the mean duration in mins from spotify_sample
mean_dur_samp <- spotify_sample %>%
  summarize(mean_dur = mean(duration_minutes))

# See the results
mean_dur_pop
mean_dur_samp

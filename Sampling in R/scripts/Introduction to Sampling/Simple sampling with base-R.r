library(fst)
spotify_population <- read_fst("data/spotify_2000_2020.fst")

# 1. Obtén la columna loudness de `spotify_population`,
## asignándola a `loudness_pop`.
#   - Usando base-R, selecciona aleatoriamente `loudness_pop`
## para obtener 100 valores aleatorios, asignándolos a `loudness_samp`.

# Get the loudness column of spotify_population
loudness_pop <- spotify_population$loudness

# Sample 100 values of loudness_pop
loudness_samp <- sample(loudness_pop, size = 100)

# See the results
loudness_samp

# 2. Calcula la desviación estándar de `loudness_pop`.
#   - Calcula la desviación estándar de `loudness_samp`.
#   - *Observa los dos valores. ¿Cuánto se diferencian?*

# Calculate the standard deviation of loudness_pop
sd_loudness_pop <- sd(loudness_pop)

# Calculate the standard deviation of loudness_samp
sd_loudness_samp <- sd(loudness_samp)

# See the results
sd_loudness_pop
sd_loudness_samp

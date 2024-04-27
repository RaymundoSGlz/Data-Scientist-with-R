library(dplyr)
library(ggplot2)
library(fst)
spotify_population <- read_fst("data/spotify_2000_2020.fst")

spotify_mysterious_sample <- spotify_population %>%
  filter(acousticness >= 0.951)

# 1. Usando `spotify_population`, dibuja un histograma de `acousticness`
## con un `binwidth` de `0.01`.

# Visualize the distribution of acousticness
# as a histogram with a binwidth of 0.01
spotify_population %>%
  ggplot(aes(x = acousticness)) +
  geom_histogram(binwidth = 0.01)

# 2. Actualiza el código del histograma
## para usar el conjunto de datos `spotify_mysterious_sample`.
#   - Establece los límites del eje x de cero a uno
## (para facilitar la comparación con la gráfica anterior).

# Update the histogram to use spotify_mysterious_sample
## with x-axis limits from 0 to 1
ggplot(spotify_mysterious_sample, aes(acousticness)) +
  geom_histogram(binwidth = 0.01) +
  xlim(0, 1)

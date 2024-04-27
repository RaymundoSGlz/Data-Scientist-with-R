library(dplyr)
library(ggplot2)
library(fst)
spotify_population <- read_fst("data/spotify_2000_2020.fst")

spotify_mysterious_sample2 <- spotify_population %>%
  sample_n(50)
# 1. Usando `spotify_population`, dibuja un histograma de `duration_minutes`
## con un ancho de bin de `0.5`.

# Visualize the distribution of duration_minutes
# as a histogram with a binwidth of 0.5
spotify_population %>%
  ggplot(aes(x = duration_minutes)) +
  geom_histogram(binwidth = 0.5)
# 2. Actualiza el código del histograma
## para usar el conjunto de datos `spotify_mysterious_sample2`.
#   - Establece los límites del eje x de cero a quince
## (para una comparación más fácil con la gráfica anterior).

# Update the histogram to use spotify_mysterious_sample2
# with x-axis limits from 0 to 15
ggplot(spotify_mysterious_sample2, aes(duration_minutes)) +
  geom_histogram(binwidth = 0.01) +
  xlim(0, 15)

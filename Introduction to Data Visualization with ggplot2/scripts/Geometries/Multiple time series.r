library(ggplot2)
library(tidyr)
load("data/fish.RData")
fish.tidy <- gather(fish.species, Species, Capture, -Year)
# Usando str() en la consola para examinar la estructura
# de fish.species y fish.tidy.
# Trace solo la serie temporal de Rainbow salmon con geom_line().

# Plot the Rainbow Salmon time series
ggplot(fish.species, aes(x = Year, y = Rainbow)) +
    geom_line()

# Grafique solo la serie temporal de Pink salmon con geom_line().

# Plot the Pink Salmon time series
ggplot(fish.species, aes(x = Year, y = Pink)) +
    geom_line()

# Ahora trace todas las series de tiempo en un solo gráfico.
# Trace el conjunto de datos fish.tidy, mapeando Year a x y Capture a y.
# agrupe por especies de peces dentro de la estética de geom_line().

# Plot multiple time-series by grouping by species
ggplot(fish.tidy, aes(x = Year, y = Capture)) +
    geom_line(aes(color = Species))

# Agregue color a la trama anterior para distinguir
# entre las diferentes series de tiempo.
# Trace el conjunto de datos fish.tidy nuevamente,
# esta vez asegurándose de colorear por Species.

# Plot multiple time-series by coloring by species
ggplot(fish.tidy, aes(x = Year, y = Capture, color = Species)) +
    geom_line()

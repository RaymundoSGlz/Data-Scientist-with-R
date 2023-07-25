library(reshape2)
library(ggplot2)
library(zoo)
sunspots.m <- data.frame(
  year = index(sunspot.month),
  value = melt(sunspot.month)$value
)
sun_plot <- ggplot(sunspots.m, aes(x = year, y = value)) +
  geom_line() +
  coord_fixed()
# 1. Corregir la relación de aspecto a 1:1.

# Fix the aspect ratio to 1:1
sun_plot + coord_fixed()

# 2. El eje y es ahora ilegible. ¡Hazlo más grande!
# Cambia la relación de aspecto a 20:1
# Esta es la relación de aspecto recomendada por Cleveland
# para ayudar a hacer que la tendencia entre las oscilaciones
# ea más fácil de ver.

# Change the aspect ratio to 20:1
sun_plot +
  coord_fixed(ratio = 1 / 20)

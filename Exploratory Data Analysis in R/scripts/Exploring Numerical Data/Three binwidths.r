library(ggplot2)
library(dplyr)
cars <- read.csv("data/cars04.csv")

# Crea los siguientes tres gráficos, añadiendo un título
## a cada uno para indicar el ancho de bin utilizado:

# - Un histograma de caballos de fuerza (es decir, `horsepwr`)
## con un `binwidth` de 3.
# - Un segundo histograma de caballos de fuerza con un `binwidth` de 30.
# - Un tercer histograma de caballos de fuerza con un `binwidth` de 60.

# Create hist of horsepwr with binwidth of 3
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram(binwidth = 3) +
  ggtitle("Horsepower distribution in all cars (binwidth = 3)")

# Create hist of horsepwr with binwidth of 30
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram(binwidth = 30) +
  ggtitle("Horsepower distribution in all cars (binwidth = 30)")

# Create hist of horsepwr with binwidth of 60
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram(binwidth = 60) +
  ggtitle("Horsepower distribution in all cars (binwidth = 60)")

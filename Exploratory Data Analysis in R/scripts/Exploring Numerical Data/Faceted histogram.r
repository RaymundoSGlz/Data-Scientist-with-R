cars <- read.csv("data/cars04.csv")

# El conjunto de datos `cars` ha sido cargado en tu espacio de trabajo.

# - Carga el paquete `ggplot2`.
# - Ve el tamaño de los datos y los tipos de variables utilizando `str()`.
# - Haz un histograma de `city_mpg` facetado por `suv`,
## una variable lógica que indica si el automóvil es un SUV o no.

# Load package
library(ggplot2)

# Learn data structure
str(cars)

# Create faceted histogram
ggplot(cars, aes(x = city_mpg)) +
  geom_histogram() +
  facet_wrap(~suv)

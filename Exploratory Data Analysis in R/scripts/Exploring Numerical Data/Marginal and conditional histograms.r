library(ggplot2)
library(dplyr)
cars <- read.csv("data/cars04.csv")

# - Crea un histograma de la distribución de `horsepwr` en todos los coches
## y añade un título apropiado.
## Comienza por introducir el conjunto de datos brutos.
# - Crea un segundo histograma de la distribución de la potencia del motor,
## pero sólo para aquellos coches que tienen un `msrp` menor a $25,000.
## Mantén los límites del eje x de manera que
## sean similares a los del primer gráfico, y añade un título descriptivo.

# Create hist of horsepwr
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram() +
  ggtitle("Horsepower distribution in all cars")

# Create hist of horsepwr for affordable cars
cars %>%
  filter(msrp < 25000) %>%
  ggplot(aes(horsepwr)) +
  geom_histogram() +
  xlim(c(90, 550)) +
  ggtitle("Horsepower distribution in cars under $25,000")

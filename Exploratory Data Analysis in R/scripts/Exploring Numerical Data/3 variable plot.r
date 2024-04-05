library(ggplot2)
library(dplyr)
cars <- read.csv("data/cars04.csv")
common_cyl <- cars %>%
  filter(ncyl %in% c(4, 6, 8))

# `common_cyl`, que creaste para contener solo autos con 4, 6 u 8 cilindros,
## está disponible en tu espacio de trabajo.

#-Usando `common_cyl`, crea un histograma de `hwy_mpg`.
#-Faceta la cuadrícula del gráfico en filas por `ncyl` y en columnas por `suv`.
#-Añade un título a tu gráfico para indicar qué variables están siendo facetadas

# Facet hists using hwy mileage and ncyl
common_cyl %>%
  ggplot(aes(x = hwy_mpg)) +
  geom_histogram() +
  facet_grid(ncyl ~ suv) +
  ggtitle("Facet grid of hwy_mpg by ncyl and suv")
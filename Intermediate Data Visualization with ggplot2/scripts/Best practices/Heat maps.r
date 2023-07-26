library(lattice)
library(ggplot2)
library(RColorBrewer)
# Usando barley, grafique la variedad versus el año, lleno por rendimiento.
# Agregue una capa geom_tile ().

# Using barley, plot variety vs. year, filled by yield
ggplot(barley, aes(x = year, y = variety, fill = yield)) +
  # Add a tile geom
  geom_tile()

# Agregue la función facet_wrap() con facetas como vars (sitio)
# y ncol = 1. Los nombres de las tiras estarán arriba
# de los paneles, no al lado (como con facet_grid()).
# Dé a los mapas de calor una paleta de 2 colores
# usando scale_fill_gradient(). Establezca low y high
# en "white" y "red", respectivamente.

ggplot(barley, aes(x = year, y = variety, fill = yield)) +
  geom_tile() +
  # Facet, wrapping by site, with 1 column
  facet_wrap(facets = vars(site), ncol = 1) +
  # Add a fill scale using an 2-color gradient
  scale_fill_gradient(low = "white", high = "red")


# La paleta de colores de 9 rojos, hecha con brewer.pal(),
# se proporciona como red_brewer_palette.
# Actualice la escala de relleno para
# usar un gradiente de n colores con scale_fill_gradientn() (observe la n).
# Establezca los colores de la escala en la paleta de rojos.

# A palette of 9 reds
red_brewer_palette <- brewer.pal(9, "Reds")

# Update the plot
ggplot(barley, aes(x = year, y = variety, fill = yield)) +
  geom_tile() +
  facet_wrap(facets = vars(site), ncol = 1) +
  # Update scale to use n-colors from red_brewer_palette
  scale_fill_gradientn(colors = red_brewer_palette)

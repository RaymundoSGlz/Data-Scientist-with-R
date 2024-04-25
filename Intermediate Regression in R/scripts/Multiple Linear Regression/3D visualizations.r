library(ggplot2)
library(magrittr)
library(plot3D)
library(fst)
taiwan_real_estate <- read_fst("data/taiwan_real_estate2.fst")

# 1. Con el conjunto de datos `taiwan_real_estate`,
## dibuja un gráfico de dispersión 3D
## con el número de tiendas de conveniencia cercanas en el eje x,
## la **raíz cuadrada** de la distancia a la parada de MRT
## más cercana en el eje y,
## y el precio de la casa en el eje z.

# With taiwan_real_estate,
# draw a 3D scatter plot of no. of conv. stores, sqrt dist to MRT, and price
taiwan_real_estate %$%
  scatter3D(n_convenience, sqrt(dist_to_mrt_m), price_twd_msq)

# 2. Con el conjunto de datos `taiwan_real_estate`,
## dibuja un gráfico de dispersión de la raíz cuadrada
## de la distancia a la parada de MRT más cercana versus
## el número de tiendas de conveniencia cercanas,
## coloreado por el precio de la casa.
#   - Usa la escala de color viridis continua, utilizando la opción `"plasma"`.

# Using taiwan_real_estate,
# plot sqrt dist to MRT vs. no. of conv stores, colored by price
taiwan_real_estate %>%
  ggplot(aes(n_convenience, sqrt(dist_to_mrt_m), color = price_twd_msq)) +
  # Make it a scatter plot
  geom_point() +
  # Use the continuous viridis plasma color scale
  scale_color_viridis_c(option = "plasma")

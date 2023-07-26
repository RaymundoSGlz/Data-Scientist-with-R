library(ggplot2)
library(lattice)
# Usando barley, graficar el rendimiento versus año,
# coloreado y agrupado por variedad.
# Agregar una capa de línea.
# Facetar, envolviendo por sitio, con 1 fila.
# The heat map we want to replace
# Don't remove, it's here to help you!
ggplot(barley, aes(x = year, y = variety, fill = yield)) +
  geom_tile() +
  facet_wrap(~site, ncol = 1) +
  scale_fill_gradientn(colors = brewer.pal(9, "Reds"))

# Using barley, plot yield vs. year, colored and grouped by variety
ggplot(barley, aes(x = year, y = yield, color = variety, group = variety)) +
  # Add a line layer
  geom_line() +
  # Facet, wrapping by site, with 1 row
  facet_wrap(~site, nrow = 1)


# Mostrar solo medias y cintas para la propagación.
# Mapear sitio en color, grupo y relleno.
# Agregue una capa stat_summary (). establecer fun = mean, y geom = "line".
# En el segundo stat_summary (), establezca
# geom = "ribbon", color = NA y alpha = 0.1.

# Using barely, plot yield vs. year, colored, grouped, and filled by site
ggplot(barley, aes(
  x = year, y = yield,
  color = site, group = site, fill = site
)) +
  # Add a line summary stat aggregated by mean
  stat_summary(fun = mean, geom = "line") +
  # Add a ribbon summary stat with 10% opacity, no color
  stat_summary(
    fun.data = mean_sdl,
    fun.args = list(mult = 1),
    geom = "ribbon", alpha = 0.1, color = NA
  )

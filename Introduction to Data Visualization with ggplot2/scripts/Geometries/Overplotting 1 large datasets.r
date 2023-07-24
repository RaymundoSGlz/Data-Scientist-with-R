library(ggplot2)
# 1. Agregar una capa de puntos a la traza base.
# Establecer la transparencia del punto en 0.5.
# Establecer shape = ".", el tamaño del punto de 1 píxel.

# 2. Actualizar la forma del punto para eliminar los contornos de línea
# estableciendo shape en 16.

# Plot price vs. carat, colored by clarity
plt_price_vs_carat_by_clarity <- ggplot(
    diamonds,
    aes(carat, price, color = clarity)
)

# Add a point layer with tiny points
plt_price_vs_carat_by_clarity +
    geom_point(alpha = 0.5, shape = 16, size = 1)

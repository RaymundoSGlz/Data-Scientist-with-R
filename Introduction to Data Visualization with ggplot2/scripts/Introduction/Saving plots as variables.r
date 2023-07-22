library(ggplot2)
# Usando el conjunto de datos de diamantes,
# trace price (eje y) versus carat (eje x), asignando a plt_price_vs_carat.
# Usando geom_point (), agregue una capa de punto a plt_price_vs_carat.

# Draw a ggplot
plt_price_vs_carat <- ggplot(
    # Use the diamonds dataset
    diamonds,
    # For the aesthetics, map x to carat and y to price
    aes(carat, price)
)

# Add a point layer to plt_price_vs_carat
plt_price_vs_carat + geom_point()

# Agregar un argumento alfa a la capa de punto
# para hacer que los puntos sean 20% opacos,
# asignando a plt_price_vs_carat_transparent.
# Escriba el nombre de la variable
# de la gráfica (plt_price_vs_carat_transparent) para mostrarla.

# Edit this to make points 20% opaque: plt_price_vs_carat_transparent
plt_price_vs_carat_transparent <- plt_price_vs_carat + geom_point(alpha = 0.2)

# See the plot
plt_price_vs_carat_transparent

# Dentro de geom_point (), llame a aes () y mapee el color a clarity,
# asignando a plt_price_vs_carat_by_clarity.
# Escriba el nombre de la variable
# de la gráfica (plt_price_vs_carat_by_clarity) para mostrarla.

# Map color to clarity: plt_price_vs_carat_by_clarity
plt_price_vs_carat_by_clarity <- plt_price_vs_carat +
    geom_point(aes(color = clarity))

# See the plot
plt_price_vs_carat_by_clarity

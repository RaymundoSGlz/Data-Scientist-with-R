library(data.table)
# Usar fread() y seleccionar o eliminar como argumentos,
# solo importar las columnas de textura y humedad del archivo plano.
# Corresponden a las columnas 6 y 8 en "potatoes.csv".
# Almacene el resultado en una variable papas.
# plot() 2 columnas del dataframe potatoes:
# texture en el eje x, moistness en el eje y.
# Use la notación del signo de dólar dos veces.
# Siéntase libre de nombrar sus ejes y gráfico.

# fread is already loaded

# Import columns 6 and 8 of potatoes.csv: potatoes
potatoes <- fread("data/potatoes.csv", select = c(6, 8))

# Plot texture (x) and moistness (y) of potatoes
plot(potatoes$texture, potatoes$moistness)

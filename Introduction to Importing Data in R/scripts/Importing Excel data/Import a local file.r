# Cargar el paquete gdata con library ().
# Importar la segunda hoja, llamada "1967-1974",
# de "urbanpop.xls" con read.xls ().
# Almacene el dataframe resultante como urban_pop.
# Imprimir las primeras 11 observaciones de urban_pop con head ().

# Load the gdata package
library(gdata)

# Import the second sheet of urbanpop.xls: urban_pop
urban_pop <- read.xls("data/urbanpop.xls", sheet = 2)

# Print the first 11 observations using head()
head(urban_pop, 11)

# Importar los datos de "hotdogs.txt" con read.delim().
# Llame al dataframe resultante hotdogs.
# Los nombres de las variables no están en la primera línea,
# así que asegúrese de establecer el argumento de encabezado apropiadamente.
# Llame a summary() en hotdogs. Esto imprimirá algunas estadísticas
# resumidas sobre todas las variables en el dataframe.

# Import hotdogs.txt: hotdogs
hotdogs <- read.delim("./data/hotdogs.txt", header = FALSE)

# Summarize hotdogs
summary(hotdogs)

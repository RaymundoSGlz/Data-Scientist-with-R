# Finalizar la llamada read.table() que se ha preparado para usted.
# Utilice la variable de ruta y asegúrese de establecer sep correctamente.
# Llame a head() en hotdogs;
# esto imprimirá las primeras 6 observaciones en el dataframe.

# Path to the hotdogs.txt file: path
path <- file.path("data", "hotdogs.txt")

# Import the hotdogs.txt file: hotdogs
hotdogs <- read.table(path,
  sep = "\t", ,
  col.names = c("type", "calories", "sodium")
)

# Call head() on hotdogs
head(hotdogs)

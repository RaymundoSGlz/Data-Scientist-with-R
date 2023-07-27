# Usar library() para cargar (NO instalar) el paquete data.table.
# importar "potatoes.csv" con fread().
# Simplemente pase la ruta del archivo y vea si funcionó.
# Almacene el resultado en una variable potatoes.
# Imprima potatoes.

# load the data.table package using library()
library(data.table)

# Import potatoes.csv with fread(): potatoes
potatoes <- fread("data/potatoes.csv")

# Print out potatoes
potatoes

library(readr)
# hotdogs es creado para usted sin establecer los tipos de columna.
# Inspeccione su resumen usando la función summary ().
# Dos funciones de recolector se definen para usted: fac e int.
# Échales un vistazo, ¿entiendes lo que están recolectando?
# En la segunda llamada read_tsv (), edite el argumento col_types:
# pase una list() con los elementos fac, int e int,
# de modo que la primera columna se importe como un factor,
# y la segunda y tercera columna como enteros.
# Cree un summary () de hotdogs_factor. Compare esto con el resumen de hotdogs.

# readr is already loaded

# Import without col_types
hotdogs <- read_tsv("data/hotdogs.txt",
  col_names = c("type", "calories", "sodium")
)

# Display the summary of hotdogs
summary(hotdogs)

# The collectors you will need to import the data
fac <- col_factor(levels = c("Beef", "Meat", "Poultry"))
int <- col_integer()

# Edit the col_types argument to import the data correctly: hotdogs_factor
hotdogs_factor <- read_tsv("data/hotdogs.txt",
  col_names = c("type", "calories", "sodium"),
  col_types = list(fac, int, int)
)

# Display the summary of hotdogs_factor
summary(hotdogs_factor)

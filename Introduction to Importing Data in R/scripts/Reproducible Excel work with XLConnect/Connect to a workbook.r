# Cargar el paquete XLConnect usando library()
# Usar loadWorkbook() para construir una conexión
# al archivo "urbanpop.xlsx" en R. Llamar al libro my_book.
# Imprimir la clase de my_book. ¿Qué te dice esto?

# urbanpop.xlsx is available in your working directory

# Load the XLConnect package
library(XLConnect)

# Build connection to urbanpop.xlsx: my_book
my_book <- loadWorkbook("data/urbanpop.xlsx")

# Print out the class of my_book
class(my_book)

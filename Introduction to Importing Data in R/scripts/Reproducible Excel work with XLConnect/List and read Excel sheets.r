library(XLConnect)
# Imprimir las hojas del archivo de Excel al que my_book enlaza.
# Importar la segunda hoja en my_book como un data frame. Imprimirlo.

# XLConnect is already available

# Build connection to urbanpop.xlsx
my_book <- loadWorkbook("data/urbanpop.xlsx")

# List the sheets in my_book
getSheets(my_book)

# Import the second sheet in my_book
readWorksheet(my_book, sheet = 2)

library(XLConnect)
# Usar createSheet() para crear una nueva hoja en my_book,
# llamada "data_summary".
# Usar getSheets() para verificar que my_book
# ahora representa un archivo de Excel con cuatro hojas.

# XLConnect is already available

# Build connection to urbanpop.xlsx
my_book <- loadWorkbook("data/urbanpop.xlsx")

# Add a worksheet to my_book, named "data_summary"
createSheet(my_book, name = "data_summary")

# Use getSheets() on my_book
getSheets(my_book)

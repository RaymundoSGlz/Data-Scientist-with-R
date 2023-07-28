library(XLConnect)
# Extender el comando readWorksheet() con los argumentos
# startCol y endCol para importar sólo las columnas 3, 4 y 5 de la segunda hoja.
# urbanpop_sel ya no contiene información sobre los países ahora.
# ¿Puedes escribir otro comando readWorksheet() que importe
# sólo la primera columna de la segunda hoja?
# Almacena el data frame resultante como countries.
# Usa cbind() para pegar countries y urbanpop_sel, en este orden.
# Almacena el resultado como selection.

# XLConnect is already available

# Build connection to urbanpop.xlsx
my_book <- loadWorkbook("data/urbanpop.xlsx")

# Import columns 3, 4, and 5 from second sheet in my_book: urbanpop_sel
urbanpop_sel <- readWorksheet(my_book, sheet = 2, startCol = 3, endCol = 5)

# Import first column from second sheet in my_book: countries
countries <- readWorksheet(my_book, sheet = 2, startCol = 1, endCol = 1)

# cbind() urbanpop_sel and countries together: selection
selection <- cbind(countries, urbanpop_sel)

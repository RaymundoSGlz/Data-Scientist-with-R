# Cargar el paquete XLConnect.
# Construir una conexión a "renamed.xlsx",
# el archivo de Excel que ha construido en el ejercicio anterior;
# está disponible en su directorio de trabajo.
# Almacene esta conexión como my_book.
# Usar removeSheet() para eliminar la cuarta hoja de my_book.
# El nombre de la hoja es "summary".
# Recuerde que removeSheet() acepta el índice
# o el nombre de la hoja como segundo argumento.
# Guarde el libro de trabajo resultante, my_book, en un archivo "clean.xlsx"

# Load the XLConnect package
library(XLConnect)

# Build connection to renamed.xlsx: my_book
my_book <- loadWorkbook("data/renamed.xlsx")

# Remove the fourth sheet
removeSheet(my_book, sheet = "summary")

# Save workbook to "clean.xlsx"
saveWorkbook(my_book, "data/clean.xlsx")

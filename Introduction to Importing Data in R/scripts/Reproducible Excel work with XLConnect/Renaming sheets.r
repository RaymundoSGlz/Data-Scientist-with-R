library(XLConnect)
# Usar renameSheet() para renombrar la cuarta hoja como "summary".
# Luego, llamar a getSheets() en my_book para imprimir los nombres de las hojas.
# Finalmente, asegurarse de guardar el objeto my_book
# en un nuevo archivo de Excel, "renamed.xlsx".

# Build connection to urbanpop.xlsx: my_book
my_book <- loadWorkbook("data/urbanpop.xlsx")

# Rename "data_summary" sheet to "summary"
renameSheet(my_book, sheet = "data_summary", newName = "summary")

# Print out sheets of my_book
getSheets(my_book)

# Save workbook to "renamed.xlsx"
saveWorkbook(my_book, "data/renamed.xlsx")

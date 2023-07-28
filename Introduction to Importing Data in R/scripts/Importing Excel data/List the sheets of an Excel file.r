# Cargar el paquete readxl usando library().
# Usar excel_sheets() para imprimir los nombres de las hojas en urbanpop.xlsx.

# Load the readxl package
library(readxl)

# Print the names of all worksheets
excel_sheets("data/urbanpop.xlsx")

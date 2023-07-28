library(readxl)
# Usar lapply() en combinación con excel_sheets() y read_excel()
# para leer todas las hojas de Excel en "urbanpop.xlsx".
# Nombre la lista resultante pop_list.
# Imprime la estructura de pop_list.

# The readxl package is already loaded

# Read all Excel sheets with lapply(): pop_list
pop_list <- lapply(excel_sheets("data/urbanpop.xlsx"),
  read_excel,
  path = "data/urbanpop.xlsx"
)

# Display the structure of pop_list
str(pop_list)

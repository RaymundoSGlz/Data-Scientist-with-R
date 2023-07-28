library(readxl)
# El código para importar la primera y segunda hoja ya esta incluido.
# ¿Puedes agregar un comando para importar la tercera hoja
# y almacenar el resultado en pop_3?
# Almacena los data frames pop_1, pop_2 y pop_3 en una lista llamada pop_list.
# Muestra la estructura de pop_list.

# The readxl package is already loaded

# Read the sheets, one by one
pop_1 <- read_excel("data/urbanpop.xlsx", sheet = 1)
pop_2 <- read_excel("data/urbanpop.xlsx", sheet = 2)
pop_3 <- read_excel("data/urbanpop.xlsx", sheet = 3)

# Put pop_1, pop_2 and pop_3 in a list: pop_list
pop_list <- list(pop_1, pop_2, pop_3)

# Display the structure of pop_list
str(pop_list)

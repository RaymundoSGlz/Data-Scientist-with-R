library(readxl)
# Importar la primera hoja de Excel de "urbanpop_nonames.xlsx"
# y almacenar el resultado en pop_a.
# Haga que R establezca los nombres de columna del propio dataframe resultante.
# Importar la primera hoja de Excel de urbanpop_nonames.xlsx; esta vez,
# use el vector cols que ya se ha preparado para especificar los nombres.
# Almacene el dataframe resultante en pop_b.
# Imprima el resumen de pop_a.
# Imprima el resumen de pop_b. ¿Puedes ver la diferencia con el otro resumen?

# The readxl package is already loaded

# Import the first Excel sheet of urbanpop_nonames.xlsx (R gives names): pop_a
pop_a <- read_excel("data/urbanpop_nonames.xlsx", sheet = 1, col_names = FALSE)

# Import the first Excel sheet of urbanpop_nonames.xlsx
# (specify col_names): pop_b
cols <- c("country", paste0("year_", 1960:1966))
pop_b <- read_excel("data/urbanpop_nonames.xlsx", sheet = 1, col_names = cols)

# Print the summary of pop_a
summary(pop_a)

# Print the summary of pop_b
summary(pop_b)

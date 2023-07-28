library(readxl)
# Importar la segunda hoja de urbanpop.xlsx, pero omita las primeras 21 filas.
# Asegúrese de establecer col_names = FALSE.
# Almacene el dataframe resultante en una variable urbanpop_sel.
# Seleccione la primera observación de urbanpop_sel e imprímala.

# The readxl package is already loaded

# Import the second sheet of urbanpop.xlsx,
# skipping the first 21 rows: urbanpop_sel
urbanpop_sel <- read_excel("data/urbanpop.xlsx",
  sheet = 2, skip = 21, col_names = FALSE
)

# Print out the first observation from urbanpop_sel
urbanpop_sel[1, ]

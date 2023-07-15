# Selecciona toda la segunda columna, llamada day2,
# del data frame li_df como un vector y asígnalo a second.

# Usa second para crear un vector lógico, que contenga TRUE si el número
# de vistas es estrictamente mayor que 25 o estrictamente menor que 5
# y FALSE en caso contrario.

# Almacena este vector lógico como extremes.
# Usa sum() en el vector extremes para calcular el número de TRUE en extremes
# (es decir, para calcular el número de empleados que son muy populares
# o muy poco conocidos). Simplemente imprime este número en la consola.

# li_df is pre-loaded in your workspace
values <- c(2, 19, 24, 22, 25, 22, 0, 12, 19, 23, 29, 13, 7, 26, 7, 32, 7, 9,
    0, 9, 6, 17, 1, 5, 2, 29, 17, 26, 27, 4, 22, 9, 6, 18, 2, 32, 5, 6, 30,
    34, 15, 28, 6, 17, 6, 18, 21, 10, 6, 30)
li_df <- matrix(values, nrow = 50, ncol = 7, byrow = TRUE,
dimnames = list(paste0("employee_", 1:50), paste0("day", 1:7)))

# Select the second column, named day2, from li_df: second
second <- li_df[, 2]

# Build a logical vector, TRUE if value in second is extreme: extremes
extremes <- second > 25 | second < 5

# Count the number of TRUEs in extremes
sum(extremes)

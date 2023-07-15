# Termina los bucles anidados para recorrer los elementos en ttt:

# El bucle externo debe recorrer las filas,
# con el índice de bucle i (usa seq_len(nrow(ttt))).

# El bucle interno debe recorrer las columnas,
# con el índice de bucle j (usa seq_len(ncol(ttt))).
# Dentro del bucle interno, utiliza print() y paste()
# para imprimir información en el siguiente formato:
# "On row i and column j the board contains x",
# donde x es el valor en esa posición.

# The tic-tac-toe matrix ttt has already been defined for you
ttt <- matrix(c("O", NA, "X",
                NA, "O", "O",
                "X", NA, "X"),
        nrow = 3,
        byrow = TRUE)

# define the double for loop
for (i in seq_len(nrow(ttt))) {
    for (j in seq_len(ncol(ttt))) {
        print(paste("On row", i, "and column", j,
        "the board contains", ttt[i, j]))
    }
}

# Termina el bucle while para que:

# imprima el triple de i, es decir, 3 * i, en cada ejecución.
# se abandone con un break si el triple de i es divisible por 8,
# pero aún así imprime este triple antes de salir del bucle.

# Initialize i as 1
i <- 1

# Code the while loop
while (i <= 10) {
    print(3 * i)
    if ((3 * i) %% 8 == 0) {
        break()
    }
    i <- i + 1
}

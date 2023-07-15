# Inicializa la variable rcount en 0.
# Completa el bucle for:
# si char es igual a "r", aumenta el valor de rcount en 1.
# si char es igual a "u", sal del bucle for con un break.
# Finalmente, imprime la variable rcount en la consola
# para ver si el código es correcto.

# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

# Initialize rcount
rcount <- 0

# Finish the for loop
for (char in chars) {
    if (char == "r") {
        rcount <- rcount + 1
    }
    if (char == "u") {
        break
    }
}

# Print out rcount
rcount

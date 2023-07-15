# Crea una función pow_two(): toma un argumento
# y devuelve ese número elevado al cuadrado (ese número por sí mismo).
# Llama a esta función recién definida con 12 como entrada.

# A continuación, crea una función sum_abs(), que toma dos argumentos
# y devuelve la suma de los valores absolutos de ambos argumentos.
# Finalmente, llama a la función sum_abs() con los argumentos -2 y 3 después.

# Create a function pow_two()
pow_two <- function(x) {
  x^2
}

# Use the function
pow_two(12)

# Create a function sum_abs()
sum_abs <- function(x, y) {
  abs(x) + abs(y)
}

# Use the function
sum_abs(-2, 3)

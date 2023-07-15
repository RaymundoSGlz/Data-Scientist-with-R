# Completa la definición de la función interpret(),
# que interpreta el número de vistas de perfil en un solo día:
# La función toma un argumento, num_views.
# Si num_views es mayor que 15, la función imprime en la consola
# "You're popular!" y devuelve num_views.
# De lo contrario, la función imprime "Try to be more visible!" y devuelve 0.
# Finalmente, llama a la función interpret() dos veces: en el primer valor
# del vector linkedin y en el segundo elemento del vector facebook.

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Define the interpret function
interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    return(num_views)
  } else {
    print("Try to be more visible!")
    return(0)
  }
}

# Call the interpret function twice
interpret(linkedin[1])
interpret(facebook[2])

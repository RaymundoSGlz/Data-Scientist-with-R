# Agrega código al bucle for que recorre los elementos del vector linkedin:

# Si el valor del elemento supera los 10, imprime "You're popular!".
# Si el valor del elemento no supera los 10, imprime "Be more visible!"

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Code the for loop with conditionals
for (li in linkedin) {
    if (li > 10) {
        print("You're popular!")
    } else {
       print("Be more visible!")
    }
    print(li)
}

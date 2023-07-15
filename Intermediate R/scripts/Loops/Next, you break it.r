# Extienda el bucle for con dos nuevos if separados de la siguiente manera:

# Si el valor del elemento del vector supera los 16, imprima
# "This is ridiculous, I'm outta here!"  y haga que R abandone el bucle (break).
# Si el valor es menor que 5, imprima "This is too embarrassing!"
# y avance rápidamente a la siguiente iteración (next).

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Adapt/extend the for loop
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  if (li > 16) {
    print("This is ridiculous, I'm outta here!")
    break
  }
    if (li < 5) {
        print("This is too embarrassing!")
        next
    }
  print(li)
}

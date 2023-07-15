# Calcular el número promedio de vistas de perfil de LinkedIn,
# sin especificar ningún argumento opcional.
# Simplemente imprima el resultado en la consola.

# Calcular el número promedio de vistas de perfil de LinkedIn,
# pero esta vez indique a R que elimine los valores faltantes de la entrada.

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Basic average of linkedin
mean(linkedin)

# Advanced average of linkedin
mean(linkedin, na.rm = TRUE)

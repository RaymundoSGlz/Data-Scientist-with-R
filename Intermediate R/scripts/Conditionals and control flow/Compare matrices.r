# Usando los operadores relacionales que has aprendido hasta ahora,
# intenta descubrir lo siguiente:

# ¿Cuándo fueron las vistas exactamente iguales a 13?
# Usa la matriz de vistas para devolver una matriz lógica.

# ¿Para qué días el número de vistas fue menor o igual a 14?
# Nuevamente, haz que R devuelva una matriz lógica.

# The social data has been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE)

# When does views equal 13?
views == 13

# When is views less than or equal to 14?
views <= 14

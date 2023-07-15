# Usar lapply() para calcular el mínimo (función integrada min())
# de las mediciones de temperatura para cada día.
# Hacer lo mismo pero esta vez con sapply(). Ver cómo difiere la salida.
# Usar lapply() para calcular el máximo (max()) de la temperatura para cada día.
# Nuevamente, usar sapply() para resolver la misma pregunta
# y ver cómo difieren lapply() y sapply().

# temp has already been defined in the workspace
temp <- list(c(3, 7, 9, 6, -1),
                c(6, 9, 12, 13, 5),
                c(4, 8, 3, -1, -3),
                c(1, 4, 7, 2, -2),
                c(5, 7, 9, 4, 2),
                c(-3, 5, 8, 9, 4),
                c(3, 6, 9, 4, 1))

# Use lapply() to find each day's minimum temperature
lapply(temp, min)

# Use sapply() to find each day's minimum temperature
sapply(temp, min)

# Use lapply() to find each day's maximum temperature
lapply(temp, max)

# Use sapply() to find each day's maximum temperature
sapply(temp, max)

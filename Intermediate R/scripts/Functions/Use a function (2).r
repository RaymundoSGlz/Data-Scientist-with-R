# Calcula la media de la suma de los elementos de linkedin y facebook
# y almacena el resultado en una variable llamada avg_sum.

# Calcula nuevamente, pero esta vez establece el argumento trim igual a 0.2
# y asigna el resultado a la variable avg_sum_trimmed.

# Imprime tanto avg_sum como avg_sum_trimmed; ¿puedes ver la diferencia?

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate the mean of the sum
avg_sum <- mean(linkedin + facebook)

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean(linkedin + facebook, trim = 0.2)

# Inspect both new variables
avg_sum
avg_sum_trimmed

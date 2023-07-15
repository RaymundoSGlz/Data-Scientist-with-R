# Usa abs() en linkedin - facebook para obtener las diferencias absolutas
# entre las vistas diarias de los perfiles de LinkedIn y Facebook.
# Coloca la llamada a abs() dentro de mean() para calcular la
# Desviación Media Absoluta.
# En la llamada a mean(), asegúrate de especificar na.rm
# para tratar correctamente los valores faltantes.

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Calculate the mean absolute deviation
mean(abs(linkedin - facebook), na.rm = TRUE)

# Convertir ambas listas de LinkedIn y Facebook a un vector,
# y almacenarlos como li_vec y fb_vec respectivamente.
# Luego, agregar fb_vec a li_vec (los datos de Facebook vienen después).
# Guardar el resultado como social_vec.
# Finalmente, ordenar social_vec de mayor a menor.
# Imprimir el vector resultante.

# The linkedin and facebook lists have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <- as.vector(linkedin)
fb_vec <- as.vector(facebook)

# Append fb_vec to li_vec: social_vec
social_vec <- unlist(append(li_vec, fb_vec))
# Sort social_vec
sort(social_vec, decreasing = TRUE)

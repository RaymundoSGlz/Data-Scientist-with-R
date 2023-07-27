# Importar los datos desde "hotdogs.txt" usando read.delim().
# Es un archivo de valores separados por tabuladores
# sin nombres en la primera fila.

# El código que selecciona la observación con la menor cantidad de calorías y
# la almacena en la variable lily ya está disponible.
# Utiliza la función which.min(),
# que devuelve el índice del valor más pequeño en un vector.

# Haz algo similar para Tom:
# selecciona la observación con el mayor contenido
# de sodio y almacénala en tom. Utiliza which.max() esta vez.

# Finalmente, imprime ambas observaciones lily y tom.

# Finish the read.delim() call
hotdogs <- read.delim("data/hotdogs.txt",
  sep = "\t",
  header = FALSE,
  col.names = c("type", "calories", "sodium")
)

# Select the hot dog with the least calories: lily
lily <- hotdogs[which.min(hotdogs$calories), ]

# Select the observation with the most sodium: tom
tom <- hotdogs[which.max(hotdogs$sodium), ]

# Print lily and tom
lily
tom

# La llamada read.delim() de antes ya está incluida
# y crea el data frame "hotdogs". Veamos la estructura de "hotdogs".

# Edita la segunda llamada read.delim().
# Asigna el vector correcto al argumento colClasses.
# Reemplaza NA con un vector de caracteres: c("factor", "NULL", "numeric").

# Muestra la estructura de "hotdogs2" y busca las diferencias.

# Previous call to import hotdogs.txt
hotdogs <- read.delim("data/hotdogs.txt",
  header = FALSE,
  col.names = c("type", "calories", "sodium")
)

# Display structure of hotdogs
str(hotdogs)

# Edit the colClasses argument to import the data correctly: hotdogs2
hotdogs2 <- read.delim("data/hotdogs.txt",
  header = FALSE,
  col.names = c("type", "calories", "sodium"),
  colClasses = c("factor", "NULL", "numeric")
)


# Display structure of hotdogs2
str(hotdogs2)

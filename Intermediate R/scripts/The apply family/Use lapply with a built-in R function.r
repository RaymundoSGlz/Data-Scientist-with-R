# Echa un vistazo a las llamadas de strsplit(), que dividen las cadenas
# en pioneros en el signo :.
# El resultado, split_math, es una lista de 4 vectores de caracteres:
# el primer elemento del vector representa el nombre,
# el segundo elemento el año de nacimiento.

# Usa lapply() para convertir los vectores de caracteres en split_math
# a letras minúsculas: aplica tolower() a cada uno de sus elementos.
# Asigna el resultado, que es una lista, a una nueva variable split_low.

# Finalmente, inspecciona el contenido de split_low con str().

# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

# Convert to lowercase strings: split_low
split_low <- lapply(split_math, tolower)

# Take a look at the structure of split_low
str(split_low)

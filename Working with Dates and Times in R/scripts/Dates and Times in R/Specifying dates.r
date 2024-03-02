# Hemos almacenado la cadena "2013-04-03" en una variable llamada x.
# Usa str() para mirar la estructura de x y confirmar que
## es solo una cadena de caracteres.
# Convierte x en una fecha usando as.Date().
# Usa str() para mirar la estructura de x_date y confirma que es una Date.
# Ahora usa as.Date() para almacenar la fecha 10 de abril de 2014.

# The date R 3.0.0 was released
x <- "2013-04-03"

# Examine structure of x
str(x)

# Use as.Date() to interpret x as a date
x_date <- as.Date(x)

# Examine structure of x_date
str(x_date)

# Store April 10 2014 as a Date
april_10_2014 <- as.Date("2014-04-10")
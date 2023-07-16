# Se han creado tres cadenas de caracteres que representan fechas.
# Conviértelas a fechas usando as.Date(),
# y asígnales date1, date2 y date3 respectivamente.
# El código para date1 ya está incluido.
# Extrae información útil de las fechas como cadenas de caracteres
# usando format(). De la primera fecha, selecciona el día de la semana.
# De la segunda fecha, selecciona el día del mes. De la tercera fecha,
# debes seleccionar el mes abreviado y el año de 4 dígitos,
# separados por un espacio.

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%Y")
date2 <- as.Date(str2, format = "%Y-%m-%d")
date3 <- as.Date(str3, format = "%d/%B/%Y")

# Convert dates to formatted strings
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")

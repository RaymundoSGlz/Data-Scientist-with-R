# Convertir dos cadenas de texto que representan marcas de tiempo,
# str1 y str2, a objetos POSIXct llamados time1 y time2.
# Usando format(), crear una cadena de texto a partir de time1
# que contenga solo los minutos.
# Desde time2, extraer las horas y minutos como "horas:minutos AM/PM".
# ¡Consulte el texto de la tarea anterior para encontrar
# los símbolos de conversión correctos!

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%b %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2)


# Convert times to formatted strings
format(time1, "%M")
format(time2, "%I:%M %p")

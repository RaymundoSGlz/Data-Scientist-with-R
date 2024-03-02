library(readr)

# - Usa `as.POSIXct()` y una cadena apropiada para introducir
## el datetime correspondiente al 1 de octubre de 2010 a las 12:12:00.
# - Introduce el mismo datetime nuevamente,
## pero ahora especifica la zona horaria como `"America/Los_Angeles"`.
# - Usa `read_csv()` para leer nuevamente `rversions.csv`.
# - Examina la estructura de la columna `datetime` para verificar que
## `read_csv()` la ha interpretado correctamente como un datetime.

# Use as.POSIXct to enter the datetime 
as.POSIXct("2010-10-01 12:12:00")

# Use as.POSIXct again but set the timezone to `"America/Los_Angeles"`
as.POSIXct("2010-10-01 12:12:00", tz = "America/Los_Angeles")

# Use read_csv to import rversions.csv
releases <- read_csv("data/rversions.csv")

# Examine structure of datetime column
str(releases$datetime)
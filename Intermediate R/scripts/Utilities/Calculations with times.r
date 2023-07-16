# Calcular la diferencia entre los dos vectores logout y login,
# es decir, el tiempo que el usuario estuvo en línea
# en cada sesión independiente.
# Almacenar el resultado en una variable time_online.
# Inspeccionar la variable time_online imprimiéndola.
# Calcular el tiempo total que el usuario estuvo en línea.
# Imprimir el resultado.
# Calcular el tiempo promedio que el usuario estuvo en línea.
# Imprimir el resultado.


# login and logout are already defined in the workspace
# define a character vector of dates and times
dates <- c(
    "2023-07-02 10:18:04", "2023-07-07 09:14:18",
    "2023-07-07 12:21:51", "2023-07-07 12:37:24", "2023-07-09 21:37:55"
)

# convert the character vector to a POSIXct object
login <- as.POSIXct(dates, tz = "UTC")
logout <- c(
    "2023-07-02 11:23:45", "2023-07-07 10:45:12",
    "2023-07-07 13:02:19", "2023-07-07 13:45:11", "2023-07-09 22:45:32"
)
logout <- as.POSIXct(logout)

# Calculate the difference between login and logout: time_online
time_online <- logout - login

# Inspect the variable time_online
time_online

# Calculate the total time online
sum(time_online)

# Calculate the average time online
mean(time_online)

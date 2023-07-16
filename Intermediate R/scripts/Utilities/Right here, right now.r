# Pregunte a R por la fecha actual y
# almacene el resultado en una variable llamada today.
# Para ver cómo se ve hoy en el fondo, llame a unclass() en él.
# Pregunte a R por la hora actual y
# almacene el resultado en una variable llamada now.
# Para ver el valor numérico que corresponde a ahora, llame a unclass() en él.

# Get the current date: today
today <- Sys.Date()

# See what today looks like under the hood
unclass(today)

# Get the current time: now
now <- Sys.time()

# See what now looks like under the hood
unclass(now)

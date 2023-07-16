# Calcula el número de días que han pasado entre el primer y
# el último día que comiste pizza. Imprime el resultado.
# Usa la función diff() en pizza para calcular las diferencias entre
# los días de pizza consecutivos.
# Almacena el resultado en una nueva variable llamada day_diff.
# Calcula el periodo promedio entre dos días consecutivos de pizza.
# Imprime el resultado.

# day1, day2, day3, day4 and day5 are already available in the workspace
day1 <- as.Date("2023-06-28")
day2 <- as.Date("2023-06-30")
day3 <- as.Date("2023-07-05")
day4 <- as.Date("2023-07-11")
day5 <- as.Date("2023-07-16")

# Difference between last and first pizza day
day5 - day1

# Create vector pizza
pizza <- c(day1, day2, day3, day4, day5)

# Create differences between consecutive pizza days: day_diff
day_diff <- diff(pizza)

# Average period between two consecutive pizza days
mean(day_diff)

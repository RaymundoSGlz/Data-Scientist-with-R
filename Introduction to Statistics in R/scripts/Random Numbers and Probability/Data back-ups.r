# Para modelar cuanto tiempo Amir esperará por una copia de seguridad
# usando una distribución uniforme continua,
# guarde su tiempo de espera mínimo como min
# y su tiempo de espera máximo como max.
# Recuerde que las copias de seguridad se realizan cada 30 minutos.

# Min and max wait times for back-up that happens every 30 min
min <- 0
max <- 30

# Calcular la probabilidad de que Amir tenga que esperar menos de 5 minutos
# y almacenar en una variable llamada prob_less_than_5.
prob_less_than_5 <- punif(5, min, max)
prob_less_than_5

# Calcular la probabilidad de que Amir tenga que esperar más de 5 minutos
# y almacenar en una variable llamada prob_greater_than_5.
prob_greater_than_5 <- 1 - prob_less_than_5
punif(5, min, max, lower.tail = FALSE)
prob_greater_than_5

# Calcular la probabilidad de que Amir tenga que esperar entre 10 y 20 minutos,
# y almacenar en una variable llamada prob_between_10_and_20.
prob_between_10_and_20 <- punif(20, min, max) - punif(10, min, max)
prob_between_10_and_20

# ¿Cuál es la probabilidad de que Amir responda a 5 clientes
# potenciales en un día,
# dado que responde a un promedio de 4?

# Probability of 5 responses
dpois(5, lambda = 4)

# Los compañeros de trabajo de Amir responden a un promedio de 5.5
# clientes potenciales por día.
# ¿Cuál es la probabilidad de que ella responda 5 clientes
# potenciales en un día?

# Probability of 5 responses from coworker
dpois(5, lambda = 5.5)

# ¿Cuál es la probabilidad de que Amir responda a 2 o menos
# clientes potenciales en un día?

# Probability of 2 or fewer responses
ppois(2, lambda = 4)

# ¿Cuál es la probabilidad de que Amir responda
# a más de 10 clientes potenciales?

# Probability of > 10 responses
ppois(10, lambda = 4, lower.tail = FALSE)

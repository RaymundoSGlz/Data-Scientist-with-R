# ¿Cuál es la probabilidad de que Amir tarde
# menos de una hora en responder a un lead?

# Probability response takes < 1 hour
pexp(1, rate = 1 / 2.5)

# ¿Cuál es la probabilidad de que Amir tarde más
# de 4 horas en responder a un lead?

# Probability response takes > 4 hours
pexp(4, rate = 1 / 2.5, lower.tail = FALSE)

# ¿Cuál es la probabilidad de que Amir tarde
# entre 3 y 4 horas en responder a un lead?

# Probability response takes 3-4 hours
pexp(4, rate = 1 / 2.5) - pexp(3, rate = 1 / 2.5)

# ¿Cuál es la probabilidad de que Amir cierre los 3 tratos en una semana?

# Probability of closing 3 out of 3 deals
dbinom(3, size = 3, prob = 0.3)

# ¿Cuál es la probabilidad de que Amir cierre 1 o menos tratos en una semana?

# Probability of closing <= 1 deal out of 3 deals
pbinom(1, size = 3, prob = 0.3)

# ¿Cuál es la probabilidad de que Amir cierre más de 1 trato?

# Probability of closing > 1 deal out of 3 deals
pbinom(1, size = 3, prob = 0.3, lower.tail = FALSE)

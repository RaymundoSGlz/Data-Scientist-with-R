# Establecer la semilla aleatoria a 10 y simular un solo trato.

# Set random seed to 10
set.seed(10)

# Simulate a single deal
rbinom(1, 1, 0.3)

# Simular una semana típica de tratos de Amir, o una semana de 3 tratos.
rbinom(1, 3, 0.3)

# Simular un año de tratos de Amir, o 52 semanas de 3 tratos cada una,
# y almacenar en deals.
# Calcular el número medio de tratos que ganó por semana.

# Simulate 52 weeks of 3 deals
deals <- rbinom(52, 3, 0.3)

# Calculate mean deals won per week
mean(deals)

# ¿Qué probabilidad hay de que Amir cierre un trato por menos de $7500?
library(dplyr)
library(readr)
amir_deals <- read_rds("data/seller_1.rds")
mean <- mean(amir_deals$amount)
std <- sd(amir_deals$amount)

# Probability of deal < 7500
pnorm(7500, mean, std)

# ¿Cuál es la probabilidad de que Amir cierre un trato por más de $1000?
pnorm(1000, mean, std, lower.tail = FALSE)

# ¿Cuál es la probabilidad de que Amir cierre un trato por entre $3000 y $7000?
pnorm(7000, mean, std) - pnorm(3000, mean, std)

# ¿Qué monto será superado por el 75% de las ventas de Amir?
qnorm(0.75, mean, std, lower.tail = FALSE)

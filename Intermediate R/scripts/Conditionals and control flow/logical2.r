# ¿Cuándo superaron las vistas de LinkedIn los 10
# y las vistas de Facebook no alcanzaron los 10 para un día en particular?
# Usa los vectores linkedin y facebook.

# ¿Cuándo uno o ambos perfiles de LinkedIn y Facebook
# fueron visitados al menos 12 veces?

# ¿Cuándo la matriz de vistas es igual a un número entre 11 y 14,
# excluyendo 11 e incluyendo 14?

# The social data (linkedin, facebook, views) has been created for you
facebook <- c(17, 7, 5, 16, 8, 13, 14)
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
views <- matrix(c(facebook, linkedin), ncol = 7)

# linkedin exceeds 10 but facebook below 10
linkedin > 10 & facebook < 10

# When were one or both visited at least 12 times?
linkedin >= 12 | facebook >= 12

# When is views between 11 (exclusive) and 14 (inclusive)?
views > 11 & views <= 14

# Escriba expresiones en R para resolver las siguientes preguntas
# sobre la variable last:

# ¿Está last por debajo de 5 o por encima de 10?
# ¿Está last entre 15 y 20, excluyendo 15 pero incluyendo 20?

# The linkedin and last variable are already defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
last <- tail(linkedin, 1)

# Is last under 5 or above 10?
last > 5 | last < 10

# Is last between 15 (exclusive) and 20 (inclusive)?
last > 15 & last <= 20

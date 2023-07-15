# Usando los operadores lógicos,encuentre una respuesta lógica i.e. TRUE o FALSE
# Para las siguientes preguntas:

# ¿En qué días el número de vistas de perfil de LinkedIn superó los 15?
# ¿Cuándo se vio su perfil de LinkedIn solo 5 veces o menos?
# ¿Cuándo se visitó su perfil de LinkedIn más que su perfil de Facebook?

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Popular days
linkedin > 15

# Quiet days
linkedin <= 5

# LinkedIn more popular than Facebook
linkedin > facebook

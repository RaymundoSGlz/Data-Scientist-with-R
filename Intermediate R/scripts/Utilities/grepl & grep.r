# Usa grepl() para generar un vector de valores lógicos
# que indique si estas direcciones de correo electrónico contienen "edu".
# Imprime el resultado en la salida.
# Haz lo mismo con grep(),
# pero esta vez guarda los índices resultantes en una variable llamada hits.
# Usa la variable hits para seleccionar del vector de correos electrónicos
# solo los correos electrónicos que contienen "edu".

# The emails vector has already been defined for you
emails <- c(
    "john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
    "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv"
)

# Use grepl() to match for "edu"
grepl(pattern = "edu", x = emails)

# Use grep() to match for "edu", save result to hits
hits <- grep(pattern = "edu", x = emails)

# Subset emails using hits
emails[hits]

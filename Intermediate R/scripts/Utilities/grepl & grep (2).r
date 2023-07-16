# Usa grepl() con una expresión regular más avanzada
# para devolver un vector lógico. Simplemente imprime el resultado.
# Haz algo similar con grep() para crear un vector de índices.
# Almacena el resultado en la variable hits.
# Usa emails[hits] de nuevo para subconjuntar el vector de correos electrónicos.

# The emails vector has already been defined for you
emails <- c(
    "john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
    "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv"
)

# Use grepl() to match for .edu addresses more robustly
grepl(
    pattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.edu$",
    x = emails
)

# Use grep() to match for .edu addresses more robustly, save result to hits
hits <- grep(
    pattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.edu$",
    x = emails
)

# Subset emails using hits
emails[hits]

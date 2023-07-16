# Con la expresión regular avanzada "@.*\\.edu$",
# usa sub() para reemplazar la coincidencia con "@datacamp.edu".
# Dado que solo habrá una coincidencia por cadena de caracteres,
# no es necesario usar gsub() aquí. Inspecciona la salida resultante.

# The emails vector has already been defined for you
emails <- c(
    "john.doe@ivyleague.edu", "education@world.gov", "global@peace.org",
    "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv"
)

# Use sub() to convert the email domains to datacamp.edu
sub(pattern = "@.*\\.edu$", replacement = "@datacamp.edu", x = emails)

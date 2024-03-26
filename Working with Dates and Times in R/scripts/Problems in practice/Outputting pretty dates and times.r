library(lubridate)
finished <- "I finished 'Dates and Times in R' on Thursday, September 4, 2017!"
# - Crea un `stamp()` basado en la cadena `"Saturday, Jan 1, 2000”`.
# - Imprime `date_stamp`. *Nota que es una función.*
# - Pasa `today()` a `date_stamp` para formatear la fecha de hoy.
# - Ahora muestra la fecha de hoy en estilo americano `MM/DD/YYYY`.
# - Finalmente, usa stamp basado en la cadena `finished`
## que he puesto en tu espacio de trabajo para formatear `today()`.

# Create a stamp based on "Saturday, Jan 1, 2000"
date_stamp <- stamp("Saturday, Jan 1, 2000")

# Print date_stamp
date_stamp

# Call date_stamp on today()
date_stamp(today())

# Create and call a stamp based on "12/31/1999"
stamp("12/31/1999")(today())

# Use string finished for stamp()
stamp(finished)(today())

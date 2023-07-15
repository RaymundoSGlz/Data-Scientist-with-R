# Para solucionar el error que viste en la consola, carga el paquete ggplot2.
# Asegúrate de cargar (y no instalar) el paquete.
# Ahora, vuelve a llamar a la función qplot() con los mismos argumentos.
# Finalmente, verifica los paquetes actualmente adjuntos.

# Load the ggplot2 package
library(ggplot2)

# Retry the qplot() function
qplot(mtcars$wt, mtcars$hp)

# Check out the currently attached packages again
search()

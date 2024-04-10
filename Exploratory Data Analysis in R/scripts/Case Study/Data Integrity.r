library(openintro)

# Considera las variables `image` y `attach`.
## Puedes leer sobre ellas con `?email`,
## pero el archivo de ayuda es ambiguo:
## ¿las imágenes adjuntas cuentan como archivos adjuntos
## en este conjunto de datos?

# Diseña una prueba simple para determinar si las imágenes
## cuentan como archivos adjuntos.
## Esto implica crear una condición lógica para comparar
## los valores de las dos variables,
## luego usar `sum()` para evaluar todos los casos en el conjunto de datos.
## Recuerda que los operadores lógicos son `<` para *menos que*,
## `<=` para *menos que o igual a*, `>` para *más que*,
## `>=` para *más que o igual a*, y `==` para *igual a*.

# Test if images count as attachments
sum(email$image > email$attach)

library(tidyverse)
monarchs <- read_csv("data/monarchs.csv")

# Hemos cargado los datos monarchs en su espacio de trabajo.

# - Imprime `monarchs` para echar un vistazo a los datos.
# - Crea una nueva columna llamada `reign`
## que es un intervalo entre `from` y `to`
# - Crea otra nueva columna, length, que es el tamaño del intervalo `reign`.
## El resto del pipeline que hemos completado para usted, lo organiza
## disminuyendo `length` y selecciona las columnas `name`, `length` y `dominion`

# Print monarchs
monarchs

# Create an interval for reign
monarchs <- monarchs %>%
  mutate(reign = from %--% to)

# Find the length of reign, and arrange
monarchs %>%
  mutate(length = int_length(reign)) %>%
  arrange(desc(length)) %>%
  select(name, length, dominion)

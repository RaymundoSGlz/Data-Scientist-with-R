library(tidyverse)
halleys <- read_csv("data/halleys.csv")
monarchs <- read_csv("data/monarchs.csv")
monarchs <- monarchs %>%
  mutate(reign = from %--% to)
# Hemos cargado los datos `halleys` que describen las apariciones
## del cometa Halley en su espacio de trabajo.

# - Imprima `halleys` para examinar la fecha.
## `perihelion_date` es la fecha en la que el cometa está más cerca del Sol.
## `start_date` y `end_date` son el rango de fechas
## en las que el cometa es visible desde la Tierra.
# - Cree una nueva columna, `visible`,
## que sea un intervalo desde `start_date` hasta `end_date`.
# - Trabajarás con una aparición, extrae la 14ª fila de `halleys`.
# - Filtra `monarchs` para aquellos en los que `halleys_1066$perihelion_date`
## está dentro de `reign`.
# - Filtra `monarchs` para aquellos en los que `halleys_1066$visible`
## se superpone con `reign`.

# Print halleys
halleys

# New column for interval from start to end date
halleys <- halleys %>%
  mutate(visible = start_date %--% end_date)

# The visitation of 1066
halleys_1066 <- halleys[14, ]

# Monarchs in power on perihelion date
monarchs %>%
  filter(halleys_1066$perihelion_date %within% reign) %>%
  select(name, from, to, dominion)

# Monarchs whose reign overlaps visible time
monarchs %>%
  filter(int_overlaps(halleys_1066$visible, reign)) %>%
  select(name, from, to, dominion)

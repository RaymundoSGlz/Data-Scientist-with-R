library(lubridate)
library(readr)
library(dplyr)
releases <- read_csv("data/rversions.csv")
release_time <- releases$datetime
# - Examina el `head()` de `release_time` para verificar
## que es un vector de datetimes.
# - Extrae el mes de `release_time` y examina los primeros con `head()`.
# - Para ver en qué meses se realizan más lanzamientos,
## extrae el mes y luego envíalo a `table()`.
# - Repite, para ver en qué años se realizan más lanzamientos.
# - ¿Los lanzamientos ocurren por la mañana (UTC)?
## Descubre si la hora de un lanzamiento es menor que `12` y resume con `mean()`
# - Alternativamente, utiliza `am()` para averiguar
## con qué frecuencia ocurren los lanzamientos por la mañana.


# Examine the head() of release_time
head(release_time)

# Examine the head() of the months of release_time
head(month(release_time))

# Extract the month of releases
month(release_time) %>% table()

# Extract the year of releases
year(release_time) %>% table()

# How often is the hour before 12 (noon)?
mean(hour(release_time) < 12)

# How often is the release in am?
mean(am(release_time))

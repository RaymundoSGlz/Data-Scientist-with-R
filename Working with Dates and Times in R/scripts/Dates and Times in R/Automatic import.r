# Utiliza read_csv() para leer el archivo CSV rversions.csv como releases.
# Utiliza str() para examinar la estructura de la columna date.
## Nota que ya es un objeto Date.
# Hemos cargado anytime y creado un objeto llamado sep_10_2009.
## Utiliza la función anytime() para analizar sep_10_2009.

# Load the readr package
library(readr)

# Use read_csv() to import rversions.csv
releases <- read_csv("data/rversions.csv")

# Examine the structure of the date column
str(releases$date)

# Load the anytime package
library(anytime)

# Various ways of writing Sep 10 2009
sep_10_2009 <- c("September 10 2009", "2009-09-10", "10 Sep 2009", "09-10-2009")

# Use anytime() to parse sep_10_2009
anytime(sep_10_2009)
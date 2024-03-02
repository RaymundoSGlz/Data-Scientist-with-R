library(ggplot2)
library(readr)
library(dplyr)

# - Usa `read_csv()` para importar `cran-logs_2015-04-17.csv`.
# - Imprime `logs` para ver la información que tenemos en cada descarga.
# - Almacena el tiempo de lanzamiento de R 3.2.0 como un objeto `POSIXct`.
# - Descubre cuándo se hizo la primera solicitud para 3.2.0 filtrando
## por valores en la columna `datetime` que son mayores que `release_time`.
# - Finalmente, ve cómo aumentan las descargas creando histogramas
## del tiempo de descarga para 3.2.0 y la versión anterior 3.1.3.
## Hemos proporcionado la mayoría del código,
## solo necesitas especificar la estética `x` para que sea la columna `datetime`

# Import "cran-logs_2015-04-17.csv" with read_csv()
logs <- read_csv("data/cran-logs_2015-04-17.csv")

# Print logs
logs

# Store the release time as a POSIXct object
release_time <- as.POSIXct("2015-04-16 07:13:33", tz = "UTC")

# When is the first download of 3.2.0?
logs %>%
  filter(
    datetime > release_time,
    r_version == "3.2.0"
  )

# Examine histograms of downloads by version
ggplot(logs, aes(x = datetime)) +
  geom_histogram() +
  geom_vline(aes(xintercept = as.numeric(release_time))) +
  facet_wrap(~r_version, ncol = 1)

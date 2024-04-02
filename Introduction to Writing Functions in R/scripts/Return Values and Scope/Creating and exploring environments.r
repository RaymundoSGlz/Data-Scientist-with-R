library(zeallot)
south_africa_data <- readRDS("data/south_africa_data.rds")
c(capitals, national_parks, population) %<-% south_africa_data

# 1. Crea `rsa_lst`, una lista con nombres a partir de `capitals`,
## `national_parks` y `population`. Usa esos valores como los nombres.
## Enumera la estructura de cada elemento de `rsa_lst` usando `ls.str()`.

# Add capitals, national_parks, & population to a named list
rsa_lst <- list(
  capitals = capitals,
  national_parks = national_parks,
  population = population
)

# List the structure of each element of rsa_lst
ls.str(rsa_lst)

# 2. Convierte la lista en un entorno, `rsa_env`, usando `list2env()`.
## Enumera la estructura de cada elemento de `rsa_env`

rsa_env <- list2env(rsa_lst)

# List the structure of each variable
ls.str(rsa_env)

#3. Encuentra el entorno padre de `rsa_env` e imprime su nombre.

# Find the parent environment of rsa_env
parent <- parent.env(rsa_env)

# Print its name
environmentName(parent)
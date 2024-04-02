library(zeallot)
south_africa_data <- readRDS("data/south_africa_data.rds")
c(capitals, national_parks, population) %<-% south_africa_data
rsa_lst <- list(
  capitals = capitals,
  national_parks = national_parks
)
rsa_env <- list2env(rsa_lst)

# - Verifica si `population` existe en `rsa_env`,
## utilizando las reglas de herencia por defecto.
# - Verifica si `population` existe en `rsa_env`, ignorando la herencia.

# Compare the contents of the global environment and rsa_env
ls.str(globalenv())
ls.str(rsa_env)

# Does population exist in rsa_env?
exists("population", envir = rsa_env)

# Does population exist in rsa_env, ignoring inheritance?
exists("population", envir = rsa_env, inherits = FALSE)
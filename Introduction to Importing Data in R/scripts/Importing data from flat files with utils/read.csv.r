# Usar read.csv() para importar "swimming_pools.csv"
# como un data frame con el nombre pools.
# Imprimir la estructura de pools usando str().

# Import swimming_pools.csv: pools
pools <- read.csv("./data/swimming_pools.csv")

# Print the structure of pools
str(pools)

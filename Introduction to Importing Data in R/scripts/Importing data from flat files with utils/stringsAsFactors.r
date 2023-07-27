# Usar read.csv() para importar los datos en "swimming_pools.csv"
# como un data frame llamado pools;
# asegúrese de que las cadenas se importen como caracteres, no como factores.
# Usando str(), muestra la estructura del conjunto de datos
# y verifica que obtienes vectores de caracteres en lugar de factores.

# Import swimming_pools.csv: pools
pools <- read.csv("./data/swimming_pools.csv", stringsAsFactors = FALSE)

# Print the structure of pools
str(pools)

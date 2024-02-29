library(stringdist)

# Calcule la distancia de Damerau-Levenshtein entre:
## "las angelos" y "los angeles".

# Calculate Damerau-Levenshtein distance
stringdist("las angelos", "los angeles", method = "dl")

# Calcule la distancia de Subcadena Común Más Larga (LCS) entre:
## "las angelos" y "los angeles".

# Calculate LCS distance
stringdist("las angelos", "los angeles", method = "lcs")

# Calcule la distancia de Jaccard entre "las angelos" y "los angeles".

# Calculate Jaccard distance
stringdist("las angelos", "los angeles", method = "jaccard")

# Transforma la primera llamada de lapply()
# para que use una función anónima que haga lo mismo.
# De manera similar, convierte la segunda llamada de lapply()
# para que use una versión anónima de la función select_second().
# Elimina las definiciones de select_first()
# y select_second(), ya que ya no son útiles.

# split_low has been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Transform: use anonymous function inside lapply
names <- lapply(split_low, function(x) {
    x[1]
})

# Transform: use anonymous function inside lapply
years <- lapply(split_low, function(x) {
    x[2]
})

# Usa lapply() dos veces para llamar a select_el()
# en todos los elementos de split_low:
# una vez con el índice igual a 1 y una segunda vez con el índice igual a 2.
# Asigna el resultado a names y years, respectivamente.

# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Generic select function
select_el <- function(x, index) {
  x[index]
}

# Use lapply() twice on split_low: names and years
names <- lapply(split_low, select_el, index = 1)
years <- lapply(split_low, select_el, index = 2)

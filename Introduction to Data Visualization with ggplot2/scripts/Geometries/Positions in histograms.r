library(ggplot2)
library(dplyr)
fam <- c(
    "manual", "manual", "manual", "automatic", "automatic", "automatic", "automatic",
    "automatic", "automatic", "automatic", "automatic", "automatic", "automatic", "automatic",
    "automatic", "automatic", "automatic", "manual", "manual", "manual", "automatic",
    "automatic", "automatic", "automatic", "automatic", "manual", "manual", "manual",
    "manual", "manual", "manual", "manual"
)
mtcars <- mtcars %>%
    mutate(fam = factor(fam)) %>%
    mutate(fcyl = factor(cyl))

# 1. Actualice los estéticos para que el color de fill de las barras
# sea determinado por fam.

# Update the aesthetics so the fill color is by fam
ggplot(mtcars, aes(mpg, fill = fam)) +
    geom_histogram(binwidth = 1)

# 2. Actualice la capa del histograma para posicionar las barras
# una al lado de la otra, es decir, "dodge".

ggplot(mtcars, aes(mpg, fill = fam)) +
    # Change the position to dodge
    geom_histogram(binwidth = 1, position = "dodge")

# 3. Actualice la capa del histograma para que las posiciones de las barras
# "fill" el eje y.

ggplot(mtcars, aes(mpg, fill = fam)) +
    # Change the position to fill
    geom_histogram(binwidth = 1, position = "fill")

# 4. Actualice la capa del histograma para que las barras
# estén una encima de la otra, usando la posición "identity".
# Para que cada barra se pueda ver, establezca alpha en 0.4.

ggplot(mtcars, aes(mpg, fill = fam)) +
    # Change the position to identity, with transparency 0.4
    geom_histogram(binwidth = 1, position = "identity", alpha = 0.4)

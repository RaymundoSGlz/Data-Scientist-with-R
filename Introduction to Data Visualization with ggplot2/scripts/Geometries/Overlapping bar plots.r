library(ggplot2)
library(dplyr)
fam <- c(
    "manual", "manual", "manual", "automatic", "automatic", "automatic",
    "automatic", "automatic", "automatic", "automatic", "automatic",
    "automatic", "automatic", "automatic", "automatic", "automatic",
    "automatic", "manual", "manual", "manual", "automatic",
    "automatic", "automatic", "automatic", "automatic", "manual",
    "manual", "manual", "manual", "manual", "manual", "manual"
)
mtcars <- mtcars %>%
    mutate(fam = factor(fam)) %>%
    mutate(fcyl = factor(cyl))
# 1. Use la forma funcional de la posición de la barra:
# reemplace "dodge" con una llamada a position_dodge ().
# Establezca su ancho en 0.2.

ggplot(mtcars, aes(cyl, fill = fam)) +
    # Change position to use the functional form, with width 0.2
    geom_bar(position = position_dodge(width = 0.2))

# 2. Establezca el nivel de transparencia de la barra de las barras en 0.6.

ggplot(mtcars, aes(cyl, fill = fam)) +
    # Set the transparency to 0.6
    geom_bar(position = position_dodge(width = 0.2), alpha = 0.6)

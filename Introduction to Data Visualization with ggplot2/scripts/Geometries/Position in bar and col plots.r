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
# 1. Usando mtcars, grafique fcyl, relleno por fam.
# Agregue una capa de barra usando geom_bar ().

# Plot fcyl, filled by fam
ggplot(mtcars, aes(x = fcyl, fill = fam)) +
    # Add a bar layer
    geom_bar()

# 2. Establezca el argumento de position de la barra en "fill".

ggplot(mtcars, aes(fcyl, fill = fam)) +
    # Set the position to "fill"
    geom_bar(position = "fill")

# 3. Cambie el argumento de position de la barra a "dodge".

ggplot(mtcars, aes(fcyl, fill = fam)) +
    # Change the position to "dodge"
    geom_bar(position = "dodge")

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
# Usando estas tres funciones, defina estos objetos de posición:
# posn_j: se moverá con un width de 0.2.
# posn_d: se esquivará con un width de 0.1.
# posn_jd se moverá y esquivará con
# un jitter.width de 0.2 y un dodge.width de 0.1.

# Define position objects
# 1. Jitter with width 0.2
posn_j <- position_jitter(width = 0.2)

# 2. Dodge with width 0.1
posn_d <- position_dodge(width = 0.1)

# 3. Jitter-dodge with jitter.width 0.2 and dodge.width 0.1
posn_jd <- position_jitterdodge(jitter.width = 0.2, dodge.width = 0.1)

# Graficar wt vs. fcyl, coloreado por fam.
# Asignar esta capa base a p_wt_vs_fcyl_by_fam.
# Graficar los datos usando geom_point().

# Create the plot base: wt vs. fcyl, colored by fam
p_wt_vs_fcyl_by_fam <- ggplot(mtcars, aes(x = fcyl, y = wt, color = fam))

# Add a point layer
p_wt_vs_fcyl_by_fam + geom_point()

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
# 1. Crear una traza base plt_mpg_vs_fcyl_by_fam
# de fcyl por mpg, coloreada por fam.
# Agregar una capa de puntos a la traza base.

# Plot base
plt_mpg_vs_fcyl_by_fam <- ggplot(mtcars, aes(fcyl, mpg, color = fam))

# Default points are shown for comparison
plt_mpg_vs_fcyl_by_fam + geom_point()

# 2. Agregar un poco de jittering usando position_jitter(),
# estableciendo width en 0.3.

# Alter the point positions by jittering, width 0.3
plt_mpg_vs_fcyl_by_fam +
    geom_point(position = position_jitter(width = 0.3))

# 3. Alternativamente, usar position_jitterdodge().
# Establecer jitter.width y dodge.width en 0.3 para separar más los subgrupos.

# Now jitter and dodge the point positions
plt_mpg_vs_fcyl_by_fam +
    geom_point(
        position = position_jitterdodge(jitter.width = 0.3, dodge.width = 0.3)
    )

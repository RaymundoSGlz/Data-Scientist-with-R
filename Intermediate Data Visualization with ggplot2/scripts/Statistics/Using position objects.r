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

posn_j <- position_jitter(width = 0.2)
posn_d <- position_dodge(width = 0.1)
posn_jd <- position_jitterdodge(jitter.width = 0.2, dodge.width = 0.1)

p_wt_vs_fcyl_by_fam <- ggplot(mtcars, aes(x = fcyl, y = wt, color = fam))
# 1. Aplicar la posición de jitter, posn_j, a la gráfica base.

# Add jittering only
p_wt_vs_fcyl_by_fam + geom_point(position = posn_j)

# 2. Aplicar la posición de dodge, posn_d, a la gráfica base.

# Add dodging only
p_wt_vs_fcyl_by_fam + geom_point(position = posn_d)

# 3. Aplicar la posición de jitter-dodge, posn_jd, a la gráfica base.

# Add jittering and dodging
p_wt_vs_fcyl_by_fam + geom_point(position = posn_jd)

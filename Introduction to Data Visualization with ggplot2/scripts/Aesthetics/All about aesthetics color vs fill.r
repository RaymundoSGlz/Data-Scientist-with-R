library(ggplot2)
# 1 Cambia los estéticos para que fcyl mapee a fill en lugar de color.

# Map fcyl to fill
ggplot(mtcars, aes(wt, mpg, fill = cyl)) +
    geom_point(shape = 1, size = 4)

# 2 En geom_point () cambie el argumento de shape a 21
# y agregue un argumento alpha establecido en 0.6.

ggplot(mtcars, aes(wt, mpg, fill = cyl)) +
    # Change point shape; set alpha
    geom_point(shape = 21, size = 4, alpha = 0.6)

# 3 En los estéticos de ggplot (), mapee fam a color.

# Map color to fam
ggplot(mtcars, aes(wt, mpg, fill = cyl, color = fam)) +
    geom_point(shape = 21, size = 4, alpha = 0.6)

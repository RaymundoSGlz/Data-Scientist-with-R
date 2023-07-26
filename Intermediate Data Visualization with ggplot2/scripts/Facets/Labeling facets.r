library(ggplot2)
# 1. Agregar una capa facet_grid() y
# facet cols según el cyl usando vars(). No hay etiquetado.

# Plot wt by mpg
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # The default is label_value
  facet_grid(cols = vars(cyl))

# 2. Aplicar label_both al argumento labeller y comprobar la salida.

# Plot wt by mpg
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Displaying both the values and the variables
  facet_grid(cols = vars(cyl), labeller = label_both)

# 3. Aplicar label_context al argumento labeller y comprobar la salida.

# Plot wt by mpg
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Label context
  facet_grid(cols = vars(cyl), labeller = label_context)

# 4. Además de label_context, vamos a facetar por una variable más: vs.

# Plot wt by mpg
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  # Two variables
  facet_grid(cols = vars(vs, cyl), labeller = label_context)

library(ggplot2)
library(carData)
# Grafique el conjunto de datos Vocab,
# mapeando education en x y vocabulario en fill.

# Plot education, filled by vocabulary
ggplot(Vocab, aes(education, fill = factor(vocabulary))) +
    geom_bar()


# Plot education, filled by vocabulary
ggplot(Vocab, aes(education, fill = factor(vocabulary))) +
    # Add a bar layer with position "fill"
    geom_bar(position = "fill")

# Agregar scale_fill_brewer(),
# utilizando la paleta predeterminada (no pase ningún argumento).
# Observe cómo esto genera un mensaje de advertencia y un gráfico incompleto.

# Plot education, filled by vocabulary
ggplot(Vocab, aes(education, fill = factor(vocabulary))) +
    # Add a bar layer with position "fill"
    geom_bar(position = "fill") +
    # Add a brewer fill scale with default palette
    scale_fill_brewer()

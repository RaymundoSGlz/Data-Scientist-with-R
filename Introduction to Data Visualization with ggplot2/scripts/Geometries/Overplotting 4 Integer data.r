library(ggplot2)
library(carData)
# 1. Examine el conjunto de datos Vocab usando str().
# Usando Vocab, dibuje un gráfico de vocabulary vs education.
# Agregue una capa de puntos.

# Examine the structure of Vocab
str(Vocab)

# Plot vocabulary vs. education
ggplot(Vocab, aes(education, vocabulary)) +
    # Add a point layer
    geom_point()

# 2. Reemplace la capa de puntos con una capa de jitter.

ggplot(Vocab, aes(education, vocabulary)) +
    # Change to a jitter layer
    geom_jitter()

# 3. Establezca la transparencia de jitter en 0.2.

ggplot(Vocab, aes(education, vocabulary)) +
    # Set the transparency to 0.2
    geom_jitter(alpha = 0.2)

# 4. Establezca la forma de los puntos jittered en círculos huecos, (forma 1).

ggplot(Vocab, aes(education, vocabulary)) +
    # Set the shape to 1
    geom_jitter(alpha = 0.2, shape = 1)

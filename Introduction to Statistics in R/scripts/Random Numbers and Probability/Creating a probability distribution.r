# Crear un histograma de la columna group_size
# de restaurant_groups, estableciendo el número de bins en 5.

# Cargamos los datos de restaurant_groups
library(dplyr)
library(ggplot2)
restaurant_groups <- data.frame(
    group_id = c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J"),
    group_size = c(2, 4, 6, 2, 2, 2, 3, 2, 4, 2)
)

# Create a histogram of group_size
ggplot(restaurant_groups, aes(group_size)) +
    geom_histogram(bins = 5)

# Contar el número de cada group_size en restaurant_groups,
# luego agregar una columna llamada probability que contenga la probabilidad
# de seleccionar aleatoriamente un grupo de cada tamaño.
# Almacene esto en un nuevo dataframe llamado size_distribution.

# Create probability distribution
size_distribution <- restaurant_groups %>%
    # Count number of each group size
    count(group_size) %>%
    # Calculate probability
    mutate(probability = n / sum(n))

size_distribution

# Calcular el valor esperado de size_distribution,
# que representa el tamaño esperado del grupo.

# Calculate expected group size
expected_val <- sum(size_distribution$group_size *
    size_distribution$probability)
expected_val

# Calcular la probabilidad de seleccionar aleatoriamente
# un grupo de 4 o más personas filtrando y resumiendo.
# Calculate probability of picking group of 4 or more
size_distribution %>%
    # Filter for groups of 4 or larger
    filter(group_size >= 4) %>%
    # Calculate prob_4_or_more by taking sum of probabilities
    summarize(prob_4_or_more = sum(probability))

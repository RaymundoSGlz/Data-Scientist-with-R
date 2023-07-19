# Use otro inner join para combinar temas nuevamente con sí mismo.
# Asegúrese de usar los sufijos "_parent" y "_grandchild"
# para que las columnas en la tabla resultante sean claras.
# Actualice el argumento by para especificar las columnas correctas
# para unirse. Si no está seguro de en qué columnas unirse,
# puede ayudar ver el resultado de la primera unión para tener una idea.

# Cargamos el dataset
library(dplyr)
library(readr)
themes <- read_rds("data/themes.rds")

# Join themes to itself again to find the grandchild relationships
themes %>%
    inner_join(themes,
        by = c("id" = "parent_id"),
        suffix = c("_parent", "_child")
    ) %>%
    inner_join(themes,
        by = c("id_child" = "parent_id"),
        suffix = c("_parent", "_grandchild")
    )

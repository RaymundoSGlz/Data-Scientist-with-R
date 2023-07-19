# Une los temas con sus propios hijos mediante un inner join,
# resultando en los sufijos "_parent" y "_child", respectivamente.
# Filtra esta tabla para encontrar los hijos del tema "Harry Potter".

# Cargamos el dataset
library(dplyr)
library(readr)
themes <- read_rds("data/themes.rds")

themes %>%
    # Inner join the themes table
    inner_join(themes,
        by = c("id" = "parent_id"),
        suffix = c("_parent", "_child")
    ) %>%
    # Filter for the "Harry Potter" parent name
    filter(name_parent == "Harry Potter")

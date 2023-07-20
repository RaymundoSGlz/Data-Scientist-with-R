# Unir questions y question_tags
# usando las columnas id y question_id, respectivamente.

# Usar otra unión para agregar la tabla de etiquetas.

# Usar replace_na para cambiar los NA en la columna tag_name a "only-r".

# Cargamos los datasets
library(dplyr)
library(readr)
library(tidyr)
questions <- read_rds("data/questions.rds")
question_tags <- read_rds("data/question_tags.rds")
tags <- read_rds("data/tags.rds")

# Join the questions and question_tags tables
questions %>%
    left_join(question_tags, by = c("id" = "question_id")) %>%
    left_join(tags, by = c("tag_id" = "id")) %>%
    replace_na(list(tag_name = "only-r"))
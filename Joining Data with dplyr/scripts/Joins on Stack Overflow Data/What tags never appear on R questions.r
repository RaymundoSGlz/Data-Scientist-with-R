# Usar una unión para determinar qué etiquetas
# nunca aparecen en una pregunta de R.

# Cargamos los datasets
library(dplyr)
library(readr)
tags <- read_rds("data/tags.rds")
questions <- read_rds("data/questions.rds")
question_tags <- read_rds("data/question_tags.rds")

# Using a join, filter for tags that are never on an R question
tags %>% 
    anti_join(question_tags, by = c("id" = "tag_id"))
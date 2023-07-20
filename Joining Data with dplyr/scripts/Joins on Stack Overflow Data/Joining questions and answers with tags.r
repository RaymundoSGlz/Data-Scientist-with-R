# Use dos inner joins para combinar las tablas
# question_tags y tags con la tabla questions.
# Ahora, use dos inner joins para combinar las tablas
# question_tags y tags con la tabla answers.

# Cargamos los datasets
library(dplyr)
library(readr)
questions <- read_rds("data/questions.rds")
answers <- read_rds("data/answers.rds")
tags <- read_rds("data/tags.rds")
question_tags <- read_rds("data/question_tags.rds")

# Inner join the question_tags and tags tables with the questions table
questions %>%
  inner_join(question_tags, by = c("id" = "question_id")) %>%
  inner_join(tags, by = c("tag_id" = "id"))

# Inner join the question_tags and tags tables with the answers table
answers %>%
  inner_join(question_tags, by = "question_id") %>%
  inner_join(tags, by = c("tag_id" = "id"))
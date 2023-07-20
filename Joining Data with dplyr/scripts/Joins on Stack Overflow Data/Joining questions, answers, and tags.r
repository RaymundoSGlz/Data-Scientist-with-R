# Combine la tabla question_tags con question_answer_counts usando inner_join.
# Ahora, use otro inner_join para agregar la tabla tags.

# Cargamos los datasets
library(dplyr)
library(readr)
library(tidyr)
questions <- read_rds("data/questions.rds")
answers <- read_rds("data/answers.rds")
tags <- read_rds("data/tags.rds")
question_tags <- read_rds("data/question_tags.rds")

answer_counts <- answers %>%
    count(question_id, sort = TRUE)

question_answer_counts <- questions %>%
    left_join(answer_counts, by = c("id" = "question_id")) %>%
    replace_na(list(n = 0))

question_answer_counts %>%
  # Join the question_tags tables
  inner_join(question_tags, by = c("id" = "question_id")) %>%
  # Join the tags table
    inner_join(tags, by = c("tag_id" = "id"))

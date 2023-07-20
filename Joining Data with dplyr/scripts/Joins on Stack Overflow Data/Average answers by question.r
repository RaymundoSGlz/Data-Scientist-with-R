# Agrupa la tabla tagged_answers por tag_name.
# Resumen de tagged_answers para obtener
# el recuento de preguntas y el promedio de respuestas.
# Ordena la columna de preguntas resultante en orden descendente.

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
tagged_answers <- question_answer_counts %>%
    inner_join(question_tags, by = c("id" = "question_id")) %>%
    inner_join(tags, by = c("tag_id" = "id"))

tagged_answers %>%
  # Aggregate by tag_name
  group_by(tag_name) %>%
  # Summarize questions and average_answers
  summarize(questions = n(),
            average_answers = mean(n)) %>%
  # Sort the questions in descending order
    arrange(desc(questions))

# Agrupar por el nombre de etiqueta.
# Resumir para obtener la puntuación media de cada pregunta,
# como score y el número total de preguntas num_questions.
# Ordenar num_questions en orden descendente
# para clasificar las respuestas por las preguntas más frecuentes.

# Cargamos los datasets
library(dplyr)
library(readr)
library(tidyr)
questions <- read_rds("data/questions.rds")
question_tags <- read_rds("data/question_tags.rds")
tags <- read_rds("data/tags.rds")

questions_with_tags <- questions |>
        inner_join(question_tags, by = c("id" = "question_id")) |>
        inner_join(tags, by = c("tag_id" = "id"))

questions_with_tags %>%
    # Group by tag_name
    group_by(tag_name) %>%
    # Get mean score and num_questions
    summarize(
        score = mean(score, na.rm = TRUE),
        num_questions = n()
    ) %>%
    # Sort num_questions in descending order
    arrange(desc(num_questions))

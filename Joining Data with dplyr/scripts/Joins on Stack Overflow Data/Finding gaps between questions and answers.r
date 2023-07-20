# Usar un inner join para combinar las tablas de preguntas y respuestas
# usando los sufijos "_question" y "_answer", respectivamente.
# Restar creation_date_question de creation_date_answer
# dentro de la función as.integer() para crear la columna gap.

# Cargamos los datasets
library(dplyr)
library(readr)
questions <- read_rds("data/questions.rds")
answers <- read_rds("data/answers.rds")

questions %>%
    # Inner join questions and answers with proper suffixes
    inner_join(answers,
        by = c("id" = "question_id"),
        suffix = c("_question", "_answer")
    ) %>%
    # Subtract creation_date_question from creation_date_answer to create gap
    mutate(gap = as.integer(creation_date_answer - creation_date_question))

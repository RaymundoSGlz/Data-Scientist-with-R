# Contar y ordenar la columna question_id en la tabla answers
# para crear la tabla answer_counts.
# Combinar la tabla questions con la tabla answer_counts
# e incluir todas las observaciones de la tabla questions.
# Reemplazar los valores NA en la columna n con 0s.

# Cargamos los datasets
library(dplyr)
library(readr)
library(tidyr)
questions <- read_rds("data/questions.rds")
answers <- read_rds("data/answers.rds")

# Count and sort the question id column in the answers table
answer_counts <- answers %>%
    count(question_id, sort = TRUE)

# Combine the answer_counts and questions tables
questions %>%
    left_join(answer_counts, by = c("id" = "question_id")) %>%
    # Replace the NAs in the n column
    replace_na(list(n = 0))

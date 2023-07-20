# Combinar las tablas questions_with_tags y
# answers_with_tags en posts_with_tags.
# Agregar una columna de año a la tabla posts_with_tags,
# luego contar las publicaciones por tipo, año y tag_name.

# Cargamos los datasets
library(dplyr)
library(readr)
library(lubridate)
questions <- read_rds("data/questions.rds")
answers <- read_rds("data/answers.rds")
tags <- read_rds("data/tags.rds")
question_tags <- read_rds("data/question_tags.rds")

questions_with_tags <- questions %>%
  inner_join(question_tags, by = c("id" = "question_id")) %>%
  inner_join(tags, by = c("tag_id" = "id"))

answers_with_tags <- answers %>%
  inner_join(question_tags, by = "question_id") %>%
  inner_join(tags, by = c("tag_id" = "id"))

# Combine the two tables into posts_with_tags
posts_with_tags <- bind_rows(questions_with_tags %>% mutate(type = "question"),
                              answers_with_tags %>% mutate(type = "answer"))

# Add a year column, then count by type, year, and tag_name
posts_with_tags %>%
    mutate(year = year(creation_date)) %>%
    count(type, year, tag_name)
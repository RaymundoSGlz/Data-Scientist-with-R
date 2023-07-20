# Filtrar la tabla by_type_year_tag para las etiquetas dplyr y ggplot2.
# Crear un gráfico de líneas con esa tabla
# filtrada que traza la frecuencia (n) con el tiempo,
# coloreado por pregunta / respuesta y facetado por etiqueta.

# Cargamos los datasets
library(dplyr)
library(readr)
library(lubridate)
library(ggplot2)
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
posts_with_tags <- bind_rows(
    questions_with_tags %>% mutate(type = "question"),
    answers_with_tags %>% mutate(type = "answer")
)

# Add a year column, then count by type, year, and tag_name
posts_with_tags %>%
    mutate(year = year(creation_date)) %>%
    count(type, year, tag_name)

by_type_year_tag <- posts_with_tags %>%
    mutate(year = year(creation_date)) %>%
    count(type, year, tag_name)
# Filter for the dplyr and ggplot2 tag names
by_type_year_tag_filtered <- by_type_year_tag %>%
    filter(tag_name %in% c("dplyr", "ggplot2"))

# Create a line plot faceted by the tag name
ggplot(by_type_year_tag_filtered, aes(x = year, y = n, color = type)) +
    geom_line() +
    facet_wrap(~tag_name)

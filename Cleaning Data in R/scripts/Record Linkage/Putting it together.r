library(dplyr)
library(reclin2)

zagat <- readRDS("data/zagat.rds")
fodors <- readRDS("data/fodors.rds")

# Puntúa los pares de registros de manera probabilística.
# Create pairs
pair_blocking(zagat, fodors, "city") %>%
  # Compare pairs
  compare_pairs(c("name", "addr"), default_comparator = jaro_winkler()) %>%
  # Score pairs
  score_simple("weight", on = c("name", "addr"))

# Seleccione los pares que se consideran coincidencias.
# Create pairs
pair_blocking(zagat, fodors, "city") %>%
  # Compare pairs
  compare_pairs(c("name", "addr"), default_comparator = jaro_winkler()) %>%
  # Score pairs
  score_problink() %>%
  # Select pairs
  select_n_to_m()

# Vincula los dos dataframes.
# Create pairs
pair_blocking(zagat, fodors, blocking_var = "city") %>%
  # Compare pairs
  compare_pairs(c("name", "addr"), default_comparator = jaro_winkler()) %>%
  # Score pairs
  score_problink() %>%
  # Select pairs
  select_n_to_m() %>%
  # Link data
  link()
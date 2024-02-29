library(dplyr)
library(reclin2)

zagat <- readRDS("data/zagat.rds")
fodors <- readRDS("data/fodors.rds")

# Compare los pares por name usando la distancia lcs().
# Generate pairs
pair_blocking(zagat, fodors, "city") %>%
  # Compare pairs by name using lcs()
  compare_pairs("name", default_comparator = lcs())

# Compare los pares por name, phone y addr usando la distancia jaro_winkler().
# Generate pairs
pair_blocking(zagat, fodors, "city") %>%
  # Compare pairs by name, phone, addr
  compare_pairs(c("name", "phone", "addr"), default_comparator = jaro_winkler())
library(tibble)
library(dplyr)
library(ggplot2)
library(fst)
attrition_pop <- read_fst("data/attrition.fst")

# Add a row ID column to attrition_pop
attrition_pop_id <- attrition_pop %>%
  rowid_to_column()

# Using attrition_pop_id, plot YearsAtCompany vs. rowid
ggplot(attrition_pop_id, aes(x = rowid, y = YearsAtCompany)) +
  # Make it a scatter plot
  geom_point() +
  # Add a smooth trend line
  geom_smooth()

# Shuffle the rows of attrition_pop then add row IDs
attrition_shuffled <- attrition_pop %>%
  slice_sample(prop = 1) %>%
  rowid_to_column()

# Using attrition_shuffled, plot YearsAtCompany vs. rowid
# Add points and a smooth trend line
ggplot(attrition_shuffled, aes(rowid, YearsAtCompany)) +
  geom_point() +
  geom_smooth()

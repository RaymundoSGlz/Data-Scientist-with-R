# As in the previous exercise,
# loop over the nyc list in two different ways to print its elements:

# Loop directly over the nyc list (loop version 1).
# Define a looping index and do subsetting
# using double brackets (loop version 2).

# The nyc list is already specified
nyc <- list(pop = 8405837,
    boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"),
            capital = FALSE)

# Loop version 1
for (i in nyc) {
  print(i)
}

# Loop version 2
for (i in seq_along(nyc)) {
  print(nyc[[i]])
}

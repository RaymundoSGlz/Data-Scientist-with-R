# Write a for loop that iterates over all the elements of linkedin
# and prints out every element separately.
# Do this in two ways: using the loop version 1
# and the loop version 2 in the example code above.

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Loop version 1
for (i in linkedin) {
  print(i)
}

# Loop version 2
for (i in seq_along(linkedin)) { # seq_along() returns a vector
  print(linkedin[i])
}

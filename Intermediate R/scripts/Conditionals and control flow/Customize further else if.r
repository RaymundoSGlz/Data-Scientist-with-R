# Add code to both control structures such that:

# R prints out "Showing Facebook information"
# if medium is equal to "Facebook". Remember that R is case sensitive!
# "Your number of views is average" is printed if num_views
# is between 15 (inclusive) and 10 (exclusive).
# Feel free to change the variables medium and num_views
# to see how the control structure respond. In both cases,
# the existing code should be extended in the else if statement.
# No existing code should be modified.

# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == "Facebook") {
    print("Showing Facebook information")
} else {
  print("Unknown medium")
}

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else if (num_views <= 15 && num_views > 10) {
    print("Your number of views is average")
} else {
  print("Try to be more visible!")
}

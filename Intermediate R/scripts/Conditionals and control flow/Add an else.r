# Add an else statement to both control structures, such that

# "Unknown medium" gets printed out to the console when
# the if-condition on medium does not hold.
# R prints out "Try to be more visible!" when
# the if-condition on num_views is not met.

# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else {
  print("Unknown medium")
}



# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else {
   print("Try to be more visible!")
}

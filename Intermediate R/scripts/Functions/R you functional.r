# Finish the function definition for interpret(),
# that interprets the number of profile views on a single day:
# The function takes one argument, num_views.
# If num_views is greater than 15, the function prints out
# "You're popular!" to the console and returns num_views.
# Else, the function prints out "Try to be more visible!" and returns 0.
# Finally, call the interpret() function twice: on the first value
# of the linkedin vector and on the second element of the facebook vector.

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Define the interpret function
interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    return(num_views)
  } else {
    print("Try to be more visible!")
    return(0)
  }
}

# Call the interpret function twice
interpret(linkedin[1])
interpret(facebook[2])

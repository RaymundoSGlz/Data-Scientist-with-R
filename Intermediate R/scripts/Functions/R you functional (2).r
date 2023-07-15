# Finish the template for the interpret_all() function:

# Make return_sum an optional argument, that is TRUE by default.
# Inside the for loop, iterate over all views: on every iteration,
# add the result of interpret(v) to count. Remember that interpret(v)
# returns v for popular days, and 0 otherwise.
# At the same time, interpret(v) will also do some printouts.
# Finish the if construct:
# If return_sum is TRUE, return count.
# Else, return NULL.
# Call this newly defined function on both linkedin and facebook.

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# The interpret() can be used inside interpret_all()
interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    return(num_views)
  } else {
    print("Try to be more visible!")
    return(0)
  }
}

# Define the interpret_all() function
# views: vector with data to interpret
# return_sum: return total number of views on popular days?
interpret_all <- function(views, return_sum = TRUE) {
  count <- 0
  for (v in views) {
    count <- count + interpret(v)
  }

  if (return_sum) {
    return(count)
  } else {
    return(NULL)
  }
}

# Call the interpret_all() function on both linkedin and facebook
interpret_all(linkedin)
interpret_all(facebook)

# Create a function pow_two(): it takes one argument
# and returns that number squared (that number times itself).
# Call this newly defined function with 12 as input.

# Next, create a function sum_abs(), that takes two arguments
# and returns the sum of the absolute values of both arguments.
# Finally, call the function sum_abs() with arguments -2 and 3 afterwards.

# Create a function pow_two()
pow_two <- function(x) {
  x^2
}

# Use the function
pow_two(12)

# Create a function sum_abs()
sum_abs <- function(x, y) {
  abs(x) + abs(y)
}

# Use the function
sum_abs(-2, 3)

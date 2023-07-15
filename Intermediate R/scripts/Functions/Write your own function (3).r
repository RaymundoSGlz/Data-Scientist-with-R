# Add an optional argument, named print_info, that is TRUE by default.
# Wrap an if construct around the print() function:
# this function should only be executed if print_info is TRUE.
# Feel free to experiment with the pow_two() function you've just coded.

# Finish the pow_two() function
pow_two <- function(x, print_info = TRUE) {
    y <- x ^ 2
    if (print_info) {
        print(paste(x, "to the power two equals", y))
    }
    return(y)
}

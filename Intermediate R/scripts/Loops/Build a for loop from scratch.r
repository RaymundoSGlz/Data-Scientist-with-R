# Initialize the variable rcount, as 0.
# Finish the for loop:
# if char equals "r", increase the value of rcount by 1.
# if char equals "u", leave the for loop entirely with a break.
# Finally, print out the variable rcount to the console
# to see if your code is correct.

# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

# Initialize rcount
rcount <- 0

# Finish the for loop
for (char in chars) {
    if (char == "r") {
        rcount <- rcount + 1
    }
    if (char == "u") {
        break
    }
}

# Print out rcount
rcount

# Add code to the for loop that loops over the elements of the linkedin vector:

# If the vector element's value exceeds 10, print out "You're popular!".
# If the vector element's value does not exceed 10, print out "Be more visible!"

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Code the for loop with conditionals
for (li in linkedin) {
    if (li > 10) {
        print("You're popular!")
    } else {
       print("Be more visible!")
    }
    print(li)
}

# Extend the for loop with two new, separate if tests as follows:

# If the vector element's value exceeds 16, print out
# "This is ridiculous, I'm outta here!" and have R abandon the for loop (break).
# If the value is lower than 5, print out "This is too embarrassing!"
# and fast-forward to the next iteration (next).

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Adapt/extend the for loop
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  if (li > 16) {
    print("This is ridiculous, I'm outta here!")
    break
  }
    if (li < 5) {
        print("This is too embarrassing!")
        next
    }
  print(li)
}

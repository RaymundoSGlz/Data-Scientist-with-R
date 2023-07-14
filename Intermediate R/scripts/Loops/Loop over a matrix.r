# Finish the nested for loops to go over the elements in ttt:

# The outer loop should loop over the rows,
# with loop index i (use seq_len(nrow(ttt))).

# The inner loop should loop over the columns,
# with loop index j (use seq_len(ncol(ttt))).
# Inside the inner loop, make use of print() and paste()
# to print out information in the following format:
# "On row i and column j the board contains x",
# where x is the value on that position.

# The tic-tac-toe matrix ttt has already been defined for you
ttt <- matrix(c("O", NA, "X",
                NA, "O", "O",
                "X", NA, "X"),
        nrow = 3,
        byrow = TRUE)

# define the double for loop
for (i in seq_len(nrow(ttt))) {
    for (j in seq_len(ncol(ttt))) {
        print(paste("On row", i, "and column", j,
        "the board contains", ttt[i, j]))
    }
}

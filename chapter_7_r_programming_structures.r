# Chapter 7: R Programming Structures
# R is similar to ALGOL-descendant programming languages (e.g. C, C++, Python, Perl, etc.)
# R is block structured - braces and line breaks are distinguishing features
# R also features some unique programming features, such as variable scoping

# 7.1 Control Statements
# R shares similar elements of ALGOL-descendant family languages
# If-else statements and loops are two common features

# 7.1.1 Loops
# Loops have the typical form
# for (index in vector) {
    # A code block to be executed iteratively
# }
# The index takes on each component of the vector x
# Consider the following example
x <- c(5, 12, 13)
for (i in x) {
    print(i^2)
}
# The statement break allows for the program to preemptively leave the loop
i <- 3
# Increment i from 3 to 4, and so on to 13
while (i <= 10) i <- i + 4 # Note the lack of braces
print(i)
i <- 1
while (TRUE) { # similar to the loop above
    i <- i + 4 # 5, 9, 13
    if i > 10 break # Exit the loop
}
print(i)
i <- i
repeat {
    i <- i + 4
    if (i < 10) break
}
print(i)
# Note repeat has no Boolean condition unlike the while loop
# The next statement can skip the rest of the iteration of a loop
sim <- function(nreps) {
    commdata <- list()
    commdata$countabsamecomm <- 0
    for (rep in 1:nreps) {
        commdata$whosleft <- 1:20
        commdata$numabchosen <- 0
        commdata <- choosecomm(commdata, 5)
        # check and skip the loop if a condition is met
        if (commdata$$numabchosen > 0) next # check if the number is positive
        commdata <- choosecomm(commdata, 4)
        if (commdata$$numabchosen > 0) next # check again
        commdata <- choosecomm(commdata, 3)
    }
    print(commdata$countabsamecomm / nreps)
}
# An alternative to using next statements is nested if statements
# The nested structure is difficult to read with larger cases
sim <- function(nreps) {
    commdata <- list()
    commdata$countabsamecomm <- 0
    for (rep in 1:nreps) {
        commdata$whosleft <- 1:20
        commdata$numabchosen <- 0
        commdata <- choosecomm(commdata, 5)
        # check and skip the loop if a condition is met
        if (commdata$$numabchosen == 0) {
            commdata <- choosecomm(commdata, 4)
            if (commdata$$numabchosen == 0) {
                commdata <- choosecomm(commdata, 3)
            }
        }
    }
    print(commdata$countabsamecomm / nreps)
}

# Any vector works with the for loop
# The iterative structure of the object is the important feature, not the mode
# for (fn in c("file 1", "file2")) {
#     print(scan(fn))
# }

# 7.1.2 Looping Over Nonvector Sets
# There are workarounds for looping over nonvector sets
# lapply() and get() functions can be used instead
u <- matrix(c(1, 2, 3, 1, 2, 4), nrow = 3)
v <- matrix(c(8, 12, 20, 15, 10, 2), nrow = 3)
for(m in c("u", "v")) {
    # Assign z to the proper matrix
    z <- get(m)
    print(z)
    print(lm(z[, 2] ~  z[, 1]))
}

# 7.1.3 if-else

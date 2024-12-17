# Started moving stuff here from other sessions

# Data classes ---------------------------------------------------------------------------------------------------------

# ...

# Vectors --------------------------------------------------------------------------------------------------------------

# In R, a vector is a list of objects of the same type, in a specific order.

# For example:
# - 5 2 4 is a vector (of numbers)
# - "cirrhosis" "fibrosis" "hepatitis" is a vector (of characters).

# Of note, every column in a `data.frame` is a vector!
    
# You create a vector using function `c()`, which stands for "combine":
c(5, 2, 4)
c("cirrhosis", "fibrosis", "hepatitis")

# Vectors can be used:
# -   When the argument of a function needs to contain more than one element
# -   When we want to apply a function to more than one object.

# A function that will summarise all elements of a vector
mean(c(6, 7, 8))

# A function that will apply to each element separately
log(c(100, 10))

# Why do you think the output of the function above is different to that of the function below?
log(100, 10)

# Objects in a vector can have names:
c("age" = 19, "height" = 185, "systolic_BP" = 132)

# Lists ----------------------------------------------------------------------------------------------------------------


# Data frames ----------------------------------------------------------------------------------------------------------

# ...

# Factors --------------------------------------------------------------------------------------------------------------

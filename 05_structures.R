
# DRAFT
# title: "04: Summarising data"
# subtitle: "Introduction to R for health data"
# author: Andrea Mazzella [(GitHub)](https://github.com/andreamazzella)

# Recap from topic 04_summarise  ---------------------------------------------------------------------------------------

# 1.  Import `amr_klebsiella.csv`, contained in the `/data/raw` folder.
# 2.  Cross-tabulate age group against antimicrobial susceptibility.

# Data classes ---------------------------------------------------------------------------------------------------------

# TODO: can move stuff here from intro6 clean.

# Factors --------------------------------------------------------------------------------------------------------------

# TODO: can move stuff here from intro6 clean.


# Vectors --------------------------------------------------------------------------------------------------------------

# In R, a vector is a list of objects of the same type, in a specific order.

# For example:
# - TRUE TRUE FALSE is a logical vector
# - 5 2 4 is a vector (of numbers)
# - "cirrhosis" "fibrosis" "hepatitis" is a vector (of characters).

# Of note, every column in a `data.frame` is a vector!
    
# You create a vector using function `c()`, which stands for "combine":
c(TRUE, TRUE, FALSE)
c(5, 2, 4)
c("cirrhosis", "fibrosis", "hepatitis")

# For regular sequences of numeric values, you can use `seq()`. This can be useful when setting regular x-axis breaks in time series charts.
seq(from = 2010, to = 2020, by = 2)

# If you want to increase by 1, you can use the colon as shorthand:
2010:2015

# Vectors can be used:
# -   To apply a calculation or a function to more items at once
c(0.0031, 0.0149, 0.0075) * 1000
round(c(7.41, 5.27, 2.01), 1)
# -   When a single argument of a function can contain more than one element
mean(c(6, 7, 11))

# Why do you think the output of the two lines of code below is different?
log(c(100, 5))
log(100, 5)

# Objects in a vector can have names:
c(
  "age" = 19,
  "height" = 185,
  "systolic_BP" = 132
  )


# Lists ----------------------------------------------------------------------------------------------------------------

# An R list is also a list of object in a specific order, but unlike a vector, these don't have to be of the same type.

list(
    5,
    c(TRUE, FALSE, FALSE),
    "cirrhosis"
    )

# Like vectors, elements of a list can be named:

list_study_info <- list(
    study_id = "478774",
    nhs_trusts = c("RH5", "RA4", "RBZ"),
    final = TRUE
)

# You can access a named element of a list with the "exposition operator", `$`:
list_study_info$study_id
list_study_info$nhs_trusts

# Data frames ----------------------------------------------------------------------------------------------------------

# You've already used `data.frame`s.
# They are implemented as a named list of vectors of the same length: each column has a name and contains a vector of values.
dat <- data.frame(
    id = 1001:1004,
    initials = c("NG", "PT", "DG", "OG"),
    age = c(36, 24, 4, 1),
    sex = c("M", "F", "F", "M")
    )

# As data.frames are lists, you can access a column by using `$`:
dat$id
dat$initials

# This is why you can use 
mean(dat$age)
table(dat$sex)

# `tibble`s are a special type of `data.frame` used in the tidyverse.



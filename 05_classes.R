# title: "05: data classes"
# subtitle: "Introduction to R for health data"
# authors: Andrea Mazzella (https://github.com/andreamazzella) and Simon Thelwall (https://github.com/simonthelwall)

# Content  -------------------------------------------------------------------------------------------------------------
# - Data classes
#   - Logical
#   - Numeric
#   - Character
#   - Factor
#   - Date
# - Comparing values
# - Vectors
# - Lists
# - Data frames

library(tidyverse)

# Recap from topic 04_summarise  ---------------------------------------------------------------------------------------

# 1.  Import `amr_klebsiella.csv`, contained in the `/data/raw` folder.
# 2.  Cross-tabulate age group against antimicrobial susceptibility.



# Data classes ---------------------------------------------------------------------------------------------------------

# R represents different variable types (continuous, categorical etc.) internally using "classes".

# You can check what class something is by using class():
class(0.78)
class(FALSE)
class("Maria")

# R data classes that are relevant to health data analysis are:
# - logical,
# - numeric (including integer and double),
# - Date,
# - character,
# - factor
# - lists
# - data.frame (and tibble)

## Logical ----------------------------------------------------------------------------------

# The logical class has three possible values - note they're upper-case and NOT in quotes.
TRUE
FALSE
NA

# Note that FALSE is equivalent to 0 and TRUE is equivalent to 1:
FALSE == 0
TRUE == 1

# They are created when running comparisons with > < >= <= == (NB: two = symbols) !=
# as well as functions like is.na() and dplyr::near().
4 > 7
4 == 5 - 1
"Maria" == NA
is.na("Maria")
near(1/49*49, 1)

## Numeric ----------------------------------------------------------------------------------

# The numeric class includes two types: integers and "doubles" (that is, real numbers).
typeof(2.7)

# Adding an L after an integer forces R to treat it as an integer
typeof(2)
typeof(2L)

# NB: R can't store very large integers in the integer class 
typeof(10000000000L)

# You can use arithmetic operators and numeric functions
7^3
round(4.7)

# Note that R uses "round half to even", which keeps the rounding unbiased.
round(0.5)
round(1.5)

# If you want the less precise rounding used in Stata, you can use janitor::round_half_up()
janitor::round_half_up(0.5)

## Character --------------------------------------------------------------------------------

# Character strings contain text.

# They are created using either double quotes (`"`) or single quotes (`'`).
"Maria"
'Maria'

# The tidyverse style guide recommends using double quotes.

# If you need to have quotes within quotes, you can use the other one.
'A string with an internal "quote" can be created like so.'

# You can use \n to create a new line.
text <- "one\ntwo"

# `stringr` is a package part of the core `tidyverse` and it helps dealing with factors. Its function start with `str_`
str_view(text)

# You can combine more strings with `paste0()` or `stringr::str_c()`
paste0("Maria ", "Ramírez ", "Rioja")
str_c("Maria ", "Ramírez ", "Rioja")

# `stringr::str_c()` has the advantage of returning NA if one or more element is NA:
paste0("Josep ", NA, "Dalí")
str_c("Josep ", NA, "Dalí")

# You can subset a character string by using `gsub()` or stringr::str_sub()`:
str_sub("ID3487", 3, 6)

## Exercise 1  ---------------------------------------------------------------
# 1. Create a new object called "mic" and give it a value of 3.2.
# 2. Use class() to ensure that this new object has a numeric class.



# Vectors --------------------------------------------------------------------------------------------------------------

# An R vector is a list of objects of the same type, in a specific order.

# For example:
# - TRUE TRUE FALSE is a logical vector
# - 5 2 4 is a numeric vector
# - "cirrhosis" "fibrosis" "hepatitis" is a character vector
    
# You create a vector using function `c()`, which stands for "combine":
c(TRUE, TRUE, FALSE)
c(5, 2, 4)
c("cirrhosis", "fibrosis", "hepatitis")

# To create a vector with a regular sequence of numeric values, you can use `seq()`.
# This can be useful when setting regular x-axis breaks in time series charts.
seq(from = 2010, to = 2020, by = 2)

# If you want to increase by 1, you can use the colon symbol as shorthand:
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
  age = 19,
  height = 185,
  systolic_BP = 132
  )

# Of note, every column in a `data.frame` is a vector - see section "Data frames" below for more information.

## Exercise 2  ---------------------------------------------------------------
# 1.  Create a vector object that is 5 elements long and contains the values 81, 22, 83, 65 and 50
# 2.  Find a way to test whether the object is a vector as intended (hint, base R has a number of functions to check the class of an object, e.g. `is.na()`)



# More data classes ----------------------------------------------------------------------------------------------------

## Factors ----------------------------------------------------------------------------------

# Factors are used to represent categorical variables: a variable in which each value can only be one of a series.

# `forcats` is a package part of the core `tidyverse` and it helps dealing with factors.

# A vector of character strings doesn't sort in a useful way:
sample_months <- c("March", "January", "August")
sort(sample_months)

# We can create a factor with a specific order with `forcats::fct()` or `factor()`:
sample_months_factor <-
  fct(
    sample_months,
    c("January", "February", "March", "April", "May", "June", "July",
      "August", "September", "October", "November", "December")
    )

# If we sort the vector, it will now sort correctly.
sort(sample_months_factor)

# In the background, factors have "levels" indicated by integers (1, 2, 3...) and corresponding "labels" which contain text.
as.numeric(sample_months_factor)

# You can use modify the order of levels in a factor with `forcats::fct_relevel()` to reorder bars or legend items in a ggplot.

## Exercise 3  ---------------------------------------------------------------
# 1. Create a factor object that contains the elements "E. coli", "K. pneumoniae", "MRSA", "MSSA" and "P. aeruginosa"
# 2. Re-order this factor so that MRSA and MSSA come at each end and the remaining species are in alphabetical order.

## Dates ------------------------------------------------------------------------------------

# Dates and times are not as straightforward as we might initially think; think about
# leap years, time zones, daylight saving times, how Americans write dates, etc.
# In R, dates are:
# -   conceptualised as number of days passed since the 1st of January 1970.
# -   shown in YYYY-MM-DD format, e.g., 1970-01-01.

# Package `lubridate` (part of the core `tidyverse`) helps working with dates.

# For example, you can create today's date with lubridate::today():
today()

# You can also convert a string into a date using `lubridate`'s helper functions:
ymd("2025-01-02")
dmy("01/04/2018")
dmy("13th of December 1975")

# You can extract components using `lubridate::year()`, `lubridate::month()`, `lubridate::day()` and other:
year(today())
month(ymd("2025-01-02"))
day(dmy("01/04/2018"))

# Time spans are implemented as durations, periods and intervals.

## Exercise 4  ---------------------------------------------------------------
# Create a vector of these dates: 07/10/2018, 9 Jan 2025, 31-12-1990 and 1st of April 2020.

## Year-months ------------------------------------------------------------------------------

# If you commonly need to use monthly values, you can use the `zoo::yearmon` class.
library(zoo)
sample_date <- ymd("2025-05-01")
sample_yearmon <- as.yearmon(sample_date)
sample_yearmon
as.numeric(sample_yearmon)

## Year-quarters ----------------------------------------------------------------------------
sample_yearqtr <- as.yearqtr(sample_date)
sample_yearqtr
as.numeric(sample_yearqtr)

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
# They are implemented as named lists of vectors of the same length: each column has a name and contains a vector of values.
dat <- data.frame(
  id = 1001:1004,
  initials = c("NG", "PT", "DG", "OG"),
  age = c(36, 24, 4, 1),
  sex = c("M", "F", "F", "M")
  )

# You can isolate a column as a vector in three ways:
# - with `dplyr::pull()` - tidyverse friendly.
# - with the exposition operator (`$`)
# - with the `[[` operator
dat |> pull(id)
dat$initials
dat[["age"]]

# You can use these for quick summaries:
summary(dat$age)
dat |>
  pull(age) |>
  summary()

# `tibble`s are a special type of `data.frame` used in the tidyverse.

# You can create a tibble in an easy to read layout using `tibble::tribble()`:
tribble(~id, ~initials,
        1001, "NG",
        1002, "PT")

# You can check the classes of all variables in a dataset with `glimpse()`, from `dplyr`:
glimpse(dat)

## Exercise 5  ---------------------------------------------------------------
# Isolate column "initials" from data frame "dat".



# Learning more ------------------------------------------------------------------------------------------------------------

# https://r4ds.hadley.nz/logicals
# https://r4ds.hadley.nz/numbers
# https://r4ds.hadley.nz/strings
# https://r4ds.hadley.nz/factors
# https://r4ds.hadley.nz/datetimes
# https://r4ds.hadley.nz/base-r

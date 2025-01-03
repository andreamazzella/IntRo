# IntRo: An introduction to R for health data

Markdown notebooks illustrating the basics of R, RStudio and the tidyverse for medical research, epidemiology & related fields. The datasets used are either simulated or in the public domain.

*Where to start*: after installing R and RStudio, download these files (Click the green "Code" button, "Download ZIP"), unzip, open `IntRo.Rproj` and `01_basics.qmd`. If you're familiar with Git, you can simply clone the repo.

NB - I'm currently restructuring this.

- **01:The basics** (RStudio interface; using R scripts and Quarto documents; assigning values (`<-`); using functions and packages; exploring data frames)
- **02. Visualising** (Making bar charts, line charts, Box plots and scatterplots with `ggplot2`)
- **03. Importing data** (importing and exporting data from/to file and from/to database)
- **04. Data summaries** (Summarising continuous and categorical data with `dplyr` and `janitor`; the pipe `|>`; table 1 with `gtsummary`)
- **05. Data classes** (How R represents different variable types, including numerical, categorical, dates; vectors; lists; data.frames)
- **06. Data subsets** (Sorting and filtering rows and selecting columns with `dplyr`)
- **07. Data transformation** (Calculate new variables, categorise continuous variables, regroup a categorical variable)
- **08. Data cleaning** (Deleting and renaming variables; parsing data classes; labelling and recoding values)
- **09. Data reshaping** (Joining datasets with `dplyr`; wide and long formats; reshaping wide to long and vice versa with `tidyr`)
- **10. SQL** (to be created)
- **11. Git** (to be created)
- **12. Quarto** (Rendering Quarto documents, inline code, markdown hyperlinks, mhunk options, YAML headers and global options)
- **13. Workflows** (How to structure analytical projects and data)

Author: [Andrea Mazzella](https://github.com/andreamazzella)

This course draws frequently from Hadley Wickham's [R for Data Science (2e)](https://r4ds.hadley.nz) material.

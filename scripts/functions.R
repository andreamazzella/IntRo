# Function used in 12_quarto.qmd

#' Get and format a percentage of resistant isolates from the `bsi_resistance` data frame.
#'
#' @param org A string indicating the bacterium; one of `c("E. coli", "K. pneumoniae", "P. aeruginosa", "Acinetobacter spp.")`
#' @param antib A string indicating the antibiotic; one of `c("ciprofloxacin", "gentamicin", "3gen cephalosporins", "carbapenems", "piperacillin/tazobactam", "co-amoxiclav", "amikacin")`
#' @param yr An integer indicating a year; one of `2018:2022`
#'
#' @return A string indicating the percentage of that organism isolates that are resistant to that antibiotic in that year.
get_perc_r <- function(org, antib, yr) {
  bsi_resistance |>
    filter(
      organism == org,
      antibiotic == antib,
      year == yr,
      result == "R") |>
    pull(proportion) |>
    scales::label_percent()()
}


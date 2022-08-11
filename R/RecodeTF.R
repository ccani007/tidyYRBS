
#' RecodeTF
#'
#' @param x The name of the vector you want to recode 
#'
#' @return The vector will replace the numbers to a logical atomic vector
#' @importFrom dplyr case_when
#' 
#' @export 
#'
#' @examples 
#' 
RecodeTF <- function(x) {
  x = case_when(
    x == "1" ~ TRUE,
    x == "2" ~ FALSE,
    TRUE ~ NA
  )
}


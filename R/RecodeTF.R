
#' RecodeTF
#'
#' @param x The name of the vector you want to recode 
#'
#' @return The vector will replace the numbers to a logical atomic vector
#' @export 
#'
#' @examples  [not run] mutate(across(c(q19, q57, q26), RecodeTF ))
#' 
RecodeTF <- function(x) {
  x = case_when(
    x == "1" ~ TRUE,
    x == "2" ~ FALSE,
    TRUE ~ NA
  )
}


#' Converting a scale with three options, to a logical TRUE-FALSE variable.
#' This scale has the oprions yes, no and not sure. Therefore no and not sure 
#' will be FALSE and yes will be assigned TRUE. 
#' 
#' @param x The name of the vector to recode
#'
#' @return The values on the scale will change from factors to integers 
#' 
#' @export
#' 
#' @importFrom dplyr case_when
#' 
#' @examples


ScaleNotSure <- function(x) {
  x = case_when(
    x == 1 ~ TRUE,
    x == 2 ~ FALSE,
    x == 3 ~ FALSE,
    TRUE ~ NA
  )
}

#' Converting a scale from 0 to 12 into  numeric values choosing the worst
#' case scenario. This means, option "2 or 3 days" will be translated as 
#' 3 days. 
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


ScaleToNumber12 <- function(x) {
  x = case_when(
    x == 1 ~ 0L,
    x == 2 ~ 0L,
    x == 3 ~ 3L,
    x == 4 ~ 5L,
    x == 5 ~ 7L,
    x == 6 ~ 9L,
    x == 7 ~ 11L,
    x == 8 ~ 12L,
    TRUE ~ NA_integer_
  )
}

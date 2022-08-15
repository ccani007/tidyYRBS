#' Converting a scale from 0 to 40 into  numeric values choosing the worst
#' case scenario. This means, option "20 to 39 times" will be translated as 
#' 39 times. 
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


ScaleToNumber40 <- function(x) {
  x = case_when(
    x == 1 ~ 0L,
    x == 2 ~ 2L,
    x == 3 ~ 9L,
    x == 4 ~ 19L,
    x == 5 ~ 39L,
    x == 6 ~ 40L,
    TRUE ~ NA_integer_
  )
}

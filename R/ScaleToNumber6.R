#' Converting a scale from 0 to 6 into  numeric values choosing the worst
#' case scenario. This means, option "2 to 3 times" will be tranlated as 
#' 3 times. 
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



ScaleToNumber6 <- function(x) {
    x = case_when(
      x == 1 ~ 0L,
      x == 2 ~ 1L,
      x == 3 ~ 3L,
      x == 4 ~ 5L,
      x == 5 ~ 6L,
      TRUE ~ NA_integer_
    )
}

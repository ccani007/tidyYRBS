#' Converting a scale from 0 to 30 into  numeric values choosing the worst
#' case scenario. This means, option "6 to 9 days" will be translated as 
#' 9 days. 
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


ScaleToNumber30 <- function(x) {
  x = case_when(
    x == 1 ~ 0L,
    x == 2 ~ 0L,
    x == 3 ~ 2L,
    x == 4 ~ 9L,
    x == 5 ~ 19L,
    x == 6 ~ 29L,
    x == 7 ~ 30L,
    TRUE ~ NA_integer_
  )
}

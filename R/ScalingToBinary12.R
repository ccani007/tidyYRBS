#' Converting a scale from 0 to 12 into a binary variable
#'
#' @param x The name of the vector to recode
#'
#' @return The values on the scale will change into a binary value of TRUE and FALSE
#' @export
#' @importFrom dplyr case_when
#' @examples
ScalingToBinary12 <- function(x) {
  x = case_when(
    x == 1 ~ FALSE,
    x %in% 2:8 ~ TRUE,
    TRUE ~ NA
  )
}

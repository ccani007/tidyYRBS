#' Converting a scale from 0 to 30 into a binary variable
#'
#' @param x the vector you want to recode
#'
#' @return The scale will change to a logical vector according to the scale.
#' @export
#'
#' @examples
ScalingToBinary30 <- function(x) {
  x = case_when(
    x == 1 ~ FALSE,
    x %in% 2:7 ~ TRUE,
    TRUE ~ NA
  )
}
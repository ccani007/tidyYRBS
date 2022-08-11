#' ScalingToBinary40
#'
#' @param x The name of the vector you wan to recode
#'
#' @return Te vector will change to a logical atomic vector according to the values on the scale
#' @export
#'
#' @examples
ScalingToBinary40 <- function(x) {
  x = case_when(
    x == 1 ~ FALSE,
    x %in% 2:6 ~ TRUE,
    TRUE ~ NA
  )
  
} 
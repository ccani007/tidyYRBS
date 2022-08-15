#' Converting a scale that measures consumption of food from 1 to 4 
#' times a day. 
#' In the options they combine 7 days and "per day", therefore the 
#' options including 7 days are averaged. Meaning, 1 to 3 times during the past
#' 7 days is considered as 0.4, given that is 3 divided by 7.  
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


ScaleDays <- function(x) {
  x = case_when(
    x == 1 ~ 0,
    x == 2 ~ 0.4,
    x == 3 ~ 0.8,
    x == 4 ~ 1,
    x == 5 ~ 2,
    x == 6 ~ 3,
    x == 7 ~ 4,
    TRUE ~ NA_real_
  )
}

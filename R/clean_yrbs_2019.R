#' Youth Risk Behavior Surveillance System 2019
#' 
#' @title clean_yrbs_2019
#'
#' @docType data
#' 
#' @usage data(clean_yrbs_2019)
#' 
#' @description This is the imported and cleaned 2019 YRBS Data. 
#'     This data set monitors priority health risk behaviors that contribute 
#'     markedly to the leading causes of death, disability, and social problems
#'     among youth and adults in the United States. 
#'     These behaviors, often include:
#'     
#' \itemize{
#' \item{Behaviors that contribute to unintentional injuries and violence}
#' \item{Sexual behaviors that contribute to unintended pregnancy and
#'   sexually transmitted diseases, including HIV infection}
#' \item{Alcohol and other drug use}
#' \item{Tobacco use}
#' \item{Unhealthy dietary behaviors}
#' \item{Inadequate physical activity}
#' }
#'
#'@format A tibble with 13,677 and 89 variables
#'\describe{
#'  This data set only includes the questions from the Appendix A of the 
#'  YRBS 2019 without including the QN dichotomous variables. The questions 
#'  included were wrangled to be logical if they are dichotomous and contain 
#'  real or numeric variables when asked by quantity.
#'  please consult the documentation in the 2019 National YRBS 
#'  Data Users Guide for details. 
#'  }
#'
#' 
"clean_yrbs_2019"
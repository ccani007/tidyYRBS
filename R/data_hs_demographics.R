#' This data set contains variables related to demographics
#'
#' @title hs_demographics
#'
#' @description Includes variables related to demographics from the YRBSS. The 
#' measurements include the subject’s state, district, year, weight, stratum,
#' analysis primary sampling unit, grade, sex, race, and sex orientation. This 
#' is a subset of the Combined YRBS High School Data Set. 
#' 
#' @docType data
#' 
#' @usage data(hs_demographics)
#' 
#' @author Centers for Disease Control and Prevention, Youth Risk Behavior 
#' Survey Data
#' 
#' @format A tibble with 504,249 and 11 variables
#' \describe{
#'    \item{record}{a character variable for the ID number of the subject}
#'    \item{state}{a character variable that denotes the acronym for the state 
#'    the subject’s school is in}
#'    \item{district}{a character variable that denotes the district in which
#'     the subject’s school is located}
#'     \item{year}{4-digit integer that denotes the year of survey}
#'     \item{weight}{a number that denotes the subject’s weight}
#'     \item{stratum}{an integer that denotes the subject’s stratum}
#'     \item{PSU}{integer that denotes the subject’s school grade}
#'     \item{grade}{integer that denotes the subject’s school grade}
#'     \item{sex}{character variable that denotes the subject’s sex}
#'     \item{race}{character variable that denotes the subject’s sex}
#'     \item{SexOrientation}{a character variable that denotes the acronym of 
#'     the subject’s sex orientation}
#'  }
#'  
#'  @source <cdc.gov/healthyyouth/data/yrbs/pdf/2019/2019_YRBS_SADC_Dcumentation.pdf>
"hs_demographics"





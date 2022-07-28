#' This data set contains variables related to Suicide Behavior
#'
#' @name hs_suicide
#' @docType data
#' @author CDC
#' @references \url{data_blah.com}
#' @keywords data
NULL

#' @describe Includes variables related to suicide behaviors from the YRBSS.
#' the measurements include if the subject felt sad or hopeless, seriously 
#' considered attempting suicide, made a plan about how they would attempt 
#' suicide, attempted suicide, and had a suicide attempt that resulted in an 
#' injury, poisoning, or overdose that had to be treated by a doctor or nurse. 
#' This is a subset of the Combined YRBS High School Data Set
#' @format A tibble with 504,249 rows and 6 variables
#' \describe{
#' 
#' \item {is_hopeless} {a Boolean where TRUE is when a student answers yes to 
#' feeling sad or hopeless (almost every day for 2 or more weeks in a row so 
#' that they stopped doing some usual activities, ever during the 12 months 
#' before the survey)}
#' \item {suicide_considered} {a Boolean where TRUE when a student answers yes
#' to having seriously considered attempting suicide (ever during the 12 months 
#' before the survey)}
#' \item{suicide_planned} {a Boolean where TRUE is when a student answers 
#' yes to having made a plan about how they would attempt suicide (during the 
#' 12 months before the survey)}
#' \item {suicide_attempts} {a Boolean where TRUE is when a student answers yes
#' to having attempted suicide (one or more times during the 12 months before 
#' the survey)
#' \item{suicide_injury} {a Boolean where TRUE is when a student answers yes to
#' having a suicide attempt that resulted in an injury, poisoning, or overdose
#' that had to be treated by a doctor or nurse (during the 12 months before the
#' survey)}
#' @source Centers for Disease Control and Prevention. [2019] Youth Risk 
#' Behavior Survey Data. Available at: 
#' cdc.gov/healthyyouth/data/yrbs/pdf/2019/2019_YRBS_SADC_Dcumentation.pdf
#' 


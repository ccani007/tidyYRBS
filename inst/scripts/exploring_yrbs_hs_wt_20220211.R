# Exploring the Weighted YRBS
# Gabriel Odom and Catalina Cañizares
# 02/14/2022
# Updates 03/15/2022



######  Setup  ################################################################

library(tidyverse)
library(tidyYRBS)

data("hs_district")


###  Account for Weights with survey::  ###
# This code tells R the design elements in the survey (PSU, Weights, Strata). It
#   should be used for analysis because ignoring the PSUs will tend to yield
#   standard errors that are too small, leading to false positives when doing
#   significance tests. See:
# https://stats.oarc.ucla.edu/r/seminars/survey-data-analysis-with-r/

library(survey)

# ?svydesign

hs_weighted_ls <- svydesign(
	id = ~PSU,
	weights = ~weight,
	strata = ~stratum ,
	nest = TRUE,
	survey.lonely.psu = "adjust",
	data = hs_district
)


###  Account for Weights with srvyr::  ###
# See:
# https://cran.r-project.org/web/packages/srvyr/vignettes/srvyr-vs-survey.html

install.packages("srvyr")
library(srvyr)



######  Explore the Weighted Data  ############################################
# This function will give me the number of PSUs per strata

summary(hs_weighted_ls)

# Now, checking descriptive statistics

svytable(~sex, design = hs_weighted_ls)
svytable(~age, design = hs_weighted_ls)
svytable(~year, design = hs_weighted_ls)
svytable(~q26, design = hs_weighted_ls)
svytable(~year + q26, design = hs_weighted_ls)
svytable(~sitename + q26, design = hs_weighted_ls)




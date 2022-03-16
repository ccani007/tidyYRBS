# Exploring the Weighted YRBS
# Gabriel Odom and Catalina Cañizares
# 02/14/2022
# Updates 03/15/2022



######  Setup  ################################################################

library(tidyverse)
library(tidyYRBS)

data("hs_suicide")


###  Account for Weights with survey::  ###
# This code tells R the design elements in the survey (PSU, Weights, Strata). It
#   should be used for analysis because ignoring the PSUs will tend to yield
#   standard errors that are too small, leading to false positives when doing
#   significance tests. See:
# https://stats.oarc.ucla.edu/r/seminars/survey-data-analysis-with-r/

library(survey)

# ?svydesign

hs_weighted_ls <- survey::svydesign(
	id = ~PSU,
	weights = ~weight,
	strata = ~stratum ,
	nest = TRUE,
	survey.lonely.psu = "adjust",
	data = hs_suicide
)



######  Explore the Weighted Data  ############################################
# This function will give me the number of PSUs per strata

summary(hs_weighted_ls)

# Now, checking descriptive statistics

survey::svytable(~Sex, design = hs_weighted_ls)
survey::svytable(~Grade, design = hs_weighted_ls)
survey::svytable(~year, design = hs_weighted_ls)
survey::svytable(~suicide_considered, design = hs_weighted_ls)
survey::svytable(~year + suicide_considered, design = hs_weighted_ls)
survey::svytable(~district + suicide_considered, design = hs_weighted_ls)




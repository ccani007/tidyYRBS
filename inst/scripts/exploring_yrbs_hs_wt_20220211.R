# Exploring the Weighted YRBS
# Gabriel Odom and Catalina Cañizares
# 02/14/2022
# Updates 03/15/2022



######  Setup  ################################################################

library(survey)
library(janitor)
library(table1)
library(tidyverse)

hs_district_df <- readRDS("data/hs_district.rds")


###  Account for Weights  ###
# This code tells R the design elements in the survey (PSU, Weights, Strata). It
#   should be used for analysis because ignoring the PSUs will tend to yield
#   standard errors that are too small, leading to false positives when doing
#   significance tests. See:
# https://stats.oarc.ucla.edu/r/seminars/survey-data-analysis-with-r/

hs_weighted_df <- svydesign(
	id = ~PSU,
	weights = ~weight,
	strata = ~stratum ,
	nest = TRUE,
	survey.lonely.psu = "adjust",
	data = hs_district_df
)


# This function will give me the number of PSUs per strata

summary(hs_weighted_df)

# Now, checking descriptive statistics 

svytable(~sex, design = hs_weighted_df)
svytable(~age, design = hs_weighted_df)
svytable(~year, design = hs_weighted_df)
svytable(~q26, design = hs_weighted_df)
svytable(~year + q26, design = hs_weighted_df)
svytable(~sitename + q26, design = hs_weighted_df)




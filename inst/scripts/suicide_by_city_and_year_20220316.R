# Attempt srvyr:: Package on Suicidality Data
# Gabriel Odom and Catalina Cañizares
# 03/16/2022



######  Setup  ################################################################

library(tidyYRBS)
library(survey)
# install.packages("srvyr")
library(srvyr)
library(tidyverse)

data("hs_suicide")


###  Account for Weights with srvyr::  ###
# See: http://gdfe.co/srvyr/ AND
# https://cran.r-project.org/web/packages/srvyr/vignettes/srvyr-vs-survey.html
hs_suicidality_srv <-
	hs_suicide %>%
	srvyr::as_survey_design(
		ids     = PSU,
		weights = weight,
		strata  = stratum,
		nest    = TRUE
	)


######  Attempt Weighted Summaries  ###########################################

###  Sex  ###
hs_suicidality_srv %>%
	group_by(Sex) %>%
	summarise(N = survey_total())
# Total people: 7159104 (F) + 7141727 (M) + 94315 (NA) = 14395146 total


###  Suicide Ideation by City x Year  ###
hs_suicidality_srv %>%
	group_by(district, year) %>%
	select(district, year, starts_with("suicide")) %>%
	summarise(
		propConsidered = survey_mean(x = suicide_considered, na.rm = TRUE),
		propPlanned    = survey_mean(suicide_planned, na.rm = TRUE),
		aveAttempts    = survey_mean(suicide_attempts, na.rm = TRUE),
		propInjured    = survey_mean(suicide_injury, na.rm = TRUE),
		.groups = "keep"
	) %>%
	select(-contains("_se"))

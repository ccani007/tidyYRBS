# Attempt srvyr:: Package on Suicidality Data
# Gabriel Odom and Catalina Cañizares
# 03/16/2022



######  Setup  ################################################################

library(tidyYRBS)
library(survey)
# install.packages("srvyr")
library(srvyr)
library(tidyverse)

data("hs_demographics")
data("hs_suicide")

hsSuicide_df <- left_join(hs_demographics, hs_suicide, by = "record")


###  Account for Weights with srvyr::  ###
# See: http://gdfe.co/srvyr/ AND
# https://cran.r-project.org/web/packages/srvyr/vignettes/srvyr-vs-survey.html
hs_suicidality_srv <-
	hsSuicide_df %>%
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
citySuicidality_df <-
	hs_suicidality_srv %>%
	group_by(district, year) %>%
	select(district, year, is_hopeless, starts_with("suicide")) %>%
	summarise(
		propHopeless   = survey_mean(is_hopeless, na.rm = TRUE),
		propConsidered = survey_mean(suicide_considered, na.rm = TRUE),
		propPlanned    = survey_mean(suicide_planned, na.rm = TRUE),
		aveAttempts    = survey_mean(suicide_attempts, na.rm = TRUE),
		propInjured    = survey_mean(suicide_injury, na.rm = TRUE),
		.groups = "keep"
	) %>%
	select(-contains("_se"))

# Inspect
citySuicidality_df %>%
	# filter(district %in% c("miami-dade", "broward", "palm beach")) %>%
	mutate(SFL = district %in% c("miami-dade", "broward", "palm beach")) %>%
	ggplot() +
	  theme_bw() +
	  theme(legend.position = "none") +
	  aes(x = year, y = propConsidered, group = district) +
	  scale_y_continuous(limits = c(0, 0.3)) +
	  geom_point(alpha = 0.25) +
	  geom_line(aes(alpha = SFL, colour = district), size = 1.1)

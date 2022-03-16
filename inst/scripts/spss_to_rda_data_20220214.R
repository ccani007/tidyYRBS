# Importing the YRBS
# Gabriel Odom and Catalina Cañizares
# 02/14/2022


# install.packages("haven")
library(haven)
library(tidyverse)


######  Opening raw SPSS data sets  ###########################################
# To get the high school data set into R I first downloaded the .sav document
# from the CDC and the SPSS syntax. I modified line 318 from the syntax because
# it exceed the number of characters allowed and it generated an error opening
# the data in SPSS. Once I had the data set in .sav I imported it into R, and
# saved it as an RDS to reduce the size of the file.


###  Middle School  ###
# ms_district <- read_sav("inst/extData/sadc_ms_2019_district.sav")
# ms_state_a_m <- read_sav("inst/extData/sadc_ms_2019_state_a_m.sav")
# ms_state_n_z <- read_sav("inst/extData/sadc_ms_2019_state_n_z.sav")


###  High School  ###
hs_district_raw <- read_sav("inst/extData/sadc_hs_2019_district.sav")
# saveRDS(hs_district_raw, "data/hs_district.rds")



######  Clean Geography  ######################################################
# Cleaned the sitename vector. Separated the city from the state and the
#   abbreviation. Eliminated the word "county" and "burough of". Eliminated
#   special characters such as "(),"

hs_district <-
	hs_district_raw %>%
	mutate(sitename_original = sitename) %>%
	select(sitename_original, sitename, everything()) %>%
	separate(sitename, c("district", "state"), sep = "\\,") %>%
	separate(state, c("state", "abb"), sep = "\\(") %>%
	mutate(state = str_trim(state)) %>%
	mutate(abb = str_remove_all(abb, pattern = "\\)")) %>%
	mutate(district = str_to_lower(district)) %>%
	mutate(district = str_remove_all(district, pattern = "borough of ")) %>%
	mutate(district = str_remove_all(district, pattern = " county"))


usethis::use_data(hs_district, overwrite = TRUE)



######  Suicide-Specific Subset  ##############################################

data("hs_district", package = "tidyYRBS")

###  Suicidality Metrics  ###
# Generated a new data set that includes variables related to suicidality,
#   recoded binary variables from 1-2 to 0-1, renamed sex variables and
#   corrected the type of vector of the sex and record variables.
# Because we are inspecting high-school students only, grade may be more
#   informative and have fewer artefacts than age
suicidalityCols_char <- c(
	"state", "district", "year", "weight", "stratum", "PSU", "record",
	"grade", "sex", "race4", "bmipct", "sexid",
	"q26", "q27", "q28", "q29"
)


###  Re-code Factors  ###
# I converted question 28 to a numeric variable assuming the worst case scenario
#   Therefore, if a participant selected 3, that means "2 to 3 attempts", the value
#   is interpreted as 3, if he/she selected 4 that means" 4 to 5 times" the value will
#   be 5. For question 29, I converted it into a binary variable, so when a participant
#   selects option 1 that is "I did not attempt suicide during the past 12 months"
#   then I do not care about that answer and set it to be an NA, then I assign a value
#   of 1 if they attempted suicide and 0 if they did not.
hs_suicide <-
	hs_district %>%
	select(all_of(suicidalityCols_char)) %>%

	###  Demographics and Controls  ###
	# AGE: 1 = 9th, 2 = 10th, 3 = 11th, 4 = 12th
	mutate(
		Grade = case_when(
			grade == 1 ~ 9L,
			grade == 2 ~ 10L,
			grade == 3 ~ 11L,
			grade == 4 ~ 12L,
			TRUE ~ NA_integer_
		)
	) %>%
	# SEX: Based on the label, 1: Female; 2: Male
	mutate(
		Sex = case_when(
			sex == 2 ~ "Male",
			sex == 1 ~ "Female",
			TRUE ~ NA_character_
		)
	) %>%
	# RACE: 1 = NHW, 2 = NHB, 3 = Hisp, 4 = Other
	mutate(
		Race = case_when(
			race4 == 1 ~ "NHW",
			race4 == 2 ~ "NHB",
			race4 == 3 ~ "Hisp",
			race4 == 4 ~ "Other",
			TRUE ~ NA_character_
		)
	) %>%

	# SEXUAL ORIENTATION: 1 = H, 2 = LG, 3 = B, 4 = Q
	mutate(
		SexOrientation = case_when(
			sexid == 1 ~ "H",
			sexid == 2 ~ "LG",
			sexid == 3 ~ "B",
			sexid == 4 ~ "Q",
			TRUE ~ NA_character_
		)
	) %>%
	mutate(record = as.character(record)) %>%


	###  Suicidality  ###
	mutate(across(q26:q29, factor)) %>%
	# Considered Suicide
	mutate(
		suicide_considered = case_when(
			q26 == 2 ~ FALSE,
			q26 == 1 ~ TRUE,
			TRUE ~ NA
		)
	) %>%
	# Planned Suicide
	mutate(
		suicide_planned = case_when(
			q27 == 2 ~ FALSE,
			q27 == 1 ~ TRUE,
			TRUE ~ NA
		)
	) %>%
	# Number of Suicide Attempts
	mutate(
		suicide_attempts = case_when(
			q28 == 1 ~ 0L,
			q28 == 2 ~ 1L,
			q28 == 3 ~ 3L,
			q28 == 4 ~ 5L,
			q28 == 5 ~ 6L,
			TRUE ~ NA_integer_
		)
	) %>%
	# Suicide Injury
	mutate(
		suicide_injury = case_when(
			q29 == 2 ~ TRUE,
			q29 == 3 ~ FALSE,
			q29 == 1 ~ FALSE,
			TRUE ~ NA
		)
	) %>%

	select(-grade, -sex, -race4, -bmipct, -sexid, -(q26:q29))

usethis::use_data(hs_suicide)

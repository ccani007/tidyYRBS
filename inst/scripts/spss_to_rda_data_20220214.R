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



######  Demographics  #########################################################

data("hs_district", package = "tidyYRBS")

# We recoded binary variables from 1-2 to 0-1, renamed sex variables and
#   corrected the type of vector of the sex and record variables. Because we are
#   inspecting high-school students only, grade may be more informative and have
#   fewer artefacts than age; we ignore the variable "qntransgender" because it
#   is almost entirely missing
demoCols_char <- c(
	"state", "district", "year", "weight", "stratum", "PSU", "record",
	"grade", "sex", "race4", "bmipct", "sexid"
)

hs_demographics <-
	hs_district %>%
	select(all_of(demoCols_char)) %>%
	mutate(record = as.character(record)) %>%
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
	select(-grade, -sex, -race4, -bmipct, -sexid)

usethis::use_data(hs_demographics)



######  Suicide-Specific Subset  ##############################################

data("hs_district", package = "tidyYRBS")

# Generate a new data set that includes variables related to suicidality
suicidalityCols_char <- c(
	"record", "q25", "q26", "q27", "q28", "q29"
)

# I converted question 28 to a numeric variable assuming the worst case scenario
#   Therefore, if a participant selected 3, that means "2 to 3 attempts", the
#   value is interpreted as 3; if he/she selected 4 that means "4 to 5 times",
#   the value will  be 5.
# For question 29, I converted it into a binary variable, so when a participant
#   selects option 1, that is "I did not attempt suicide during the past 12
#   months", then I set it to be FALSE.
hs_suicide <-
	hs_district %>%
	select(all_of(suicidalityCols_char)) %>%
	mutate(record = as.character(record)) %>%
	mutate(across(q25:q29, factor)) %>%
	# Feels hopeless
	mutate(
		is_hopeless = case_when(
			q25 == 1 ~ TRUE,
			q25 == 2 ~ FALSE,
			TRUE ~ NA
		)
	) %>%
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
	select(-(q25:q29))

usethis::use_data(hs_suicide)



######  Substance Use Subset  #################################################

###  Helper Functions  ###
PluckLabels <- function(x) {

	out <- attr(x, "label")
	ifelse(is.null(out), NA_character_, out)

}
# Test
PluckLabels(hs_district$district)
PluckLabels(hs_district$q50)

# Find Drug Columns
colLabels_char <- map_chr(hs_district, PluckLabels)
View(
	tibble(
		name  = names(colLabels_char),
		value = unname(colLabels_char)
	)
)


###  Subset and Recode  ###
hs_substance_use <-
	hs_district %>%
	select(record, q40:q57) %>%
	mutate(record = as.character(record)) %>%
	mutate(across(q40:q57, factor)) %>%
	# The substance use questions start on page 42 of the 2019 SADC documentation.
	# After reviewing the questions, I (G.O.) think that 41, 47, 49:54, 56 are
	#   good metrics. I think I will leave 41 and 47 as a count, and partition 49
	#   - 54 into binary groups (56 is already binary). For 41 and 47, the values
	#   are a range, so I'm assigning them to be the midpoint
	mutate(
		nAlcoholDays = case_when(
			q41 == 1 ~ 0,
			q41 == 2 ~ 1.5,
			q41 == 3 ~ 4,
			q41 == 4 ~ 7.5,
			q41 == 5 ~ 14.5,
			q41 == 6 ~ 24.5,
			q41 == 7 ~ 30,
			TRUE ~ NA_real_
		)
	) %>%
	# Marijuana is measured as number of times smoked in the past 30 days, but
	#   capped at 40 times. I'm scaling this back to 30 to match the alcohol use
	mutate(
		nMarijuanaDays = case_when(
			q47 == 1 ~ 0,
			q47 == 2 ~ 1.5,
			q47 == 3 ~ 6,
			q47 == 4 ~ 14.5,
			q47 == 5 ~ 29.5,
			q47 == 6 ~ 40,
			TRUE ~ NA_real_
		),
		nMarijuanaDays = 30 * nMarijuanaDays / 40
	) %>%
	mutate(
		used_prescrip_pain = case_when(
			q49 == 1 ~ FALSE,
			q49 %in% 2:6 ~ TRUE,
			TRUE ~ NA
		)
	) %>%
	mutate(
		used_cocaine = case_when(
			q50 == 1 ~ FALSE,
			q50 %in% 2:6 ~ TRUE,
			TRUE ~ NA
		)
	) %>%
	mutate(
		used_inhalant = case_when(
			q51 == 1 ~ FALSE,
			q51 %in% 2:6 ~ TRUE,
			TRUE ~ NA
		)
	) %>%
	mutate(
		used_heroin = case_when(
			q52 == 1 ~ FALSE,
			q52 %in% 2:6 ~ TRUE,
			TRUE ~ NA
		)
	) %>%
	mutate(
		used_methamphetamine = case_when(
			q53 == 1 ~ FALSE,
			q53 %in% 2:6 ~ TRUE,
			TRUE ~ NA
		)
	) %>%
	mutate(
		used_MDMA = case_when(
			q54 == 1 ~ FALSE,
			q54 %in% 2:6 ~ TRUE,
			TRUE ~ NA
		)
	) %>%
	mutate(
		used_injection = case_when(
			q56 == 1 ~ FALSE,
			q56 %in% 2:3 ~ TRUE,
			TRUE ~ NA
		)
	) %>%
	select(record, nAlcoholDays, nMarijuanaDays, starts_with("used_"))


usethis::use_data(hs_substance_use)


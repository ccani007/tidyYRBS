# Exploring the Unweighted YRBS
# Gabriel Odom and Catalina Cañizares
# 02/14/2022
# Updates 03/15/2022



######  Setup  ################################################################

library(tidyverse)
hs_district_df <- readRDS("data/hs_district.rds")



######  Explore Unweighted Data  ##############################################

# What can I find in this data sets? Type of variables, years of data, locations 
glimpse(hs_district_df)

# This table allows me to see years and district where there is available data
table(hs_district_df$sitename, hs_district_df$year)



#### Wrangle ##################################################################

###  Geography  ###
# Cleaned the sitename vector. Separated the city from the state and the
#   abbreviation. Eliminated the word "county" and "burough of". Eliminated
#   special characters such as "(),"

hs_district1_df <- 
  hs_district_df %>% 
  mutate(sitename_original = sitename) %>% 
  select(sitename_original, sitename, everything()) %>% 
  separate(sitename, c("district", "state"), sep = "\\,") %>% 
  separate(state, c("state", "abb"), sep = "\\(") %>% 
  mutate(abb = str_remove_all(abb, pattern = "\\)")) %>% 
  mutate(district = str_to_lower(district)) %>%  
  mutate(district = str_remove_all(district, pattern = "borough of ")) %>%
  mutate(district = str_remove_all(district, pattern = " county"))


###  Suicidality Metrics  ###
# Generated a new data set that includes variables related to suicidality, 
#   recoded binary variables from 1-2 to 0-1, renamed sex variables and 
#   corrected the type of vector of the sex and record variables.
suicidalityCols_char <- c(
	"state", "district", "year", "weight", "stratum", "PSU", "record", "age",
	"sex", "q26", "q27", "q28", "q29"
)


# I converted question 28 to a numeric variable assuming the worst case scenario
#   Therefore, if a participant selected 3, that means "2 to 3 attempts", the value
#   is interpreted as 3, if he/she selected 4 that means" 4 to 5 times" the value will 
#   be 5. For question 29, I converted it into a binary variable, so when a participant
#   selects option 1 that is "I did not attempt suicide during the past 12 months"
#   then I do not care about that answer and set it to be an NA, then I assign a value
#   of 1 if they attempted suicide and 0 if they did not. 
suicide_df <- 
  hs_district1_df %>% 
  select(all_of(suicidalityCols_char)) %>% 
	# Based on the label, 1: Female; 2: Male
	mutate(
		Sex = case_when(
			sex == 2 ~ "Male",
			sex == 1 ~ "Female", 
			TRUE ~ NA_character_
		)
	) %>% 
  mutate(record = as.character(record)) %>% 
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
			q26 == 3 ~ FALSE, 
			TRUE ~ NA
		)
	) %>% 
	select(-sex, -(q26:q29))
        


######  YRBS by City and Year  ################################################

# We want the city and year to be the experimental unit
yrbs_city_summary_df <- 
  suicide_df %>% 
  group_by(year, district) %>%
  summarise(
  	nConsidered = sum(suicide_considered, na.rm = TRUE), 
    nPlanned    = sum(suicide_planned, na.rm = TRUE), 
    aveAttempts = mean(suicide_attempts, na.rm = TRUE),
    nInjured    = sum(suicide_injury, na.rm = TRUE),
    .groups = "keep"
  )
  
# We are able to explore the data, but not analyse because this data is 
#   unweighted. See "inst/scripts/exploring_yrbs_hs_wt_20220211.R"

# Exploring the YRBS
# Gabriel Odom and Catalina Cañizares
# 02/14/2022

# install.packages("haven")
library(haven)
library(tidyverse)
library(survey)
library(janitor)
library(table1)

# Opening data sets 

# ms_district <- read_sav("raw_data/sadc_ms_2019_district.sav")
# ms_state_a_m <- read_sav("raw_data/sadc_ms_2019_state_a_m.sav")
# ms_state_n_z <- read_sav("raw_data/sadc_ms_2019_state_n_z.sav")
# hs_district <- read_sav("raw_data/sadc_hs_2019_district.sav")
# saveRDS(hs_district, "raw_data/hs_district.rds")

# To get the high school data set into R I first downloaded the .sav document 
# from the CDC and the SPSS syntax. I modified line 318 from the syntax because 
# it exceed the number of characters allowed and it generated an error opening 
# the data in SPSS. Once I had the data set in .sav I imported it into R, and 
# saved it as an RDS to reduce the size of the file. 

hs_district_df <- readRDS("raw_data/hs_district.rds")

# This code tells R the design elements in the survey (PSU, Weights, Strata)
## It should be used for analysis because ignoring the PSUs will tend to yield 
## standard errors that are too small, leading to false positives when doing 
## significance tests (https://stats.oarc.ucla.edu/r/seminars/survey-data-analysis-with-r/).

hs_weighted_df <- svydesign(id=~PSU, weights = ~weight, strata = ~stratum , nest=TRUE, 
                            survey.lonely.psu = "adjust", data = hs_district_df)

#### Explore###################################################################

# This exploration is done assuming  simple random sampling

# What can I find in this data sets? Type of variables, years of data, locations... 

glimpse(hs_district_df)

# This table allows me to see years and district where there is available data

table(hs_district_df$sitename, hs_district_df$year)

#### Wrangle ##################################################################

# Cleaned the sitename vector. Separated the city from the state and the 
## abbreviation. Eliminated the word "county" and "burough of". Eliminated
## special characters such as "(),"

hs_district1_df <- 
  hs_district_df %>% 
  mutate(sitename_original = sitename
  ) %>% 
  select(sitename_original, sitename, everything()
  ) %>% 
  separate(sitename, c("city", "state"), sep = "\\,"
  ) %>% 
  separate(state, c("state", "abb"), sep = "\\("
  ) %>% 
  mutate(abb = str_remove_all(abb, pattern = "\\)")
  ) %>% 
  mutate(city = str_to_lower(city)
  ) %>%  
  mutate(city = str_remove_all(city, pattern = "borough of ")
  ) %>%
  mutate(city = str_remove_all(city, pattern = " county"))


# Generated a new data set that includes variables related to suicidality, 
## recoded binary variables from 1-2 to 0-1, renamed sex variables  and 
## corrected the type of vector of the sex and record variables.

suicide_df<- 
  hs_district1_df %>% 
  select(state,
         city, 
         year,
         weight, 
         stratum, 
         PSU, 
         record, 
         age, 
         sex, 
         q26, 
         q27, 
         q28, 
         q29, 
  ) %>% 
  mutate(sex = 2 - sex
  ) %>% 
  mutate(sex = as.character(sex)
  ) %>% 
  mutate(Sex = case_when (
      sex == 0 ~ "Male",
      sex == 1 ~ "Female", 
      TRUE~ "NA")
  ) %>% 
  mutate(record = as.character(record)
  ) %>% 
  mutate(across(q26:q29, factor)
  ) %>% 
  mutate(across(q26:q27, as.numeric)
  ) %>% 
  mutate(q26 = 2 - q26
  ) %>% 
  mutate(q27 = 2 - q27
  )
        

#### YRBS organized by city and year so that they are the experimental unit ###

# I converted question 28 to a numeric variable assuming the worst case scenario
## Therefore, if a participant selected 3, that means 2 to 3 attempts, the value
## is interpreted as 3, if he selected 4 that means 4 to 5 times the value will 
## be 5. For question 29, I converted it into a binary variable, so when a participant
## selects option 1 that is "I did not attempt suicide during the past 12 months"
## then I do not care about that answer and set it to be an NA, then I assign a value
## of 1 if thet attempted suicide and 0 if they did not. 

MyYRBS_df <- 
  suicide_df %>% 
  mutate(q28N = case_when(
            q28 == 1 ~ "0", 
            q28 == 2 ~ "1", 
            q28 == 3 ~ "3", 
            q28 == 4 ~ "5", 
            q28 == 5 ~ "6",
            TRUE ~ NA_character_ )
  ) %>% 
  mutate(q28N = as.numeric(q28N)
  ) %>% 
  mutate(q29B = case_when(
            q29 == 1 ~ NA_character_, 
            q29 == 2 ~ "1",
            q29 == 3 ~ "0",
            TRUE ~ NA_character_)
  ) %>% 
  mutate(q29B = as.numeric(q29B)
  ) %>% 
  select(city, year, q26, q27, q28N, q29B
  ) %>% 
  group_by(year
  ) %>%
  summarise(suma = sum(q26), na.rm = TRUE)
  

  
  
table1::table1(~ q26 | city, data = MyYRBS_df)

# Tables for each item of suicidality 

considered <- 
  suicide_df %>% 
  tabyl(year, `Seriously consider attempting suicide`) %>% 
  adorn_percentages("row") %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_ns()

considered

plan <- suicide_df %>% 
  tabyl(year, `Made a suicide plan`) %>% 
  adorn_percentages("row") %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_ns()

plan 

attempt <- suicide_df %>% 
  tabyl(year, `Attempted suicide`) %>% 
  adorn_percentages("row") %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_ns()

attempt

injury <- suicide_df %>% 
  tabyl(year, `Attempted suicide`) %>% 
  adorn_percentages("row") %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_ns()

injury

####




#### Now, exploring with weighted data #####################################

# This function will give me the number of PSUs per strata

summary(hs_weighted_df)

# Now, checking descriptive statistics 

svytable(~sex, design = hs_weighted_df)
svytable(~age, design = hs_weighted_df)
svytable(~year, design = hs_weighted_df)
svytable(~q26, design = hs_weighted_df)
svytable(~year + q26, design = hs_weighted_df)
svytable(~sitename + q26, design = hs_weighted_df)

# pLaying with models 

subset1 <- subset(hs_weighted_df, year > 2018)
considered <- svyglm(factor (q26) ~ factor(sex) + factor (sex) + factor (age) + 
                    factor (q12) + factor(q27),
                     design = subset1, na.action = na.omit)
summary(considered)



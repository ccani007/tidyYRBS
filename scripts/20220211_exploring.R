# Exploring the YRBS
# Gabriel Odom and Catalina Cañizares
# 02/14/2022

# install.packages("haven")
library(haven)
library(tidyverse)
library(survey)
library(janitor)

# Opening data sets 

ms_district <- read_sav("raw_data/sadc_ms_2019_district.sav")
 
# ms_state_a_m <- read_sav("raw_data/sadc_ms_2019_state_a_m.sav")
# ms_state_n_z <- read_sav("raw_data/sadc_ms_2019_state_n_z.sav")
# hs_district <- read_sav("raw_data/sadc_hs_2019_district.sav")
# saveRDS(hs_district, "raw_data/hs_district.rds")

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

glimpse(ms_district)
glimpse(hs_district_df)

# These tables allow me to see years and district where there is available data

table(ms_district$sitename, ms_district$year)
table(hs_district_df$sitename, hs_district_df$year)
## More districts are available in the data set from high schools

#### Wrangle ##################################################################


# Cleaned the sitename vector. Separated the city from the state and the 
## abbreviation. Eliminated the word "county" and "burough of". Eliminated
## special characters such as "(),"


hs_district1_df <- hs_district_df %>% 
  mutate(sitename_original = sitename) %>% 
  select(sitename_original, sitename, everything()) %>% 
  separate(sitename, c("city", "state"), sep = "\\,") %>% 
  separate(state, c("state", "abb"), sep = "\\(") %>% 
  mutate(abb = str_remove_all(abb, pattern = "\\)")) %>% 
  mutate(city = str_to_lower(city)) %>%  
  mutate(city = str_remove_all(city, pattern = "borough of ")) %>%
  mutate(city = str_remove_all(city, pattern = " county"))

# Transform binary data from 1 = yes, 2 = no to  0 = no, 1 = yes
  
hs_distric21_df <- hs_district1_df %>% 
  mutate(q26 = as.numeric(q26))

# Generated a new data set that includes variables related to suicidaliy 

suicide_df<- hs_district1_df %>% 
  select(sitename, year, weight, stratum, PSU, record, age, sex, q26, q27, q28, q29, qn26, 
         qn27, qn28, qn29) %>% 
  rename(is_female = sex) %>% 
  mutate(is_female = 2 - is_female) %>% 
  mutate(is_female = as.character(is_female)) %>% 
  mutate(record = as.character(record)) %>% 
  mutate(across(q26:qn29, factor))
  

summary(suicide_df)

# Tables for each item of suicidality 

considered <- suicide_df %>% 
  tabyl(year, q26) %>% 
  adorn_percentages("row") %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_ns()

considered

plan <- suicide_df %>% 
  tabyl(year, q27) %>% 
  adorn_percentages("row") %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_ns()

plan 

attempt <- suicide_df %>% 
  tabyl(year, q28) %>% 
  adorn_percentages("row") %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_ns()

attempt

injury <- suicide_df %>% 
  tabyl(year, q29) %>% 
  adorn_percentages("row") %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_ns()

injury


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



# Importing the YRBS 2019
# Gabriel Odom and Catalina Cañizares
# 08/09/2022

# The aim of this data set importation is to make a trial of tidy models with
# weigted data. 

# install.packages("haven")
library(haven)
library(tidyYRBS)
library(tidyverse)



######  Opening raw SPSS data set  ###########################################
# To get the YRBS 2019 data set into R I first downloaded the .sav document
# from the CDC and the SPSS syntax. I modified the file extension to match 
# where the saved raw data was in my computer. Once I had the data set in .sav 
# I imported it into R, and saved it as an RDS to reduce the size of the file.


### 2019 YRBS  ###
yrbs_2019_raw <- read_sav("inst/extData/2019_YRBS_data.dat.sav")
saveRDS(yrbs_2019_raw , "inst/extData/yrbs_2019_raw.rda")

### Cleaning variables ###

yrbs_2019 <- 
  yrbs_2019_raw %>% 
  mutate(ID = row_number()) %>% 
  separate(Q5, into = c("American Indian", "Asian", "Black",
                        "Native Hawaiian or Other Pacific Islander", 
                        "White", "Hispanic/Latino", "Multiple-Hispanic/Latino",
                        "“Multiple – NonHispanic/Latino"), 
           sep = "\\s"
  ) %>% 
  mutate(
    Sex = case_when(
      Q2 == 2 ~ "Male",
      Q2 == 1 ~ "Female",
      TRUE ~ NA_character_
    )
  ) %>% 
  mutate(
    Age = case_when(
      Q1 == 1 ~ 12L, 
      Q1 == 2 ~ 13L,
      Q1 == 3 ~ 14L,
      Q1 == 4 ~ 15L, 
      Q1 == 5 ~ 16L, 
      Q1 == 6 ~ 17L, 
      Q1 == 7 ~ 18L, 
      TRUE ~ NA_integer_
    )
  ) %>% 
  mutate(
    Grade = case_when(
      Q3 == 1 ~ 9L,
      Q3 == 2 ~ 10L,
      Q3 == 3 ~ 11L,
      Q3 == 4 ~ 12L,
      TRUE ~ NA_integer_
    )
  ) %>% 
  mutate(across(c(Q4, Q9:Q99), factor)) %>% 
  # Transforming binary variables from 1 and 2 to TRUE and FALSE
  mutate(across(c(Q4, Q19, Q23, Q24, Q25, Q30, Q34, Q57, Q58, Q98),
    RecodeTF
        )
  ) %>% 
  # Transforming variables that have a scale from 0 to 6 choosing the 
  #  worst case scenario. 
  mutate(across(c(Q9, Q10, Q12, Q13, Q14, Q15, Q20, Q21, Q22, Q28, Q60, Q61), 
   ScalingToNumber6
        )
  ) %>% 
  # Considered Suicide
  mutate(
    suicide_considered = case_when(
      Q26 == 2 ~ FALSE,
      Q26 == 1 ~ TRUE,
      TRUE ~ NA
    )
  ) %>%
  # Planned Suicide
  mutate(
    suicide_planned = case_when(
      Q27 == 2 ~ FALSE,
      Q27 == 1 ~ TRUE,
      TRUE ~ NA
    )
  ) %>%
  # Number of Suicide Attempts
  mutate(
    suicide_attempts = case_when(
      Q28 == 1 ~ 0L,
      Q28 == 2 ~ 1L,
      Q28 == 3 ~ 3L,
      Q28 == 4 ~ 5L,
      Q28 == 5 ~ 6L,
      TRUE ~ NA_integer_
    )
  ) %>%
  # Suicide Injury
  mutate(
    suicide_injury = case_when(
      Q29 == 2 ~ TRUE,
      Q29 == 3 ~ FALSE,
      Q29 == 1 ~ FALSE,
      TRUE ~ NA
    )
  ) 


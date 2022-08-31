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
raw_yrbs_2019 <- read_sav("inst/extData/2019_YRBS_data.dat.sav")
saveRDS(yrbs_2019_raw, "inst/extData/yrbs_2019_raw.rda")
usethis::use_data(raw_yrbs_2019, overwrite = TRUE)


### Cleaning variables ###
clean_yrbs_2019 <-
  yrbs_2019_raw %>%
  mutate(ID = row_number()) %>%
  mutate(
    Sex = case_when(
      Q2 == 2 ~ "Male",
      Q2 == 1 ~ "Female",
      TRUE ~ NA_character_
    )
  ) %>%
  mutate(
    Race = case_when(
      raceeth == 1 ~ "Am Indian/Alaska Native", 
      raceeth == 2 ~ "Asian",
      raceeth == 3 ~ "Black or African American",
      raceeth == 4 ~ "Native Hawaiian/Other PI", 
      raceeth == 5 ~ "White", 
      raceeth == 6 ~ "Hispanic/Latino", 
      raceeth == 7 ~ "Multiple-Hispanic", 
      raceeth == 8 ~ "Multiple-Non-Hispanic",
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
      Q3 == 1 ~ "9",
      Q3 == 2 ~ "10",
      Q3 == 3 ~ "11",
      Q3 == 4 ~ "12",
      TRUE ~ NA_character_
    )
  ) %>%
  mutate(
    SexOrientation = case_when(
      Q66 == 1 ~ "Heterosexual",
      Q66 == 2 ~ "Gay or Lesbian",
      Q66 == 3 ~ "Bisexual",
      Q66 == 4 ~ "Not sure",
      TRUE ~ NA_character_
    )
  ) %>%
  mutate(
    SexContact = case_when(
      Q65 == 1 ~ "No contact",
      Q65 == 2 ~ "Females",
      Q65 == 3 ~ "Males",
      Q65 == 4 ~ "Females and Males",
      TRUE ~ NA_character_
    )
  ) %>%
  mutate(across(c(Q4, Q9:Q99), factor)) %>%
  # Transforming binary variables from 1 and 2 to TRUE and FALSE
  mutate(
    across(
      c(Q4, Q19, Q23, Q24, Q25, Q30, Q34, Q57, Q58, Q98),
      RecodeTF
    )
  ) %>%
  # Transforming variables that have a scale from 0 to 6 choosing the
  #  worst case scenario.
  mutate(
    across(
      c(Q9, Q10, Q12, Q13, Q14, Q15, Q20, Q21, Q22, Q60, Q61),
      ScaleToNumber6
    )
  ) %>%
  # Transforming variables that have a scale from 0 to 12 choosing the
  #  worst case scenario.
  mutate(
    across(
      c(Q16, Q17, Q18),
      ScaleToNumber12
    )
  ) %>%
  # Transforming variables that have a scale from 0 to 30 days choosing the
  #  worst case scenario.
  mutate(
    across(
      c(Q11, Q32, Q35, Q37, Q38, Q41),
      ScaleToNumber30
     )
  ) %>%
  # Transforming variables that have a scale from 0 to 40 days choosing the
  #  worst case scenario.
  mutate(
    across(
      c(Q47, Q48, Q49, Q50, Q51, Q52, Q53, Q54, Q55, Q90, Q91, Q96),
      ScaleToNumber40
     )
  ) %>%
  # Transforming variables that count number of consumption per day
  mutate(
    across(
      c(Q69, Q70, Q71, Q72, Q73, Q74, Q75, Q76, Q92, Q93),
      ScaleDays
    )
  ) %>%
  
  # Transforming to logical variables with three options that include a response
  #  "not sure" 
  mutate(
    across(
      c(Q84, Q85, Q87, Q94),
      ScaleNotSure
    )
  ) %>%
  # Transforming variables that have a scale from 0 to 20 days choosing the
  #  worst case scenario.
  mutate(
    Q42 = case_when(
      Q42 == 1 ~ 0L,
      Q42 == 2 ~ 1L,
      Q42 == 3 ~ 2L,
      Q42 == 4 ~ 5L,
      Q42 == 5 ~ 9L,
      Q42 == 6 ~ 19L,
      Q42 == 7 ~ 20L,
      TRUE ~ NA_integer_
    )
  ) %>%
  # Transforming variables that have a scale from 0 to 7 days into numeric value
  mutate(
    Q77 = case_when(
      Q77 == 1 ~ 0L,
      Q77 == 2 ~ 1L,
      Q77 == 3 ~ 2L,
      Q77 == 4 ~ 3L,
      Q77 == 5 ~ 4L,
      Q77 == 6 ~ 5L,
      Q77 == 7 ~ 6L,
      Q77 == 8 ~ 7L,
      TRUE ~ NA_integer_
    )
  ) %>%
  mutate(
    Q78 = case_when(
      Q78 == 1 ~ 0L,
      Q78 == 2 ~ 1L,
      Q78 == 3 ~ 2L,
      Q78 == 4 ~ 3L,
      Q78 == 5 ~ 4L,
      Q78 == 6 ~ 5L,
      Q78 == 7 ~ 6L,
      Q78 == 8 ~ 7L,
      TRUE ~ NA_integer_
    )
  ) %>%
  # Transforming variables that have a scale from 0 to 5 hours into numeric 
  #  value
  mutate(
    Q79 = case_when(
      Q79 == 1 ~ 0,
      Q79 == 2 ~ 0.5,
      Q79 == 3 ~ 1,
      Q79 == 4 ~ 2,
      Q79 == 5 ~ 3,
      Q79 == 6 ~ 4,
      Q79 == 7 ~ 5,
      TRUE ~ NA_real_
    )
  ) %>%
  mutate(
    Q80 = case_when(
      Q80 == 1 ~ 0,
      Q80 == 2 ~ 0.5,
      Q80 == 3 ~ 1,
      Q80 == 4 ~ 2,
      Q80 == 5 ~ 3,
      Q80 == 6 ~ 4,
      Q80 == 7 ~ 5,
      TRUE ~ NA_real_
    )
  ) %>%
  # Transforming variables that have a scale from 0 to 5 days into numeric value
  mutate(
    Q81 = case_when(
      Q81 == 1 ~ 0L,
      Q81 == 2 ~ 1L,
      Q81 == 3 ~ 2L,
      Q81 == 4 ~ 3L,
      Q81 == 5 ~ 4L,
      Q81 == 6 ~ 5L,
      TRUE ~ NA_integer_
    )
  ) %>%
  # Transforming variables that have a scale from 0 to 7 days into numeric value
  mutate(
    Q95 = case_when(
      Q95 == 1 ~ 0L,
      Q95 == 2 ~ 1L,
      Q95 == 3 ~ 2L,
      Q95 == 4 ~ 3L,
      Q95 == 5 ~ 4L,
      Q95 == 6 ~ 5L,
      Q95 == 7 ~ 6L,
      Q95 == 8 ~ 7L,
      TRUE ~ NA_integer_
    )
  ) %>%
  # Frequency of cigarettes is translated to numeric by assigning them to be
  #  the midpoint
  mutate(
    Q33 = case_when(
      Q33 == 1 ~ 0,
      Q33 == 2 ~ 1,
      Q33 == 3 ~ 1,
      Q33 == 4 ~ 3.5,
      Q33 == 5 ~ 8,
      Q33 == 6 ~ 15,
      Q33 == 7 ~ 20,
      TRUE ~ NA_real_
    )
  ) %>%
  # Frequency of drinks is translated to numeric by assigning them to be
  #  the midpoint
  mutate(
    Q43 = case_when(
      Q43 == 1 ~ 0,
      Q43 == 2 ~ 1.5,
      Q43 == 3 ~ 3,
      Q43 == 4 ~ 4,
      Q43 == 5 ~ 5,
      Q43 == 6 ~ 6.5,
      Q43 == 7 ~ 8.5,
      Q43 == 8 ~ 10,
      TRUE ~ NA_real_
    )
  ) %>%
  # Frequency of marijuana use is translated to numeric by assigning it to be
  #  the midpoint
  mutate(
    Q45 = case_when(
      Q45 == 1 ~ 0,
      Q45 == 2 ~ 1.5,
      Q45 == 3 ~ 6,
      Q45 == 4 ~ 14.5,
      Q45 == 5 ~ 29.5,
      Q45 == 6 ~ 69.5,
      Q45 == 7 ~ 100,
      TRUE ~ NA_real_
    )
  ) %>%
  # Transforming use of needled injected illegal drug in a scale of 0, 1 and 2
  #  times
  mutate(
    Q56 = case_when(
      Q56 == 1 ~ 0L,
      Q56 == 2 ~ 1L,
      Q56 == 3 ~ 2L,
      TRUE ~ NA_integer_
    )
  ) %>%
  
  # Transforming variables that have a scale from 1 to 3 into logical. 
  #  The transformation was done by assigning 3 and 1 to FALSE and 2 into TRUE 
  mutate(
    Q39 = case_when(
      Q39 == 2 ~ TRUE,
      Q39 == 3 ~ FALSE,
      Q39 == 1 ~ FALSE,
      TRUE ~ NA
    )
  ) %>%
  mutate(
    Q63 = case_when(
      Q63 == 2 ~ TRUE,
      Q63 == 3 ~ FALSE,
      Q63 == 1 ~ FALSE,
      TRUE ~ NA
    )
  ) %>%
  # Transforming variable that have a scale from 0 to 3 into numeric value
  mutate(
    Q82 = case_when(
      Q82 == 1 ~ 0L,
      Q82 == 2 ~ 1L,
      Q82 == 3 ~ 2L,
      Q82 == 4 ~ 3L,
      TRUE ~ NA_integer_
    )
  ) %>%
  # Transforming variable that have a scale from 0 to 4 into numeric value
  mutate(
    Q83 = case_when(
      Q83 == 1 ~ 0L,
      Q83 == 2 ~ 1L,
      Q83 == 3 ~ 2L,
      Q83 == 4 ~ 3L,
      Q83 == 5 ~ 4L,
      TRUE ~ NA_integer_
    )
  ) %>%
  # Transforming variable that have a scale from 4 to 10 hours option 
  mutate(
    Q88 = case_when(
      Q88 == 1 ~ 4L,
      Q88 == 2 ~ 5L,
      Q88 == 3 ~ 6L,
      Q88 == 4 ~ 7L,
      Q88 == 5 ~ 8L,
      Q88 == 6 ~ 9L,
      Q88 == 7 ~ 10L,
      TRUE ~ NA_integer_
    )
  ) %>%
  # Cleaning suicide variables 
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
  # Suicide Attempts
  mutate(
    suicide_attempts = case_when(
      Q28 == 1 ~ FALSE,
      Q28 %in% 2:5 ~ TRUE,
      TRUE ~ NA
    )
  ) %>%
  # Number of Suicide Attempts
  mutate(
    n_suicide_attempts = case_when(
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
  ) %>% 
  select(- c(Q2, Q5, Q1, Q3, Q6, Q7, Q66, Q65, Q26,  Q27, Q28, Q29, Q8, Q31,
             Q36, Q40, Q44, Q46, Q59, Q64, Q67, Q68, Q86, Q89, Q99, q6orig, 
             q7orig, site, raceeth, bmipct),
         -starts_with("QN")
  ) %>% 
  select(weight, stratum, psu, ID, Age, Sex, Grade, Race, 
         SexOrientation, SexContact, suicide_considered, suicide_planned, 
         suicide_attempts, n_suicide_attempts, suicide_injury, everything())

usethis::use_data(clean_yrbs_2019, overwrite = TRUE)


# Exploring the Unweighted YRBS
# Gabriel Odom and Catalina Cañizares
# 02/14/2022
# Updates 03/15/2022



######  Setup  ################################################################

library(tidyverse)
library(tidyYRBS)



######  Explore Unweighted Data  ##############################################

data("hs_district")

# What can I find in this data sets? Type of variables, years of data, locations
glimpse(hs_district)

# This table allows me to see years and district where there is available data
table(hs_district$sitename, hs_district$year)



######  YRBS by City and Year  ################################################

data("hs_suicide")

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

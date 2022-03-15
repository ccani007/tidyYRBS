# Importing the YRBS
# Gabriel Odom and Catalina Cañizares
# 02/14/2022


# install.packages("haven")
library(haven)


###  Opening raw SPSS data sets  ###
# To get the high school data set into R I first downloaded the .sav document 
# from the CDC and the SPSS syntax. I modified line 318 from the syntax because 
# it exceed the number of characters allowed and it generated an error opening 
# the data in SPSS. Once I had the data set in .sav I imported it into R, and 
# saved it as an RDS to reduce the size of the file. 

ms_district <- read_sav("inst/extData/sadc_ms_2019_district.sav")
ms_state_a_m <- read_sav("inst/extData/sadc_ms_2019_state_a_m.sav")
ms_state_n_z <- read_sav("inst/extData/sadc_ms_2019_state_n_z.sav")

hs_district <- read_sav("inst/extData/sadc_hs_2019_district.sav")
saveRDS(hs_district, "data/hs_district.rds")


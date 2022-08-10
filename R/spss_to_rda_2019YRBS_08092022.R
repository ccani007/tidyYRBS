# Importing the YRBS 2019
# Gabriel Odom and Catalina Cañizares
# 08/09/2022

# The aim of this data set importation is to make a trial of tidy models with
# weigted data. 

# install.packages("haven")
library(haven)
library(tidyverse)


######  Opening raw SPSS data set  ###########################################
# To get the YRBS 2019 data set into R I first downloaded the .sav document
# from the CDC and the SPSS syntax. I modified the file extension to match 
# where the saved raw data was in my computer. Once I had the data set in .sav 
# I imported it into R, and saved it as an RDS to reduce the size of the file.


### 2019 YRBS  ###
yrbs_2019_raw <- read_sav("inst/extData/2019_YRBS_data.dat.sav")
saveRDS(yrbs_2019_raw , "data/yrbs_2019_raw.rda")


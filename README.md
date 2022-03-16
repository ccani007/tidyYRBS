---
title: "Tidy YRBS Data"
author: "Catalina Cañizares and Gabriel Odom"
date: 2022-03-16
---


## Purpose

We would like to calculate city-specific summaries of the [Youth Risky Behavior Surveillance System](https://www.cdc.gov/healthyyouth/data/yrbs/index.htm) data related to suicidality of high school students for each year from 1991 to 2019. We consider youth suicidality from an epidemiological and societal perspective, and therefore we want to express the city/county as the experimental unit (rather than the individual). These summaries can then be modeled against county-level demographic information, such as poverty and literacy rates, voting patterns, suicide mortality, and many other measures recorded over time at the county level.

Furthermore, we include this data in its raw form (`hs_districts`), we include a subset of this data related to suicides alone (), and we include examples in our vignette for how to properly weight this survey data and analyse it with a [tidyverse](https://www.tidyverse.org/)-style analysis pipeline.


## Installing our Package

Our package is currently in infancy, so we are not yet ready to submit to CRAN. The development version of `tidyYRBS::` can be installed from this GitHub repository by

```
library(devtools)
install_github("ccani007/tidyYRBS")
```

Please note that using compiled code from GitHub may require your computer to have additional software ([Rtools](https://cran.r-project.org/bin/windows/Rtools/rtools40.html) for Windows or [Xcode](https://developer.apple.com/xcode/) for Mac). Also note that installing this development version may result in some errors. If you find problems, please submit a [bug ticket](https://github.com/ccani007/tidyYRBS/issues).

### Reproducing our Work
If you would like to reproduce our work, complete these steps:

1. Download the high school YRBSS data in SPSS form from the CDC (the file is `"sadc_hs_2019_district.sav"`).
2. Using SPSS, run the import and format script saved in `scripts/open_spss_raw_file_20220316.sps`. This script assumes that the SPSS data set from step 1 is in the directory `extdata/`. Update this file path on line 14 of the SPSS import script to the file path for your computer. NOTE: this script is a modification of the script available from the CDC: we had to change Line 318 to resolve an error in the import.
3. Again in SPSS, save this imported and formatted data in `.sav` format. This will be the data used in the first R script: `scripts/spss_to_rda_data_20220214.R`
4. Run the R code in `scripts/spss_to_rda_data_20220214.R` to reproduce the main `hs_districts` and `hs_suicide` data sets.


## Examples



<!-- Last updated: 2022-03-16 -->

# Chart 3


# Load Libraries ----------------------------------------------------------

library(RColorBrewer)
library(tidyverse)
library(dplyr)
library(stringr)
library(ggplot2)


data <- read.csv("Use_Of_Force.csv")
View(data)

# Introduction
# The topic that are were interested in is police brutality. 
# With the 2020 protests that were caused by police brutality on minorities 
# we believe it's only right to be looking into the details of every incident 
# to see if there are any patterns. In addition, police brutality is an ongoing 
# issue, so studying and identifying trends is critical for taking appropriate 
# data-drive action. This exploratory analysis specifically aims to analyze reported 
# Use-of-Force incidents in the Seattle Police Department. It includes the date 
# of the incident, precinct, sector, beat, subject race, and subject gender, from 
# January 1st, 2015 to December 31st, 2020. We want to see if during this time
# period, Seattle Police were using force in a discriminatory way towards specific
# communities, seeing if SPD possesses any racial bias. 

# Chart idea : pie chart that sees proportion of each affected race to the whole
# pie can only accept integers? If so need to count each race and save those
# values into a vector that the pie function can use
# Column needed : Subject_Race


# Count all Black or African American 
sum_baa <- data %>% 
  select(Subject_Race) %>% 
  filter(Subject_Race == "Black or African American") %>%
  nrow()

sum_white <- data %>% 
  select(Subject_Race) %>% 
  filter(Subject_Race == "White") %>%
  nrow()

sum_asian <- data %>% 
  select(Subject_Race) %>% 
  filter(Subject_Race == "Asian") %>%
  nrow()

sum_unspec <- data %>% 
  select(Subject_Race) %>% 
  filter(Subject_Race == "Not Specified") %>%
  nrow()

sum_amIndian <- data %>% 
  select(Subject_Race) %>% 
  filter(Subject_Race == "American Indian/Alaska Native") %>%
  nrow()

sum_hisp <- data %>% 
  select(Subject_Race) %>% 
  filter(Subject_Race == "Hispanic or Latino") %>%
  nrow()

sum_nat <- data %>% 
  select(Subject_Race) %>% 
  filter(Subject_Race == "Nat Hawaiian/Oth Pac Islander") %>%
  nrow()

sums_races <- c(120, 432, 3814, 452, 77, 2300, 4892)
labels <-  c("American Indian ","Asian","Black or African American",
             "Hispanic or Latino",  "Native Hawaiian/Other Pacific Islander", 
             "Unspecified", "White")

coul <- brewer.pal(7, "Pastel2") 
pie(sums_races, 
    labels, 
    density = 70,
    col = coul, 
    main = "Race/Ethnicities recorded for Use of Force")

  View(pie_races)




pie(sums_races)
race <- data %>% 
  select(Subject_Race) %>% 
  View()

all_races <- unique(data$Subject_Race)
View(all_races)



  
pie(sums_races)
  
  


library(tidyverse)

data <- read.csv("https://raw.githubusercontent.com/AmirrorImage/INFO-201-Final-Project/main/Data/Use_Of_Force.csv")

# This file shows some facts I calculated from the data

total_observations <- print(nrow(data))
total_features <- print(ncol(data))


num_male_female <- data %>%
  count(Subject_Gender)

num_male <- num_male_female %>% 
  filter(Subject_Gender == "Male") %>% 
  pull(n)

num_female <- num_male_female %>% 
  filter(Subject_Gender == "Female") %>% 
  pull(n)
  
num_unknown <- num_male_female %>% 
  filter(Subject_Gender =="Not Specified") %>% 
  pull(n)

num_officers <- data %>%
  count(Officer_ID)
  
off_num <- nrow(num_officers)

repeat_officers <- data %>%
  count(Officer_ID) %>%
  filter(n > 1)  

rep_off <- nrow(repeat_officers)

dates <- as.Date(data$Occured_date_time)
most_recent <- max(dates, na.rm = T)
date_earliest <- min(dates, na.rm = T)

race_unspecified <- data %>%
  filter(Subject_Race == "Not Specified") 
  
race_unspecified <- nrow(race_unspecified)

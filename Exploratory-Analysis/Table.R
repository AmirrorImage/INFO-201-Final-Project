library(tidyverse)

data <- read.csv("https://raw.githubusercontent.com/AmirrorImage/INFO-201-Final-Project/main/Data/Use_Of_Force.csv")


top_10_officers <- data %>% 
  count(Officer_ID) %>% 
  rename(Incidents = n) %>% 
  arrange(-Incidents) %>% 
  top_n(10, Incidents)


   
  




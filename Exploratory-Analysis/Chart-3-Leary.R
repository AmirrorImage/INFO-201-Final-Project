# Chart 3


# Load Libraries ----------------------------------------------------------

library(tidyverse)
library(dplyr)
library(stringr)
library(ggplot2)


data <- read.csv("Use_Of_Force.csv")
View(data)


# Chart idea : pie chart that sees proportion of each affected race to the whole
# Column needed : Subject_Race

race <- data %>% 
  select(Subject_Race) %>% 
  View()

all_races <- unique(data$Subject_Race)
View(all_races)


  
pie(race, )
  
  


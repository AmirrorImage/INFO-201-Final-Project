
# Chart file

library(tidyverse)
library(dplyr)
library(stringr)
library(ggplot2)
library(plotly)
library(RColorBrewer)

data <- read.csv("https://raw.githubusercontent.com/AmirrorImage/INFO-201-Final-Project/main/Data/Use_Of_Force.csv")
View(data)

## This is a bar chart that breaks down the amount of people who experienced certain
# levels of use of force

chart_data <- data %>% 
  count(Incident_Type) 

chart1 <- ggplot(chart_data) +
  geom_col(
    mapping = aes( y = n, x = Incident_Type, fill = Incident_Type),
    position = "dodge"
  ) +
  labs(
    title = "Levels of Use of Force",
    x = "Level",
    y = "Amount of People",
    color = "Different Level"
  )

# The following pie chart shows the race representation of each incident in the
# dataset

pie_chart <- data %>% 
  count(Subject_Race)

labels <-  pie_chart %>% 
  pull(Subject_Race)
  
var <- pie_chart %>% 
  pull(n)

chart2 <- pie(var, labels, main = "Use of Force by Ethnicity")

## This chart represents the incidents by sector, which I don't totally understand the 
# mapping of yet but I was interested in seeing regardless.
hist_data <- data %>% 
  count(Sector)

chart3 <- ggplot(hist_data, aes(x=Sector, y=n)) +
  geom_point(color="orange", size=4) +
  geom_segment( aes(x=Sector, xend=Sector, y=0, yend=n), color="grey")+
  labs(
    title = "Incidents by Sector",
    x = "Sector Name",
    y = "Amount of Incidents"
  )



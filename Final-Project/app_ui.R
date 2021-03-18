library(shiny)
library(ggplot2)
library(plotly)
library(tidyverse)
library(leaflet)

data <- read.csv("https://raw.githubusercontent.com/washingtonpost/data-police-shootings/master/fatal-police-shootings-data.csv")
# Define Widgets (shiny widget library here)

title_page <- tabPanel(
  "Introduction",
  sidebarLayout(
    sidebarPanel(
      ## Insert Picture here
      img("Police engaging in violence against Protestors", src = "https://lh3.googleusercontent.com/proxy/ikokfhOtyIsw_wuoJx-_eFzqTPrKrz9I0OMhClJMOu0TWklEjacbT5UNP2FsqxL5YQjiPRwi74nCbP1YPka4V-Ev3_gHonb1arvxjGzwfKru2tzqgKX3asWy-8o1A8WBXlk"),
      align = "center"
    ),
    mainPanel(
      p("This project was originally dedicated towards Police Brutatlity in the
      context of the George Floyd protests, but since the start of the project
      to now I have pivoted away from that topic and will be focusing on police shootings
      and trying to see if some status quo correlations hold up to be true."),

      p("For this final deliverable, I'll make one dynamic widget w/ Shiny made
      from data provided by the Washington Post repository here https://lh3.googleusercontent.com/proxy/ikokfhOtyIsw_wuoJx-_eFzqTPrKrz9I0OMhClJMOu0TW
        klEjacbT5UNP2FsqxL5YQjiPRwi74nCbP1YPka4V-Ev3_gHonb1arvxjGzwfKru2tzqgKX3asWy-8o1A8WBXlk")
    )
  )
)

# Define structure of tabs (aka pages) -- must make 2 tabs
page_one <- tabPanel(
  "Map of Police Shootings",
  sidebarLayout(
    sidebarPanel(
      h2("This map depicts each shooting incident as a dot, colored by race"),
      p("Note: The minimum value is 2015-01-02"),
      dateRangeInput("date_range",
        label = h3("Date range")
      )
    ),
    mainPanel(
      leafletOutput("my_map"),
      p("I choose to visually represent this information because it shows how
      widespread the issue is nationwide, and gives context to how the volume
      of victims grows over time. The most obvious and important trend to take
      note of is the saturation in urban/population dense area's, this was also
      correlation was also seen in my Exploratory analysis where total black
      prison/incarceration was higher in urban areas compared to urban, which
      was surprising to me at the time but in retrospect now less so.")
    )
  )
)


conclusion <- tabPanel(
  "Conclusion",

  p("Ultimately, I found through this project that black incarceration and police
  violence are more concentrated in urban/population dense areas. I wish I had
  collaborated more effectively when I had the chance, then perhaps I could've,
  gone a bit further into analysing how black americans face systemic injustice
  and violence.")
)


ui <- navbarPage(
  "Police Shootings & Brutality",
  title_page,
  page_one,
  conclusion
)

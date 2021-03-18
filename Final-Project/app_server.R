library(shiny)
library(ggplot2)
library(plotly)
library(tidyverse)
library(leaflet)

data <- read.csv("https://raw.githubusercontent.com/washingtonpost/data-police-shootings/master/fatal-police-shootings-data.csv")

date <- c(
  first(data$date),
  last(data$date)
)

# Define the server
server <- function(input, output) {
  output$my_map <- renderLeaflet({
    my_data <- data %>%
      filter(
        date >= input$date_range[1],
        date <= input$date_range[2]
      )

    palette_fn <- colorFactor(
      palette = "Dark2",
      domain = my_data$race
    )

    leaflet(data = my_data) %>%
      addProviderTiles("Stamen.TonerLite") %>%
      addCircleMarkers(
        lat = ~latitude,
        lng = ~longitude,
        label = ~ paste0(name, ", ", age),
        color = ~ palette_fn(my_data$race),
        fillOpacity = .7,
        radius = 4,
        stroke = FALSE
      ) %>%
      addLegend(
        "bottomright",
        title = "race",
        pal = palette_fn,
        values = my_data$race,
        opacity = 1
      )
  })



  # further clean and/or manipulate the data based on the input from the widgets
  # any code that has input$ or output$ (ex. Your chart or a dataframe that will updated based on user input
  # insert code for chart here
}

## Load packages
library(tidyverse)
library(leaflet)
library(RColorBrewer)
library(shiny)
library(tigris)

ui <- fluidPage(
  
  # Main title
  titlePanel("Youth Voting in the United States"),
  
  # Panel with user input fields
  sidebarLayout(
  sidebarPanel(

    # User selects year from drop-down menu
    selectInput(inputId = "year",
                label = "Election Year",
                choices = c(2016, 2018))

    ), #sidebarpanel
  
  # Map and table
  mainPanel(
    leafletOutput("map")
    ) #mainpanel
  
  ) #sidebarlayout
) #fluidpage


## Clear environment
rm(list=ls(all=TRUE))

## Set working directory
setwd("~/Desktop/data-challenge")

## Load packages
library(tidyverse)
library(leaflet)
library(tigris)

## Import data
youth_vote <- read.csv("02-clean-data/clean_youth_vote_200928.csv")

## Choropleth map

# Import polygond from shape file
states <- states(cb = T)

# Tiles for US states
states %>% 
  leaflet() %>% 
  addTiles() %>% 
  addPolygons(popup = ~NAME)

## Split dataset by year
youth_vote_16 <- filter(youth_vote, year == 2016)

youth_vote_18 <- filter(youth_vote, year == 2018)

# Merge geospatial data and youth vote data
youth_vote_16 <- geo_join(states, youth_vote_16, "STUSPS", "state_code")

youth_vote_18 <- geo_join(states, youth_vote_18, "STUSPS", "state_code")

## Convert primary voting variable into factor variable
youth_vote_16$primary_17 <- ifelse(youth_vote_16$primary_17 %in% "Y", "Yes", "No")
youth_vote_16$primary_17 <- as.factor(youth_vote_16$primary_17)

youth_vote_18$primary_17 <- ifelse(youth_vote_18$primary_17 %in% "Y", "Yes", "No")
youth_vote_18$primary_17 <- as.factor(youth_vote_18$primary_17)

## Define color palettes for different variables
pal_turnout <- colorFactor("Purples", domain = youth_vote_16$primary_17)
pal_register <- colorFactor("Oranges", domain = youth_vote_18$primary_17)

## Format pop-up text
popup_turnout_16 <- paste0(youth_vote_16$state, "<br>Youth Turnout (2016): ", 
                        as.character(youth_vote_16$turnout * 100), "%")
popup_turnout_18 <- paste0(youth_vote_18$state, "<br>Youth Turnout (2018): ", 
                           as.character(youth_vote_18$turnout * 100), "%")
popup_register_16 <- paste0(youth_vote_16$state, "<br>Youth Registration (2016): ", 
                           as.character(youth_vote_16$register * 100), "%")
popup_register_18 <- paste0(youth_vote_18$state, "<br>Youth Registration (2018): ", 
                           as.character(youth_vote_18$register * 100), "%")

## MAP OF 17 YEAR OLD PRIMARY VOTING AND VOTER TURNOUT 

# Generate map for 2016
leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(-98.483330, 38.712046, zoom = 4) %>% 
  addPolygons(data = youth_vote_16, 
              fillColor = ~pal_turnout(youth_vote_16$primary_17), 
              fillOpacity = 0.7, 
              weight = 0.2, 
              smoothFactor = 0.2,
              popup = ~popup_turnout_16) %>%
  addLegend(pal = pal_turnout,
            values = youth_vote_16$primary_17,
            position = "bottomright", 
            title = "States with Primary Voting<br>for 17 year-olds")

# Generate map for 2018
leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(-98.483330, 38.712046, zoom = 4) %>% 
  addPolygons(data = youth_vote_18, 
              fillColor = ~pal_turnout(youth_vote_18$primary_17), 
              fillOpacity = 0.7, 
              weight = 0.2, 
              smoothFactor = 0.2,
              popup = ~popup_turnout_18) %>%
  addLegend(pal = pal_turnout,
            values = youth_vote_18$primary_17,
            position = "bottomright", 
            title = "States with Primary Voting<br>for 17 year-olds")

## MAP OF 17 YEAR OLD PRIMARY VOTING AND VOTER REGISTRATION

# Generate map for 2016
leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(-98.483330, 38.712046, zoom = 4) %>% 
  addPolygons(data = youth_vote_16, 
              fillColor = ~pal_register(youth_vote_16$primary_17), 
              fillOpacity = 0.7, 
              weight = 0.2, 
              smoothFactor = 0.2,
              popup = ~popup_register_16) %>%
  addLegend(pal = pal_register,
            values = youth_vote_16$primary_17,
            position = "bottomright", 
            title = "States with Primary Voting<br>for 17 year-olds")

# Generate map for 2018
leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(-98.483330, 38.712046, zoom = 4) %>% 
  addPolygons(data = youth_vote_18, 
              fillColor = ~pal_register(youth_vote_18$primary_17), 
              fillOpacity = 0.7, 
              weight = 0.2, 
              smoothFactor = 0.2,
              popup = ~popup_register_18) %>%
  addLegend(pal = pal_register,
            values = youth_vote_18$primary_17,
            position = "bottomright", 
            title = "States with Primary Voting<br>for 17 year-olds")

### MAP OF TURNOUT RATES AND 17YO PRIMARY VOTING LAW

## Convert turnout rates into percentile groups as factor variable
youth_vote_16$turnout_per <- as.factor(ifelse(youth_vote_16$turnout <= 0.25, "0%-25%",
                                ifelse(youth_vote_16$turnout > 0.25 & youth_vote_16$turnout <= 0.51, "26%-50%",
                                       ifelse(youth_vote_16$turnout > 0.50 & youth_vote_16$turnout <= 0.75, "51%-74%",
                                              ifelse(youth_vote_16$turnout > 0.75, "76%-100%",
                                                     youth_vote_16$turnout)))))

youth_vote_18$turnout_per <- as.factor(ifelse(youth_vote_18$turnout <= 0.25, "0%-25%",
                                    ifelse(youth_vote_18$turnout > 0.25 & youth_vote_18$turnout <= 0.51, "26%-50%",
                                           ifelse(youth_vote_18$turnout > 0.50 & youth_vote_18$turnout <= 0.75, "51%-74%",
                                                  ifelse(youth_vote_18$turnout > 0.75, "76%-100%",
                                                         youth_vote_18$turnout)))))

# Create color palette for values
pal_turnout_16 <- colorFactor("Greens", domain = youth_vote_16$turnout_per)
pal_turnout_18 <- colorFactor("Greens", domain = youth_vote_18$turnout_per)

pal_register_16 <- colorFactor("viridis", domain = youth_vote_16$turnout_per)
pal_register_18 <- colorFactor("viridis", domain = youth_vote_18$turnout_per)

# Format for popup text
popup_turnout_16 <- paste0(youth_vote_16$state, "<br>Turnout: ", as.character(youth_vote_16$turnout * 100), "%",
                        "<br>17-year-old Primary Voting: ", youth_vote_16$primary_17)
popup_turnout_18 <- paste0(youth_vote_18$state, "<br>Turnout: ", as.character(youth_vote_18$turnout * 100), "%",
                        "<br>17-year-old Primary Voting: ", youth_vote_18$primary_17)

popup_register_16 <- paste0(youth_vote_16$state, "<br>Youth Registered: ", as.character(youth_vote_16$turnout * 100), "%",
                           "<br>17-year-old Primary Voting: ", youth_vote_16$primary_17)
popup_register_18 <- paste0(youth_vote_18$state, "<br>Youth Registered: ", as.character(youth_vote_18$turnout * 100), "%",
                           "<br>17-year-old Primary Voting: ", youth_vote_18$primary_17)

# Generate map for 2016 turnout
leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(-98.483330, 38.712046, zoom = 4) %>% 
  addPolygons(data = youth_vote_16, 
              fillColor = ~pal_turnout_16(youth_vote_16$turnout_per), 
              fillOpacity = 0.7, 
              weight = 0.2, 
              smoothFactor = 0.2, 
              popup = ~popup_turnout_16) %>%
  addLegend(pal = pal_turnout_16, 
            values = youth_vote_16$turnout_per, 
            position = "bottomright", 
            title = "Youth Voter Turnout<br>in 2016 Elections")

# Generate map for 2018 turnout
leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(-98.483330, 38.712046, zoom = 4) %>% 
  addPolygons(data = youth_vote_18, 
              fillColor = ~pal_turnout_18(youth_vote_16$turnout_per), 
              fillOpacity = 0.7, 
              weight = 0.2, 
              smoothFactor = 0.2, 
              popup = ~popup_turnout_18) %>%
  addLegend(pal = pal_turnout_18, 
            values = youth_vote_18$turnout_per, 
            position = "bottomright", 
            title = "Youth Voter Turnout<br>in 2016 Elections")

# Generate map for 2016 registration
leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(-98.483330, 38.712046, zoom = 4) %>% 
  addPolygons(data = youth_vote_16, 
              fillColor = ~pal_register_16(youth_vote_16$turnout_per), 
              fillOpacity = 0.7, 
              weight = 0.2, 
              smoothFactor = 0.2, 
              popup = ~popup_register_16) %>%
  addLegend(pal = pal_register_16, 
            values = youth_vote_16$turnout_per, 
            position = "bottomright", 
            title = "Youth Voter Registration<br>in 2016 Elections")

# Generate map for 2018 registration
leaflet() %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(-98.483330, 38.712046, zoom = 4) %>% 
  addPolygons(data = youth_vote_18, 
              fillColor = ~pal_register_18(youth_vote_16$turnout_per), 
              fillOpacity = 0.7, 
              weight = 0.2, 
              smoothFactor = 0.2, 
              popup = ~popup_register_18) %>%
  addLegend(pal = pal_register_18, 
            values = youth_vote_18$turnout_per, 
            position = "bottomright", 
            title = "Youth Voter Registration<br>in 2018 Elections")


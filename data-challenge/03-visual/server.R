## Set workspace
rm(list = ls(all = TRUE))

# Set working directory: default is downloads folder
setwd("~/Desktop/data-challenge")

# Import data
youth_vote <- read.csv("02-clean-data/clean_youth_vote_200928.csv")

server <- function(input, output) {
  
  states <- states(cb = T)
  
  # Merge data
  youth_vote <- geo_join(states, youth_vote, "STUSPS", "state_code")
  
  # Create color palette for values
  pal <- colorNumeric("Greens", domain = youth_vote$turnout)
  
  # Format for popup text
  popup_turnout <- paste0(youth_vote$state, "<br>Turnout: ", as.character(youth_vote$turnout),
                          "<br>17-year-old Primary Voting: ", youth_vote$primary_17)
  
  # Create map
  output$map <- renderLeaflet({
    
    youth_turnout <- filter(youth_vote,
                            year == input$year)
    
    leaflet(data = youth_turnout) %>%
      addTiles() %>%
      setView(-98.483330, 38.712046, zoom = 4) %>% 
      addPolygons(fillColor = ~pal(youth_turnout$turnout), 
                  fillOpacity = 0.7, 
                  weight = 0.2, 
                  smoothFactor = 0.2, 
                  popup = ~popup_turnout) %>%
      addLegend(pal = pal, 
                values = youth_turnout$turnout, 
                position = "bottomright", 
                title = "Youth Voter Turnout<br>in Elections")
  }) #renderLeaflet
  
} #function




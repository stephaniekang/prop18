
## Clear environment
rm(list=ls(all=TRUE))

## Set working directory
setwd("~/Documents/GitHub/prop18/data-challenge/02-clean-data")

## Load packages
library(tidyverse)
library(plotly)

## Import data
youth_vote <- read.csv("clean_youth_vote_200928.csv")

## Subset data by year
youth_vote_16 <- subset(youth_vote, year == 2016)
youth_vote_18 <- subset(youth_vote, year == 2018)

## Subset states that have 17-year-old primary voting amendment
states <- c("CT", "CO", "DE", "DC", "IL", "IN", "KY", "ME", "MA", "MI",
           "NE", "NM", "NC", "OH", "SC", "UT", "VT", "VA", "WV")

## Create plot for each election year in ggplot

plot <- ggplot(bind_rows(youth_vote_16 %>% mutate(df = "Election Year 2016"),
                         youth_vote_18 %>% mutate(df = "Election Year 2018"))) +
  # Create line (best fit line)
  geom_smooth(mapping=aes(x=register, y=turnout)) +
  # Create points and labels for when user hovers over point
  geom_point(mapping=aes(x=register, y=turnout, 
                         color = ifelse(state_code %in% states, 
                                        "States with 17-Year-Old \nPrimary Voting", 
                                        "States Without"), 
                         text=paste('State: ', state_code)), size = 3) +
  # Specify colors for points
  scale_color_manual(name="",
                     values=c("palegreen3","darkgray"),
                     labels=c("Yes","No")) + 
  # Create individual plot by year
  facet_wrap(~ df, scales = "free") +
  # Label main title
  ggtitle("Youth Voter Turnout-Registration") + 
  # Label x-axis
  xlab("Youth Voter Registration Rate") +
  # Label y-axis
  ylab("Youth Turnout Rate") +
  # Center main title
  theme(plot.title = element_text(hjust = 0.5))

## Generate interactive plot
plot_final <- ggplotly(plot, tooltip=c("text")) 

## View interactive plot
plot_final

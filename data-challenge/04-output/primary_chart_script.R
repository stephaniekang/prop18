
## Clear environment
rm(list=ls(all=TRUE))

## Set working directory
setwd("C:/Users/Grant/Documents/GitHub/prop18/data-challenge/02-clean-data")

## Load packages
library(tidyverse)
library(plotly)

youth_vote <- read_csv("clean_youth_vote_2016.csv")

states = c("CT", "CO", "DE", "DC", "IL", "IN", "KY", "ME", "MA", "MI",
           "NE", "NM", "NC", "OH", "SC", "UT", "VT", "VA", "WV")

plot <- ggplot(data=youth_vote) +
  xlab("Voter Registration Rate") +
  ylab("Turnout Rate") +
  geom_smooth(mapping=aes(x=register, y=turnout)) +
  geom_point(mapping=aes(x=register, y=turnout, 
                         color = ifelse(state_code %in% states, "States with 17-Year-Old \nPrimary Voting", "States Without"), text=paste('State: ', state_code), size=5)) +
  scale_color_manual(name="Registration-Turnout Plot",values=c("green","black"),labels=c("Yes","No"))

ggplotly(plot, tooltip=c("text"))

plot2 <- ggplot(data=youth_vote) +
  xlab("Election Law Score") +
  ylab("Turnout Rate") +
  geom_point(mapping=aes(x=elect_law_score, y=turnout))

ggplotly(plot2)
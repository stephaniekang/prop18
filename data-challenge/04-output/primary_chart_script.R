## Clear environment
rm(list=ls(all=TRUE))

## Set working directory
setwd("~/data-challenge/02-clean-data")

## Load packages
library(tidyverse)

youth_vote <- read_csv("clean_youth_vote_200928.csv")

states = c("CT", "CO", "DE", "DC", "IL", "IN", "KY", "ME", "MA", "MI",
           "NE", "NM", "NC", "OH", "SC", "UT", "VT", "VA", "WV")

plot <- ggplot(data=youth_vote) +
  xlab("Voter Registration Rate") +
  ylab("Turnout Rate") +
  geom_point(mapping=aes(x=register, y=turnout, 
                         color = ifelse(state_code %in% states, "17-Year-Old Primary Voting", "None")), size=5) +
  scale_color_manual(name="State Allows 17-Year-Olds to Vote in Primaries?",values=c("green","red"),labels=c("Yes","No"))

plot

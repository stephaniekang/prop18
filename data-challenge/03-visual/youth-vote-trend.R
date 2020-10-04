## Clear environment
rm(list=ls(all=TRUE))

## Set working directory
setwd("~/Documents/GitHub/prop18/data-challenge/02-clean-data")

## Load packages
library(tidyverse)
library(RColorBrewer)
library(gridExtra)

## Import data into workspace
voting <- read.csv("clean_census_vote.csv", stringsAsFactors = FALSE)

## Calculate Voter Turnout/registration ratio for each age group
voting$turnout_ratio <- round((voting$percent_vote_cit/voting$percent_register_cit), 
                                       digits=4)

## Subset data for only California
cali <- subset(voting, state == "CALIFORNIA" & 
                 !(state == "US" | state == "UNITED STATES") &
                          !(age == "Total") &
                          !(year == 2010))

## Generate plot for California voter turnout and registration by age group each
# election year

# Turnout/registration ratio in CA
plot_cali <- cali %>%
  # Specify data
  ggplot(aes(x = year, y = turnout_ratio, group = age, color = age)) +
  # Generate line
  geom_line() +
  # Custom color palette from RColorBrewer package
  scale_color_brewer(palette = "Set2") + 
  # Generate points
  geom_point() +
  # Label axes
  labs(y = "Voter Turnout/Registration", x = "Election Year")

# View plot
plot_cali

# Just citizen turnout in CA
plot_cali2 <- cali %>%
  ggplot(aes(x = year, y = percent_vote_cit, group = age, color = age)) +
  geom_line() +
  scale_color_brewer(palette = "Set2", guide = "none") + 
  geom_point() +
  labs(y = "Voter Turnout", x = "Election Year")

plot_cali2

## Plot graphs side by side
grid.arrange(plot_cali2, plot_cali, ncol = 2)

## Remove US total
voting_states <- subset(voting, !(state == "US" | state == "UNITED STATES") &
                          !(age == "Total") &
                          !(year == 2010))

## Generate plot for all states
plot <- voting_states %>%
  group_by(age, year) %>%
  summarise(turnout_2 = mean(turnout_ratio, na.rm = TRUE)) %>%
  ggplot(aes(x = year, y = turnout_2, group = age, color = age)) +
  geom_line() +
  scale_color_brewer(palette = "Set2") + 
  geom_point() +
  labs(y = "Voter Turnout/Registration", x = "Election Year") +
  theme(legend.position="right")

## View plot
plot

plot2 <- voting_states %>%
  group_by(age, year) %>%
  summarise(turnout_2 = mean(percent_vote_cit, na.rm = TRUE)) %>%
  ggplot(aes(x = year, y = turnout_2, group = age, color = age)) +
  geom_line() +
  scale_color_brewer(palette = "Set2", guide = "none") + 
  geom_point() +
  labs(y = "Voter Turnout", x = "Election Year") +
  scale_y_continuous(breaks = seq(0, 100, 10)) + 
  theme(legend.position="right")
plot2

## Arrange graphs side by side
grid.arrange(plot2, plot, ncol = 2)

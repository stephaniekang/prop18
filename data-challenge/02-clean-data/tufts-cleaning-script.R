## Clear environment
rm(list=ls(all=TRUE))

## Set working directory
setwd("~/Desktop/data-challenge/01-raw-data")

## Load packages
library(tidyverse)
library(esquisse)

## Import data into workspace
turnout_16 <- read.csv("tufts-circle/voterturnout_16.csv", stringsAsFactors = FALSE)
turnout_18 <- read.csv("tufts-circle/voterturnout_18.csv", stringsAsFactors = FALSE)

register_16 <- read.csv("tufts-circle/register_16.csv", stringsAsFactors = FALSE)
register_18 <- read.csv("tufts-circle/register_18.csv", stringsAsFactors = FALSE)

cast_16 <- read.csv("tufts-circle/votescast_16.csv", stringsAsFactors = FALSE)
cast_18 <- read.csv("tufts-circle/votescast_18.csv", stringsAsFactors = FALSE)

hs_register_16 <- read.csv("tufts-circle/hs_register_16.csv", 
                           stringsAsFactors = FALSE)
hs_register_18 <- read.csv("tufts-circle/hs_register_18.csv", 
                           stringsAsFactors = FALSE)

elect_law_16 <- read.csv("tufts-circle/election_law_16.csv", 
                         stringsAsFactors = FALSE)
elect_law_18 <- read.csv("tufts-circle/election_law_18.csv", 
                         stringsAsFactors = FALSE)

youth_pop_16 <- read.csv("tufts-circle/youth_pop_16.csv", stringsAsFactors = FALSE)
youth_pop_18 <- read.csv("tufts-circle/youth_pop_18.csv", stringsAsFactors = FALSE)

partisan_16 <- read.csv("tufts-circle/partisan_lean_16.csv", stringsAsFactors = FALSE)
partisan_18 <- read.csv("tufts-circle/partisan_lean_18.csv", stringsAsFactors = FALSE)

## Clean data for youth voter turnout in 2016
turnout_16 <- turnout_16 %>%
  # Create a variable for the state's abbreviation
  mutate(state_code = str_sub(State, -2, -1)) %>%
  # Clean the original state variable (remove extra characters)
  mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
  # Create year variable
  mutate(year = 2016) %>%
  # Clean and convert voter turnout statistic into numeric value
  mutate(turnout = as.numeric(str_remove(Data, "%")) / 100) %>%
  # Select only variables of interest
  select(state, state_code, year, turnout)

## Clean data for youth voter turnout in 2018
turnout_18 <- turnout_18 %>%
  mutate(state_code = str_sub(State, -2, -1)) %>%
  mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
  mutate(year = 2018) %>%
  mutate(turnout = as.numeric(str_remove(Data, "%")) / 100) %>%
  select(state, state_code, year, turnout)

## Clean data for youth voter registration in 2016
register_16 <- register_16 %>%
  mutate(state_code = str_sub(State, -2, -1)) %>%
  mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
  mutate(year = 2016) %>%
  # Clean and convert voter registration statistic into numeric value
  mutate(register = as.numeric(str_remove(Data, "%")) / 100) %>%
  select(state, state_code, year, register)

## Clean data for youth voter registration in 2018
register_18 <- register_18 %>%
  mutate(state_code = str_sub(State, -2, -1)) %>%
  mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
  mutate(year = 2018) %>%
  mutate(register = as.numeric(str_remove(Data, "%")) / 100) %>%
  select(state, state_code, year, register)

## Clean data for youth vote cast in 2016
cast_16 <- cast_16 %>%
  mutate(state_code = str_sub(State, -2, -1)) %>%
  mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
  mutate(year = 2016) %>%
  # Clean and convert vote cast variable into numeric value
  mutate(vote_cast = as.numeric(str_remove(Data, ","))) %>%
  select(state, state_code, year, vote_cast)

## Clean data for youth vote cast in 2018
cast_18 <- cast_18 %>%
  mutate(state_code = str_sub(State, -2, -1)) %>%
  mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
  mutate(year = 2018) %>%
  mutate(vote_cast = as.numeric(str_remove(Data, ","))) %>%
  select(state, state_code, year, vote_cast)

## Clean data for youth population in 2016
youth_pop_16 <- youth_pop_16 %>%
  mutate(state_code = str_sub(State, -2, -1)) %>%
  mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
  mutate(year = 2016) %>%
  # Clean and convert youth population variable into numeric value
  mutate(youth_pop = as.numeric(str_remove(Data, ","))) %>%
  select(state, state_code, year, youth_pop)

## Clean data for youth population in 2018
youth_pop_18 <- youth_pop_18 %>%
  mutate(state_code = str_sub(State, -2, -1)) %>%
  mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
  mutate(year = 2018) %>%
  mutate(youth_pop = as.numeric(str_remove(Data, ","))) %>%
  select(state, state_code, year, youth_pop)

#all_data <- list(cast_16, cast_18, elect_law_16, elect_law_18, register_16, 
#                 register_18, turnout_16, turnout_18, youth_pop_16, youth_pop_18)

## Clean data for election laws in 2016
elect_law_16 <- elect_law_16 %>%
  mutate(state_code = str_sub(State, -2, -1)) %>%
  mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
  mutate(year = 2016) %>%
  # Clean and convert election law score into numeric value
  mutate(elect_law_score = Data) %>%
  select(state, state_code, year, elect_law_score)

## Clean data for election laws in 2018
 elect_law_18 <- elect_law_18 %>%
  mutate(state_code = str_sub(State, -2, -1)) %>%
  mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
  mutate(year = 2018) %>%
  mutate(elect_law_score = Data) %>%
  select(state, state_code, year, elect_law_score)  
 
 ## Clean data for HS registration in 2016
 hs_register_16 <- hs_register_16 %>%
   mutate(state_code = str_sub(State, -2, -1)) %>%
   mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
   mutate(year = 2016) %>%
   mutate(hs_register = Data) %>%
   select(state, state_code, year, hs_register) 
 
 ## Clean data for HS registration in 2018
 hs_register_18 <- hs_register_18 %>%
   mutate(state_code = str_sub(State, -2, -1)) %>%
   mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
   mutate(year = 2018) %>%
   mutate(hs_register = Data) %>%
   select(state, state_code, year, hs_register) 
 
 ## Clean data for partisan lean in 2016
 partisan_16 <- partisan_16 %>%
   mutate(state_code = str_sub(State, -2, -1)) %>%
   mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
   mutate(year = 2016) %>%
   # Create variable for party leaning by party and degree of partisan leaning
   # (split string into two columns)
   separate(Data, into = c("party", "leaning", sep = "+")) %>%
   select(state, state_code, year, party, leaning) 
 
 ## Clean data for partisan lean in 2018
 partisan_18 <- partisan_18 %>%
   mutate(state_code = str_sub(State, -2, -1)) %>%
   mutate(state = str_trim(gsub("[A-Z]{2,}", "", State))) %>%
   mutate(year = 2018) %>%
   separate(Data, into = c("party", "leaning", sep = "+")) %>%
   select(state, state_code, year, party, leaning) 
 
 ## Florida as special case in which there is no partisan leaning
 partisan_16[partisan_16$state_code == "FL", "party"] <- "E"
 partisan_16[partisan_16$state_code == "FL", "leaning"] <- 0

 partisan_18[partisan_18$state_code == "FL", "party"] <- "E"
 partisan_18[partisan_18$state_code == "FL", "leaning"] <- 0
 
## Combine common data for multiple years
vote_cast <- rbind(cast_16, cast_18)
vote_reg <- rbind(register_16, register_18)
vote_turnout <- rbind(turnout_16, turnout_18)
youth_pop <- rbind(youth_pop_16, youth_pop_18)
elect_law <- rbind(elect_law_16, elect_law_18)
hs_register <- rbind(hs_register_16, hs_register_18)
partisan_lean <- rbind(partisan_16, partisan_18)

## Merge dataframes by state and year
v1 <- merge(vote_cast, vote_reg,
            by.x = c("state", "state_code", "year"),
            by.y = c("state", "state_code", "year"),
            all.x = TRUE,
            sort = FALSE)

v2 <- merge(v1, vote_turnout,
            by.x = c("state", "state_code", "year"),
            by.y = c("state", "state_code", "year"),
            all.x = TRUE,
            sort = FALSE)

v3 <- merge(v2, youth_pop,
            by.x = c("state", "state_code", "year"),
            by.y = c("state", "state_code", "year"),
            all.x = TRUE,
            sort = FALSE)

v4 <- merge(v3, elect_law,
            by.x = c("state", "state_code", "year"),
            by.y = c("state", "state_code", "year"),
            all.x = TRUE,
            sort = FALSE)

v5 <- merge(v4, hs_register,
            by.x = c("state", "state_code", "year"),
            by.y = c("state", "state_code", "year"),
            all.x = TRUE,
            sort = FALSE)

youth_vote_final <- merge(v5, partisan_lean,
                          by.x = c("state", "state_code", "year"),
                          by.y = c("state", "state_code", "year"),
                          all.x = TRUE,
                          sort = FALSE)

## Remove rows that don't include a state (missing values)
youth_vote_final <- youth_vote_final[-which(youth_vote_final$state_code == ""), ]

## Make year into integer
youth_vote_final$year <- as.integer(youth_vote_final$year)

## Add variable for states that passed 17 year old primary voting amendment
youth_vote_final$primary_17 <- ifelse(youth_vote_final$state_code %in% 
                                        c("UT", "CO", "NM", "NE", "IL", "IN", "OH",
                                          "KY", "MS", "WV", "VA", "NC", "SC", "MD", 
                                          "DE", "DC", "CT", "VT", "ME"), "Y", "N")

## Turn variable for states with 17yo primary voting into a factor variable
#youth_vote_final$primary_17 <- as.factor(youth_vote_final$primary_17)

## Convert partisan leaning into numeric value
youth_vote_final$leaning <- as.numeric(youth_vote_final$leaning)

## Save to file
write.csv(youth_vote_final, 
          "~/Desktop/data-challenge/02-clean-data/clean_youth_vote_200928.csv")

## Test plots
# test <- youth_vote_final %>%
#   group_by(primary_17, year) %>%
#   summarise(avg_register = mean(register, na.rm = TRUE))
#   
# ggplot(data = test,
#        aes(x = primary_17, y = avg_register)) +
#   geom_point() +
#   expand_limits(y=c(0, 1)) +
#   facet_wrap(~year)
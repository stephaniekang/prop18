## Clear environment
rm(list=ls(all=TRUE))

## Set working directory
setwd("C:/Users/Grant/Documents/GitHub/prop18/data-challenge/01-raw-data/census")

## Load packages
library(tidyverse)

## Import data
census_2018 <- read.csv("voting-age-state-2018.csv", 
                        stringsAsFactors = FALSE, skip = 4)

census_2018 <- census_2018[c(1,2,4,5,6,8,10,11,13)]

names(census_2018)[1] <- "state"
names(census_2018)[2] <- "age"
names(census_2018)[3] <- "total_cit"
names(census_2018)[4] <- "total_register"
names(census_2018)[5] <- "percent_register"
names(census_2018)[6] <- "percent_register_cit"
names(census_2018)[7] <- "total_vote"
names(census_2018)[8] <- "percent_vote"
names(census_2018)[9] <- "percent_vote_cit"

census_2018 <- census_2018 %>%
  mutate(year=2018)


## Remove commas from characters to convert into numeric values
census_2018[] <- lapply(census_2018, gsub, pattern = ',', replacement = '')

## Change to numeric values
cols.num <- c("total_cit", "total_register", "percent_register", "percent_register_cit",
              "total_vote", "percent_vote", "percent_vote_cit")

census_2018[cols.num] <- sapply(census_2018[cols.num], as.numeric)

sapply(census_2018, class) # check

## Remove unnecessary rows
census_2018 <- census_2018[-which(census_2018$age == ""), ]

## Change age groups into factors
census_2018$age <- as.factor(census_2018$age)

class(census_2018$age)


for(i in 1:nrow(census_2018)){
  if(census_2018$state[i] == "") {
    census_2018$state[i] = census_2018$state[i-1]
  }
}



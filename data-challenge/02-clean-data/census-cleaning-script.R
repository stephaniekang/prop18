## Clear environment
rm(list=ls(all=TRUE))

## Set working directory
setwd("~/Documents/GitHub/prop18/data-challenge/01-raw-data/census")

## Load packages
library(tidyverse)

## Import data
census_2018 <- read.csv("voting-age-state-2018.csv", 
                        stringsAsFactors = FALSE, skip = 4)

census_2016 <- read.csv("voting-age-state-2016.csv", 
                        stringsAsFactors = FALSE, skip = 4)

census_2014 <- read.csv("voting-age-state-2014.csv", 
                        stringsAsFactors = FALSE, skip = 3)

census_2012 <- read.csv("voting-age-state-2012.csv", 
                        stringsAsFactors = FALSE, skip = 3)

census_2010 <- read.csv("voting-age-state-2010.csv", 
                        stringsAsFactors = FALSE, skip = 2)

## For year 2018 data 

## Select variables of interest by column number 
census_2018 <- census_2018[c(1,2,4,5,6,8,10,11,13)]

## Rename variables
names(census_2018)[1] <- "state"
names(census_2018)[2] <- "age"
names(census_2018)[3] <- "total_cit"
names(census_2018)[4] <- "total_register"
names(census_2018)[5] <- "percent_register"
names(census_2018)[6] <- "percent_register_cit"
names(census_2018)[7] <- "total_vote"
names(census_2018)[8] <- "percent_vote"
names(census_2018)[9] <- "percent_vote_cit"

## Create a variable for year
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

## Loop through data to create state names: go through each row of data and 
# insert the value of the row above it (to fill in blanks with state names)
for(i in 1:nrow(census_2018)){
  if(census_2018$state[i] == "") {
    census_2018$state[i] = census_2018$state[i-1]
  }
}

## For year 2016 data
census_2016 <- census_2016[c(1,2,4,5,6,8,10,11,13)]

names(census_2016)[1] <- "state"
names(census_2016)[2] <- "age"
names(census_2016)[3] <- "total_cit"
names(census_2016)[4] <- "total_register"
names(census_2016)[5] <- "percent_register"
names(census_2016)[6] <- "percent_register_cit"
names(census_2016)[7] <- "total_vote"
names(census_2016)[8] <- "percent_vote"
names(census_2016)[9] <- "percent_vote_cit"

census_2016 <- census_2016 %>%
  mutate(year=2016)

census_2016[] <- lapply(census_2016, gsub, pattern = ',', replacement = '')

cols.num <- c("total_cit", "total_register", "percent_register", "percent_register_cit",
              "total_vote", "percent_vote", "percent_vote_cit")

census_2016[cols.num] <- sapply(census_2016[cols.num], as.numeric)

sapply(census_2016, class) # check

census_2016 <- census_2016[-which(census_2016$age == ""), ]

census_2016$age <- as.factor(census_2016$age)

class(census_2016$age)

for(i in 1:nrow(census_2016)){
  if(census_2016$state[i] == "") {
    census_2016$state[i] = census_2016$state[i-1]
  }
}

## For year 2014 data
census_2014 <- census_2014[c(1,2,4,5,6,8,10,11,13)]

names(census_2014)[1] <- "state"
names(census_2014)[2] <- "age"
names(census_2014)[3] <- "total_cit"
names(census_2014)[4] <- "total_register"
names(census_2014)[5] <- "percent_register"
names(census_2014)[6] <- "percent_register_cit"
names(census_2014)[7] <- "total_vote"
names(census_2014)[8] <- "percent_vote"
names(census_2014)[9] <- "percent_vote_cit"

census_2014 <- census_2014 %>%
  mutate(year=2014)

census_2014[] <- lapply(census_2014, gsub, pattern = ',', replacement = '')

cols.num <- c("total_cit", "total_register", "percent_register", "percent_register_cit",
              "total_vote", "percent_vote", "percent_vote_cit")

census_2014[cols.num] <- sapply(census_2014[cols.num], as.numeric)

sapply(census_2014, class) # check

census_2014 <- census_2014[-which(census_2014$age == ""), ]

census_2014$age <- as.factor(census_2014$age)

class(census_2014$age)

for(i in 1:nrow(census_2014)){
  if(census_2014$state[i] == "") {
    census_2014$state[i] = census_2014$state[i-1]
  }
}

## For year 2012 data
census_2012 <- census_2012[c(1,2,4,5,6,8,10,11,13)]

names(census_2012)[1] <- "state"
names(census_2012)[2] <- "age"
names(census_2012)[3] <- "total_cit"
names(census_2012)[4] <- "total_register"
names(census_2012)[5] <- "percent_register"
names(census_2012)[6] <- "percent_register_cit"
names(census_2012)[7] <- "total_vote"
names(census_2012)[8] <- "percent_vote"
names(census_2012)[9] <- "percent_vote_cit"

census_2012 <- census_2012 %>%
  mutate(year=2012)

census_2012[] <- lapply(census_2012, gsub, pattern = ',', replacement = '')

cols.num <- c("total_cit", "total_register", "percent_register", "percent_register_cit",
              "total_vote", "percent_vote", "percent_vote_cit")

census_2012[cols.num] <- sapply(census_2012[cols.num], as.numeric)

sapply(census_2012, class) # check

census_2012 <- census_2012[-which(census_2012$age == ""), ]

census_2012$age <- as.factor(census_2012$age)

class(census_2012$age)

for(i in 1:nrow(census_2012)){
  if(census_2012$state[i] == "") {
    census_2012$state[i] = census_2012$state[i-1]
  }
}

## For year 2010 data
census_2010 <- census_2010[c(1,2,4,5,6,8,10,11,13)]

names(census_2010)[1] <- "state"
names(census_2010)[2] <- "age"
names(census_2010)[3] <- "total_cit"
names(census_2010)[4] <- "total_register"
names(census_2010)[5] <- "percent_register"
names(census_2010)[6] <- "percent_register_cit"
names(census_2010)[7] <- "total_vote"
names(census_2010)[8] <- "percent_vote"
names(census_2010)[9] <- "percent_vote_cit"

census_2010 <- census_2010 %>%
  mutate(year=2010)

census_2010[] <- lapply(census_2010, gsub, pattern = ',', replacement = '')

cols.num <- c("total_cit", "total_register", "percent_register", "percent_register_cit",
              "total_vote", "percent_vote", "percent_vote_cit")

census_2010[cols.num] <- sapply(census_2010[cols.num], as.numeric)

sapply(census_2010, class) # check

census_2010 <- census_2010[-which(census_2010$age == ""), ]

census_2010$age <- as.factor(census_2010$age)

class(census_2010$age)

for(i in 1:nrow(census_2010)){
  if(census_2010$state[i] == "") {
    census_2010$state[i] = census_2010$state[i-1]
  }
}

## Bind dataframes together into one dataset
census_vote <- rbind(census_2018, census_2016, census_2014, census_2012, census_2010)

## Write into csv file and save to clean data folder
# (user can change location and name of saved file)
write.csv(census_vote,
          "~/Documents/GitHub/prop18/data-challenge/02-clean-data/clean_census_vote.csv")

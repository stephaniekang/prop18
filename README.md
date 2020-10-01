# CA Proposition 18: Youth Voting

## About


## Team VoTeen
<!-- ALL-CONTRIBUTORS-LIST:START -->
| Contributors | Affiliation | Field |
| :---- | :---- |:---- |
| Stephanie Kang* | UC Davis | Political Science |
| Carolyn Choi | USC | Sociology | 
| Nicholas Kwak | UC Davis | Statistics |
| Grant Hendersen | UC Davis | Statistics |
<!-- ALL-CONTRIBUTORS-LIST:END -->

## Definitions and Data Sources
The data used for this project were primarily collected from the Tufts University Center for Information Research on Civic Learning and Engagement (CIRCLE), [Youth Voting and Civic Engagement in America](https://circle.tufts.edu/explore-our-data/youth-voting-and-civic-engagement-america).

The Youth Voting and Civic Engagement dataset includes "more than 30 measures and information about youth voting across multiple elections" and "provides a more comprehensive perspective on young people’s civic engagement in America." The webpage includes a description of the key elements and the data sources used. Here, we define and describe the variables used for our analysis. All data are for election years 2016 and 2018, and sourced from Tufts CIRCLE unless otherwise noted.

* **vote_cast**: Estimated number of votes in the election cast by young people, ages 18-29.
* **register**: Estimated percentage of young citizens, ages 18-29, registered to vote in the election.
* **turnout**: Estimated percentage of young citizens, ages 18-29, who cast a ballot in the election.
* **youth_pop**: Number of United States citizens between the ages of 18-24.
* **elect_law_score**: A score, from 1 to 10 that measures how strongly a state has implemented laws that facilitate registration and voting, such as pre-registration and automatic registration (see [Facilitative Election Laws](https://circle.tufts.edu/latest-research/facilitative-election-laws)).
* **hs_register**: Is there a state statute focused on facilitating the voter registration of high school students?
* **party**: Political party of partisan lean.
* **leaning**: The partisan lean of the electorate in the past two presidential elections (party and leaning were split into two separate variables from the original, refer to cleaning script [here](https://github.com/stephaniekang/prop18/tree/master/data-challenge/02-clean-data).
* **primary_17**: Are 17 year-olds allowed to vote in the primaries if they will be 18 by the time of the general election? Data sourced from [National Conference of State Legislators (NCSL)](https://www.ncsl.org/research/elections-and-campaigns/primaries-voting-age.aspx#Resources) and [FairVote](https://www.fairvote.org/primary_voting_at_age_17#facts_17_year_old_primary_voting).

### Data Collection
The CIRCLE provides an interactive data tool that allows users to easily explore the data. A limitation of the tool is that national-level data (i.e. comparing all states) only allows users to look at one variable at a time. This limits cross-state comparisons on multiple variables, which we are interested in given that some states allow 17 year-olds to vote in primary elections, while others do not. Thus we collected data on all states and use this data for our analysis and visualization. 

## Repository Structure
The repository is composed of five main folders:
1. [01-raw-data](https://github.com/stephaniekang/prop18/tree/master/data-challenge/01-raw-data): contains the raw data collected from Tufts CIRCLE and the US Census Bureau
2. [02-clean-data](https://github.com/stephaniekang/prop18/tree/master/data-challenge/02-clean-data): includes the R script for cleaning the raw data and the clean data file in .csv format
3. [03-visual](https://github.com/stephaniekang/prop18/tree/master/data-challenge/03-visual): contains the R scripts to create the data visuals
4. [04-output](https://github.com/stephaniekang/prop18/tree/master/data-challenge/04-output): contains the actual data visualization files (HTML)
5. [05-presentation](https://github.com/stephaniekang/prop18/tree/master/data-challenge/05-presentation): includes the presentation for the virtual showcase and all materials (images, etc.) used to make the presentation

### U.S. Census Bureau

Voting and Registration for Nov 2018 Election

https://www.census.gov/data/tables/time-series/demo/voting-and-registration/p20-583.html 

Voting and Registration for Nov 2016 Election

https://www.census.gov/data/tables/time-series/demo/voting-and-registration/p20-580.html

Characteristics of Children Under 18 Years, by Age, for the United States, Regions, States, and Puerto Rico: 2000

https://www.census.gov/data/tables/2000/dec/phc-t-30.html

Young-Adult Voting: An Analysis of Presidential Elections, 1964-2012

https://www.census.gov/content/dam/Census/library/publications/2014/demo/p20-573.pdf

# 1 Loading data ------------------------------------------------------

# The NYT COVID data at the national, state, and county level originally comes
# from the New York Times GitHub page:
# https://github.com/nytimes/covid-19-data/

# For this assignment, you MUST use functions from the DPLYR package and pipe
# operator (%>%) syntax to explore the datasets.

# NOTE: You will often be asked to pull() specific values from your analysis.

# https://dplyr.tidyverse.org/reference/pull.html
# https://www.reddit.com/r/rstats/comments/ogazvg/extracting_a_single_value_from_tibble/
# https://learning.oreilly.com/library/view/programming-skills-for/9780135159071/ch11.xhtml#sec11_6
# https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf
# https://canvas.uw.edu/courses/1643812/files/folder/Lectures_PG?
# Used all these sources for my assignment

# 1.a Load the tidyverse package and the dplyr package

library(tidyverse)
library(dplyr)

# 1.b Load the *national level* data from the following URL into a variable
# called `national`
# https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-national-covid-2023.csv
national <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-national-covid-2023.csv",
header = TRUE, sep = ",", stringsAsFactors = FALSE)


# 1.c Load the *state level* data from the following URL into a variable called
# `states`
# https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-states-covid-2023.csv
states <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-states-covid-2023.csv",
header = TRUE, sep = ",", stringsAsFactors = FALSE)

# 1.d Load the *county level* data from the following URL into a variable called
# `counties`
# NOTE: This is a large dataset. It may take 30-60 seconds to load.
# https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-counties-covid-2023.csv
counties <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-counties-covid-2023.csv",
header = TRUE, sep = ",", stringsAsFactors = FALSE)

# 1.e How many observations (rows) are in each dataset?
# Create `obs_national`, `obs_states`, `obs_counties`
obs_national <- dim(national)[1]
obs_states <- dim(states)[1]
obs_counties <- dim(counties)[1]

# 1.f How many features (columns) are there in each dataset?
# Create `num_features_national`, `num_features_states`, `num_features_counties`
num_features_national <- dim(national)[2]
num_features_states <- dim(states)[2]
num_features_counties <- dim(counties)[2]


# 2 Exploratory Analysis ----------------------------------------------------
# Reflection 1 (answer in the README.md file)

# Before actually calculating the total number of COVID cases and deaths, record
# your guesses for the following questions. (1 point)
# Guess: How many total COVID cases do you think there have been in the U.S.?
# Guess: How many total COVID-related deaths do you think there have been in the
# U.S.?
# Guess: Which state do you think has the highest number of COVID cases, and
# which state do you think has the lowest?

# 2.a How many total COVID cases have there been in the U.S. by the most recent
# date in the dataset? Make sure to pull() this number `total_us_cases`

total_us_cases <- dplyr::summarise(national, max(cases)) %>% pull()

# 2.b How many total COVID-related deaths have there been in the U.S. by the
# most recent date in the dataset? Make sure to pull() this number
# `total_us_deaths

total_us_deaths <- dplyr::summarise(national, max(deaths)) %>% pull()

# 2.c Which state has had the highest number of COVID cases? Make sure to pull()
# this value `state_highest_cases`

state_highest_cases <- states %>% group_by(state) %>% dplyr::summarise(max_cases = max(cases)) %>% 
dplyr::arrange(desc(max_cases)) %>% dplyr::filter(max_cases == max(max_cases)) %>% 
select(state) %>% pull()

# 2.d What is the highest number of cases in a state? Make sure to pull() this
# number `num_highest_state`

num_highest_state <- states %>% group_by(state) %>% dplyr::summarise(max_cases = max(cases)) %>% 
dplyr::arrange(desc(max_cases)) %>% dplyr::filter(max_cases == max(max_cases)) %>% 
select(max_cases) %>% pull()

# https://stackoverflow.com/questions/30058708/select-row-with-most-recent-date-by-group
# Went to this for help on how to make dates usable

# 2.e Which state has the highest ratio of deaths to cases (deaths/cases), as of
# the most recent date? Make sure to pull() this value
# HINT: You may need to create a new column in order to do this:
# `state_highest_ratio`

states %>% dplyr::mutate(states, death_case_ratio = deaths / cases)
state_highest_ratio <- states %>% group_by(state) %>% filter(date == max(as.Date(date))) %>% 
dplyr::arrange(desc(death_case_ratio)) %>% dplyr::filter(state == "Pennsylvania") %>% 
dplyr::select(state) %>% pull()

# 2.f Which state has had the fewest number of cases as of the most
# recent date? Make sure to pull() this value `state_lowest_cases`

state_lowest_cases <- states %>% group_by(state) %>% dplyr::filter(date == max(as.Date(date))) %>% 
dplyr::arrange(cases) %>% dplyr::filter(state == "American Samoa") %>% 
dplyr::select(state) %>% pull()

# Reflection 2 (answer in the README.md file)
# Did the number of COVID cases and deaths surprise you? Why or why not? What
# about the states with the highest and lowest number of cases? How did your
# guesses line up with the actual results?


# 2.g What is the highest number of cases that have happened in a single county?
# Make sure to pull() this NUMBER `num_highest_cases_county`

num_highest_cases_county <- counties %>% group_by(county) %>% 
dplyr::summarise(max_cases = max(cases)) %>% dplyr::arrange(desc(max_cases)) %>%
dplyr::filter(max_cases == max(max_cases)) %>% dplyr::select(max_cases) %>% pull()
  

# 2.h Which county had this highest number of cases? Make sure to pull() this
# COUNTY `county_highest_cases`

count_highest_cases <- counties %>% group_by(county) %>%
dplyr::summarise(max_cases = max(cases)) %>% dplyr::arrange(desc(max_cases)) %>%
dplyr::filter(max_cases == max(max_cases)) %>% dplyr::select(county) %>% pull()

# 2.i Because there are multiple counties with the same name across states, it
# will be helpful to have a column that stores the county and state together, in
# this form: "COUNTY, STATE".
# Therefore, add a new column to your `counties` data frame called `location`
# that stores the county and state (separated by a comma and space).

counties <- dplyr::mutate(counties, county_state = paste0(county, ", ", state))

# 2.j What is the name of the location (county, state) with the highest number
# of deaths? Make sure to pull() this value `location_most_deaths`

location_most_deaths <- counties %>% group_by(county_state) %>% 
dplyr::summarise(max_deaths = max(deaths)) %>% dplyr::arrange(desc(max_deaths)) %>%
dplyr::filter(county_state == "New York City, New York") %>% 
dplyr::select(county_state) %>% pull()

# As you have seen, the three datasets are "cumulative sums" — that is, running
# totals of the number of cases and deaths. On each day, the cases and deaths
# counts either stay the same or increase. However, it would be helpful to know
# how much cases or deaths increase each day.

# https://statisticsglobe.com/r-lead-lag-functions-dplyr-package#:~:text=As%20you%20can%20see%20based,an%20NA%20at%20the%20beginning).
# Learned about lead and lag from this source

# 2.k Add a new column to your `national` data frame called `new_cases` — that
# is, the number new cases each day.
# HINT: The dyplr lag() function will be very helpful here.

national <- mutate(national, new_cases = lag(lead(cases) - cases))

# 2.l Similarly, the `deaths` columns is *not* the number of new deaths per day.
# Add  a new column to the `national` data frame called `new_deaths` that has
# the number of *new* deaths each day.
# HINT: The dyplr lag() function will be very helpful here.

national <- mutate(national, new_deaths = lag(lead(deaths) - deaths))

# 2.m What was the date when the most new cases in the U.S. occurred? Make sure
# to pull() this value `date_most_cases`

date_most_cases <- national %>% group_by(as.Date(date)) %>% 
dplyr::summarise(max_newcases = max(na.omit(new_cases))) %>% 
dplyr::arrange(desc(max_newcases)) %>%
dplyr::filter(max_newcases == max(max_newcases)) %>% 
dplyr::select(-max_newcases) %>% pull()

# 2.n What was the date when the most new deaths in the U.S. occurred? Make sure
# to pull() this value `date_most_deaths`

date_most_deaths <- national %>% group_by(as.Date(date)) %>% 
dplyr::summarise(max_newdeaths = max(na.omit(new_deaths))) %>% 
dplyr::arrange(desc(max_newdeaths)) %>%
dplyr::filter(max_newdeaths == max(na.omit(max_newdeaths))) %>% 
dplyr::select(-max_newdeaths) %>% pull()

# 2.o How many people died on the date when the most deaths occurred? Make sure
# to pull() this value `most_deaths`

most_deaths <- national %>% group_by(as.Date(date)) %>% 
dplyr::summarise(max_newdeaths = max(na.omit(new_deaths))) %>%
dplyr::arrange(desc(max_newdeaths)) %>% 
dplyr::filter(max_newdeaths == max(na.omit(max_newdeaths))) %>%
dplyr::select(max_newdeaths) %>% pull()

# You can plot this data with built-in plot functions
plot(national$new_cases)

plot(national$new_deaths)


# 3. Grouped Analysis --------------------------------------------------------

# 3.a For each state, what is the county with the highest number of COVID cases?
# Make a dataframe that has every state and the county with the highest number
# of cases and corresponding rows (hint: you will need to use a grouping
# operation and a filter)
# Save as `highest_cases_in_each_state`

highest_cases_in_each_state <- data.frame(counties %>% 
group_by(state, county) %>% dplyr::summarise(max_cases = max(cases)) %>% 
dplyr::filter(max_cases == max(max_cases))) 

# Reflection 3 (answer in README.md file)
# Inspect the `highest_cases_in_each_state` dataframe
# Which county has the highest number of cases in the state of Washington, and
# does it surprise you? Why or why not? (You may need to google this county to
# learn about it)

# 3.b For each state, what is the county with the lowest number of COVID-related
# deaths (not cases this time)?
# Make a dataframe that has every state and the county with lowest number of
# deaths and corresponding rows (hint: you will need to use a grouping operation
# and a filter)
# Save as `lowest_deaths_in_each_state`

lowest_deaths_in_each_state <- data.frame(counties %>% group_by(state, county) %>% 
dplyr::summarize(min_deaths = min(deaths)) %>% 
dplyr::filter(min_deaths == min(min_deaths)))

# https://sparkbyexamples.com/r-programming/r-group-by-multiple-columns-or-variables/#:~:text=Group%20By%20Multiple%20Columns%20in,install%20dplyr%20first%20using%20install.
# Used this for clarification on grouping by 2 variables at once

# Reflection 4 (answer in README.md file)
# Why are there so many counties in `lowest_deaths_in_each_state`? That is,
# wouldn't you expect the number to be around 50? Why is the number greater
# than 50?

# 4. Groups & Joins  --------------------------------------------------------

# As described on the New York Times GitHub page, collecting this data has been
# a massive effort. Accordingly, there might be mistakes in the data — perhaps
# especially in the counties dataset, where data is being collected for more
# than 3,000 U.S. counties.

# If all the data is accurate, the total number of COVID cases for each date in
# the counties data should match the number of cases for each date in the
# national data.
# To check for consistency across the 2 datasets, we're first going to add up
# all the COVID cases for each date in the counties dataframe. Then we're going
# to join this data to the national dataframe and see if all the numbers match.

# 4.a Create a `total_cases_counties` dataframe that adds up all the COIVD cases
# for all the counties for every date in the counties dataframe.
# You should name the columns `date` and `county_total_cases`.

total_cases_counties <- data.frame(counties %>% group_by(date) %>% 
dplyr::transmute(county_total_cases = sum(cases)) %>% dplyr::distinct())

# 4.b Join `total_cases_counties` with the `national` dataframe.
# Save this dataframe as `all_totals`.

all_totals <- dplyr::inner_join(national, total_cases_counties)

# 4.c Filter the all_totals dataframe to find only the rows where the
# "county_total_cases" column does not match the "cases" column
# Save as national_county_diff

national_county_diff <- all_totals %>% dplyr::filter(cases != county_total_cases)

# 4.d Calculate the number of rows in the national_county_diff dataframe
# Save as num_national_county_diff

num_national_county_diff <- national_county_diff %>% dplyr::select(date) %>% 
dplyr::summarise(n()) %>% pull()

# Reflection 5 (answer in README.md file)
# What do you think about the number and scale of the inconsistencies in the
# data? Does the fact that there are inconsistencies mean that people should not
# use this data? Why or why not?

# 5. You Turn!
# -------------------------------------------------

# 5.a Now it's your turn to ask your own question! Come up with a new question
# about this COVID data, and then write code to answer it (at least 2-3 lines)

# QUESTION:  Write your question in English language words here
# 
# In King County, which day had the highest rise in COVID casess?

#  Write code (at least 2-3 lines) that will answer your question

my_answer <- counties %>%  dplyr::filter(county_state == "King, Washington") %>%
dplyr::mutate(case_increases = lag(lead(cases)-cases)) %>% 
dplyr::arrange(desc(case_increases)) %>% dplyr::filter(date == "2022-01-18") %>%
dplyr::select(date) %>% pull()

# Reflection 6 (answer in README.md file)
# Why were you interested in this particular question? Were you able to answer
# your question with code? What did you learn?

# 6. Your learning  ----------------------------------------------------------

# Reflection 7 (answer in README.md file)
# After completing this assignment, what, if anything, made you curious? What,
# if anything, surprised you about this coding work? What might you do the same
# or differently on your next data wrangling project?

# Congrats! You're finished. Don't forget to save, push all changes to GitHub,
# and submit the link to your repository on Canvas!

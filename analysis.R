# 1 Loading data ------------------------------------------------------

# The NYT COVID data at the national, state, and county level originally comes
# from the New York Times GitHub page:
# https://github.com/nytimes/covid-19-data/

# For this assignment, you MUST use functions from the DPLYR package and pipe
# operator (%>%) syntax to explore the datasets.

# NOTE: You will often be asked to pull() specific values from your analysis.

# 1.a Load the tidyverse package and the dplyr package


# 1.b Load the *national level* data from the following URL into a variable
# called `national`
# https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-national-covid-2023.csv
national <- NULL

# 1.c Load the *state level* data from the following URL into a variable called
# `states`
# https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-states-covid-2023.csv
states <- NULL

# 1.d Load the *county level* data from the following URL into a variable called
# `counties`
# NOTE: This is a large dataset. It may take 30-60 seconds to load.
# https://github.com/melaniewalsh/Neat-Datasets/raw/main/us-counties-covid-2023.csv
counties <- NULL

# 1.e How many observations (rows) are in each dataset?
# Create `obs_national`, `obs_states`, `obs_counties`
obs_national <- NULL
obs_states <- NULL
obs_counties <- NULL

# 1.f How many features (columns) are there in each dataset?
# Create `num_features_national`, `num_features_states`, `num_features_counties`
num_features_national <- NULL
num_features_states <- NULL
num_features_counties <- NULL


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


# 2.b How many total COVID-related deaths have there been in the U.S. by the
# most recent date in the dataset? Make sure to pull() this number
# `total_us_deaths`


# 2.c Which state has had the highest number of COVID cases? Make sure to pull()
# this value `state_highest_cases`


# 2.d What is the highest number of cases in a state? Make sure to pull() this
# number `num_highest_state`


# 2.e Which state has the highest ratio of deaths to cases (deaths/cases), as of
# the most recent date? Make sure to pull() this value
# HINT: You may need to create a new column in order to do this:
# `state_highest_ratio`


# 2.f Which state has had the fewest number of cases as of the most
# recent date? Make sure to pull() this value `state_lowest_cases`


# Reflection 2 (answer in the README.md file)
# Did the number of COVID cases and deaths surprise you? Why or why not? What
# about the states with the highest and lowest number of cases? How did your
# guesses line up with the actual results?


# 2.g What is the highest number of cases that have happened in a single county?
# Make sure to pull() this NUMBER `num_highest_cases_county`


# 2.h Which county had this highest number of cases? Make sure to pull() this
# COUNTY `county_highest_cases`


# 2.i Because there are multiple counties with the same name across states, it
# will be helpful to have a column that stores the county and state together, in
# this form: "COUNTY, STATE".
# Therefore, add a new column to your `counties` data frame called `location`
# that stores the county and state (separated by a comma and space).

# 2.j What is the name of the location (county, state) with the highest number
# of deaths? Make sure to pull() this value `location_most_deaths`


# As you have seen, the three datasets are "cumulative sums" — that is, running
# totals of the number of cases and deaths. On each day, the cases and deaths
# counts either stay the same or increase. However, it would be helpful to know
# how much cases or deaths increase each day.

# 2.k Add a new column to your `national` data frame called `new_cases` — that
# is, the number new cases each day.
# HINT: The dyplr lag() function will be very helpful here.


# 2.l Similarly, the `deaths` columns is *not* the number of new deaths per day.
# Add  a new column to the `national` data frame called `new_deaths` that has
# the number of *new* deaths each day.
# HINT: The dyplr lag() function will be very helpful here.


# 2.m What was the date when the most new cases in the U.S. occurred? Make sure
# to pull() this value `date_most_cases`


# 2.n What was the date when the most new deaths in the U.S. occurred? Make sure
# to pull() this value `date_most_deaths`


# 2.o How many people died on the date when the most deaths occurred? Make sure
# to pull() this value `most_deaths`


# You can plot this data with built-in plot functions
plot(national$new_cases)

plot(national$new_deaths)


# 3. Grouped Analysis --------------------------------------------------------

# 3.a For each state, what is the county with the highest number of COVID cases?
# Make a dataframe that has every state and the county with the highest number
# of cases and corresponding rows (hint: you will need to use a grouping
# operation and a filter)
# Save as `highest_cases_in_each_state`

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
total_cases_counties <- NULL

# 4.b Join `total_cases_counties` with the `national` dataframe.
# Save this dataframe as `all_totals`.
all_totals <- NULL

# 4.c Filter the all_totals dataframe to find only the rows where the
# "county_total_cases" column does not match the "cases" column
# Save as national_county_diff
national_county_diff <- NULL

# 4.d Calculate the number of rows in the national_county_diff dataframe
# Save as num_national_county_diff
num_national_county_diff <- NULL

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
#

#  Write code (at least 2-3 lines) that will answer your question
my_answer <- NULL

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

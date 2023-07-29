# A2: U.S. COVID Trends

## Overview
In many ways, we have come to understand the gravity and trends in the COVID-19 pandemic through data. Regardless of media source, people are consuming more epidemiological information than ever, primarily through reported figures, charts, and maps.

This assignment is your opportunity to work directly with the same data used by the [New York Times](https://github.com/nytimes/covid-19-data/). While the analysis is guided through a series of questions, it is your opportunity to use programming skills to ask more detailed questions about the pandemic.

## Getting Started
You should start this assignment by opening up the `analysis.R` script. The script will guide you through an initial analysis of the data.

* **Coding prompts.** Complete the coding prompts in `analysis.R`. You MUST use the `dplyr` package.

* **Reflection prompts.** Throughout `analysis.R`, there are prompts labeled `"Reflection"`. Please write at least 1-3 sentences for each of these prompts below in this `README.md` file. As appropriate, provide evidence, give justification for your opinions, or genuinely reflect on your views. Please strive for concise, clear, and interesting writing.

## Reflection 1
Before actually calculating the total number of COVID cases and deaths, record your guesses for the following questions.

Guess: How many total COVID cases do you think there have been in the U.S.?

_This is completely off the top of my head, but I think there probably would've been **1 million COVID cases** in the US._ 

Guess: How many total COVID-related deaths do you think there have been in the U.S.?

_Once again, I have no background information on this whatsoever, but I would say around **600,000-800,000** COVID-related deaths in the US._ 

Guess: Which state do you think has the highest number of COVID cases, and which state do you think has the lowest?

I think states that were way **less strict** about taking precautionary measures against COVID ended up with the _highest number of COVID cases_, and states that
made a **conscious effort to take COVID seriously** probably did better to _limit the COVID outbreak in their state_. 

Since I'm still throwing out guesses with no background information whatsoever, I'll guess **Mississippi** for _highest number of COVID cases_ and **New York** for 
_lowest number_ of COVID cases.

## Reflection 2
Did the number of COVID cases and deaths surprise you? Why or why not? What about the states with the highest and lowest number of cases? How did your guesses line up with the actual results? Answer in at least 1-3 sentences

I must have been really out of touch with the times, because my guess for the number of COVID cases (_around 1 million_) was **off by a factor of 100**, which is a massive difference. 

I also don't think I put enough thought into the death rate for COVID, because my guess of _600,000-800,000 deaths_, **while close to the number (1.115 million)** implied that the death rate of COVID was 60-80%. 

States wise, I was **very wrong** as well; I forgot to account for _population density_ across states, because California is heavily populated, and I remember hearing stories about people throwing massive parties during the quarantine, so I probably should've gone with that over COVID response. 

## Reflection 3
Which county has the highest number of cases in the state of Washington, and does it surprise you? Why or why not? (You may need to google this county to learn about it) Answer at least in 1-3 sentences

**King County** has the highest number of cases in Washington, and this is mostly **unsurprising** because _it matches the population density theme from earlier_. Per [Washington Demographics](https://www.washington-demographics.com/counties_by_population), the King County population is **around 2.5 times higher** than the second most populated county in Washington (Pierce), so it makes sense that COVID would be _more communicable in King County_ than other counties.

## Reflection 4
Why are there so many observations (counties) in the variable `lowest_deaths_in_each_state`? That is, wouldn't you expect the number to be around 50? Why is the number greater than 50? Answer in at least 1-3 sentences

**Multiple counties** in different states have **0 deaths due to COVID**. _Unlike the maximum_, where the **output is usually 1 value** (in this case the highest COVID deaths in a county for each state), states having _multiple counties with 0 deaths due to COVID_ makes sense, so the number of counties in the variable is **a lot higher than 50** for that reason.


## Reflection 5
What do you think about the number and scale of the inconsistencies in the data? Does the fact that there are inconsistencies mean that people should not use this data? Why or why not? Answer in at least 1-3 sentences

There were **844 observations** in the all_totals dataset to compare the _added county values_ and the _national raw data_, and only **27** of the rows are inconsistencies, so I don't think _3%_ of the rows being inconsistent is enough of a reason to not use the data. In my statistics class, we talk about **confidence intervals** and _reporting a range of values (per my STAT 311 professor) over one_, and with numbers like counting stats, _which can easily be miscounted_, I think interpreting the discrepancies as a _range of values_ makes this data **more than functional** to use. 


## Reflection 6
Why were you interested in this particular question? Were you able to answer your question with code? What did you learn? Answer in at least 1-3 sentences

I was interested by this question because I thought it was an **extension of the concepts covered in previous parts** of the assignment, and because I was curious about _when the largest COVID spike in the area_ where I live was. I **was** able to answer this question _via code_, and I learned that the **largest increase** in cases was on **January 18th, 2022**, which is interesting because I'd assume that's _after the vaccine was public_ but also during the _rise of the Delta variant_. 

## Reflection 7
What, if anything, made you curious about this COVID analysis? What, if anything, surprised you? What might you do the same or differently on your next data wrangling project? Answer in at least 1-3 sentences

The COVID analysis was **interesting** moreso _because of the scope of the questions_ this assignment made us answer as well as how to _think about using DPLYR to progress through the dataset_ to **access the value** we were interested in looking for. There _wasn't_ very much that was surprising, although I was expecting **less inconsistencies** across the county and national datasets (not that that's significant). I think I would approach any other data wrangling project **exactly the same** as I did this one. 

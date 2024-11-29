#### Preamble ####
# Purpose: Simulates a dataset of City Costs
# Author: Rui Hu
# Date: 27 November 2024
# Contact: hr.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` and `arrow` package must be installed
# Any other information needed? Make sure you are in the `housing_prices` rproj


#### Workspace setup ####
library(tidyverse)
library(arrow)
set.seed(304)


#### Simulate data ####

# Create a dataset by randomly assigning
population <- rnorm(200, mean = 300000, sd = 300000)
Average_HH_Size <- rnorm(200, mean = 4, sd = 1)
Number_of_HH <- rnorm(200, mean = 300000, sd = 600000)
monthly_income <- rnorm(200, mean = 70, sd = 30)
percent_need_housing_upgrades <- runif(200, min = 0, max = 0.8)
market_prices <- rnorm(200, mean = 40000, sd = 30000)
rent <- rnorm(200, mean = 600, sd = 700)

analysis_data <- data.frame(
  population = population,
  Average_HH_Size = Average_HH_Size,
  Number_of_HH = Number_of_HH,
  monthly_income = monthly_income,
  percent_need_housing_upgrades = percent_need_housing_upgrades,
  rent = rent,
  market_prices = market_prices
)
analysis_data <- analysis_data[apply(analysis_data, 1, function(row) all(row >= 0)), ]


#### Save data ####
write_parquet(analysis_data, "data/00-simulated_data/simulated_data.parquet")

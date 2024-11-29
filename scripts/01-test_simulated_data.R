#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Market Price. 
# Author: Rui Hu
# Date: 29 November 2024
# Contact: hr.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` and `arrow` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `housing_prices` rproj


#### Workspace setup ####
library(tidyverse)
library(arrow)

analysis_data <- read_parquet("data/00-simulated_data/simulated_data.parquet")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 93 rows
if (nrow(analysis_data) == 93) {
  message("Test Passed: The dataset has 93 rows.")
} else {
  stop("Test Failed: The dataset does not have 93 rows.")
}

# Check if the dataset has 7 columns
if (ncol(analysis_data) == 7) {
  message("Test Passed: The dataset has 7 columns.")
} else {
  stop("Test Failed: The dataset does not have 7 columns.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(analysis_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

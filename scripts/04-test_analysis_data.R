#### Preamble ####
# Purpose: Tests analysis data.
# Author: Rui Hu
# Date: 30 November 2024
# Contact: hr.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: install `tidyverse` and `testthat`.
# Any other information needed? NA


#### Workspace setup ####
library(tidyverse)
library(testthat)
library(arrow)

analysis_data <- read_parquet(here::here("data/02-analysis_data/analysis_data.parquet"))


#### Test data ####
# Test that the dataset has 149 rows
test_that("dataset has 149 rows", {
  expect_equal(nrow(analysis_data), 149)
})

# Test that the dataset has 10 columns
test_that("dataset has 10 columns", {
  expect_equal(ncol(analysis_data), 10)
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(analysis_data)))
})

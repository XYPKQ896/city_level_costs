#### Preamble ####
# Purpose: Model
# Author: Rui Hu
# Date: 1 December 2024
# Contact: hr.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: NA
# Any other information needed? NA


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

### Model data ####
model <- lm(formula = Average_Market_Price_of_an_Adequate_Home ~ Population + 
              Size + Average_HH_Size + Number_of_HH + Monthly_Income + 
              Percentage_of_HH_in_Need_of_Adequate_Housing_Upgrades + 
              Average_Monthly_Rent_of_an_Adequate_Home, data = analysis_data)


#### Save model ####
saveRDS(
  model,
  file = "models/model.rds"
)




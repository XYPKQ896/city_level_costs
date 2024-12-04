#### Preamble ####
# Purpose: Model
# Author: Rui Hu
# Date: 1 December 2024
# Contact: hr.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: NA
# Any other information needed? NA


#### Workspace setup ####
#install.packages("car")
library(tidyverse)
library(car)

#### Read data ####
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

### Model data ####
model <- lm(formula = Average_Market_Price_of_an_Adequate_Home ~ Population + 
              Size + Average_HH_Size + Number_of_HH + Monthly_Income + 
              Percentage_of_HH_in_Need_of_Adequate_Housing_Upgrades + 
              Average_Monthly_Rent_of_an_Adequate_Home, data = analysis_data)
summary(model)

#### Save model ####
saveRDS(
  model,
  file = "models/first_model.rds"
)

p <- powerTransform(cbind(analysis_data[,c(3, 5:7, 9:10)]))
summary(p)

analysis_data$Population <- analysis_data$Population^0.0015
analysis_data$Average_HH_Size <-analysis_data$Average_HH_Size^0.022
analysis_data$Number_of_HH <- analysis_data$Number_of_HH^0.0014
analysis_data$Monthly_Income <- analysis_data$Monthly_Income^(-0.186)
analysis_data$Average_Market_Price_of_an_Adequate_Home <- 
  analysis_data$Average_Market_Price_of_an_Adequate_Home^(-0.3482)
analysis_data$Average_Monthly_Rent_of_an_Adequate_Home <- 
  analysis_data$Average_Monthly_Rent_of_an_Adequate_Home^(-0.1093)

model1 <- lm(formula = log(Average_Market_Price_of_an_Adequate_Home) ~ Population + 
               Size + Average_HH_Size + Number_of_HH + Monthly_Income + 
               Percentage_of_HH_in_Need_of_Adequate_Housing_Upgrades + 
               Average_Monthly_Rent_of_an_Adequate_Home, data = analysis_data)
summary(model1)

#### Save model ####
saveRDS(
  model1,
  file = "models/second_model.rds"
)




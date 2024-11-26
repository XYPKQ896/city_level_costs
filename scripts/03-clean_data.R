#### Preamble ####
# Purpose: Cleans the raw data, rename the predictors.
# Author: Rui Hu
# Date: 11 November 2024
# Contact: hr.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: NA
# Any other information needed? NA

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/original_data.csv", skip = 1)
raw_data <- raw_data %>% rename(Average_HH_Size = `Average HH Size`, 
                                Number_of_HH = `Number of HH`,
                                Monthly_Income = 
                                  `Average Monthly Household Income of the Lowest Quintile of Population (USD 2019)`,
                                Existing_Open_Space = 
                                  `Existing Open Space (Sq. Km)`,
                                Public_Space_Cost = 
                                  `Total Public Space Cost from 2019-2030 (USD 2019)`,
                                Percentage_of_HH_in_Need_of_Adequate_Housing_Upgrades
                                = `Percentage of HH in Need of Adequate Housing Upgrades`,
                                Average_Market_Price_of_an_Adequate_Home = 
                                  `Average Market Price of an Adequate Home 550 sqft (USD 2019)`,
                                Average_Monthly_Rent_of_an_Adequate_Home =
                                  `Average Monthly Rent of an Adequate Home 550 SqFt per month (USD 2019.)`,
                                Total_Housing_Cost_from = 
                                  `Total Housing Cost from 2019-2030 (USD 2019)`,
                                Total_Governance_Cost = 
                                  `Total Governance Cost from 2019-2030 (USD 2019)`
                                )



cleaned_data <- raw_data %>% select(City, Country, Population, Size, 
                                    Average_HH_Size, Number_of_HH, 
                                    Monthly_Income, Existing_Open_Space, 
                                    Public_Space_Cost, 
                                    Percentage_of_HH_in_Need_of_Adequate_Housing_Upgrades
                                    , Average_Market_Price_of_an_Adequate_Home,
                                    Average_Monthly_Rent_of_an_Adequate_Home,
                                    Total_Housing_Cost_from,
                                    Total_Governance_Cost)

#### Save data ####
write_csv(cleaned_data, "data/02-analysis_data/analysis_data.csv")

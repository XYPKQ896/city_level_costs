#### Preamble ####
# Purpose: Downloads and saves the data from AIDDATA
# Author: Rui Hu
# Date: 27 November 2024
# Contact: hr.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: NA
# Any other information needed? NA


#### Workspace setup ####
library(tidyverse)
library(readxl)

#### Download data ####
url <- "https://github.com/AidData-WM/public_datasets/raw/refs/heads/master/sdg/Counting_the_Costs_City_Data.zip"
download.file(url, destfile = "data/01-raw_data/raw_data.zip", )
unzip("data/01-raw_data/raw_data.zip", exdir = "data/01-raw_data")
raw_data <- read_excel("data/01-raw_data/Counting the Costs City Data/MASTER_DATA_31.1.2020.xlsx")
unlink("data/01-raw_data/__MACOSX", recursive = TRUE)
unlink("data/01-raw_data/Counting the Costs City Data", recursive = TRUE)
file.remove("data/01-raw_data/raw_data.zip")

#### Save data ####
write_csv(raw_data, "data/01-raw_data/original_data.csv") 

         

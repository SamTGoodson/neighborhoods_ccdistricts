library(tidyverse)
library(sf)
library(janitor)
library(broom)

#Read Open Data 
pb_survey <- read.csv('data/raw/Participatory_Budgeting_Survey_Data.csv')
pb_projects <- read.csv('data/raw/Participatory_Budgeting_Projects.csv')
cc_membership <- read.csv('data/raw/NYC_City_Council_Committee_Membership.csv')
cc_con_services <- read.csv('data/raw/NYC_Council_Constituent_Services.csv')
nypd_arrest <- read_csv("data/raw/NYPD_Arrest_Data__Year_to_Date_.csv")

#Read Shapefiles
cc_map <- read_sf('data/shapefiles/city_council')
nyc_map <- read_sf('data/shapefiles/city_council')

#Read ACS

#EDA
cc_con_services %>%
  filter(!is.na(COUNCIL_DIST) & COUNCIL_DIST != "") %>%
  group_by(COUNCIL_DIST, COMPLAINT_TYPE) %>%
  summarise(n = n()) %>%
  group_by(COUNCIL_DIST) %>%
  slice_max(n, n = 1)
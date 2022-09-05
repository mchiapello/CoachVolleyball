# Needed libraries
library(datavolley)
library(ovscout2)
library(tidyverse)
library(fs)
library(here)
setwd(here())
source("001_2223_PGSFOGLIZZESE/U14F/scripts/999_functions.R")

###############################################################################
# Create match/allenamento
opp <- "altri"
us <- "PGS Foglizzese"
date <- "2022-09-01"

pp <- ma(date = date, 
         type = "part",
         time = "19:30:00",
         season = "2022-2023",
         league = "U14F",
         phase = "andata",
         home_away = FALSE,
         day_number = 2,
         match_number = NA,
         set_won = c(3, 2),,
         won_match = c(TRUE, FALSE))

# Create variables
out <- pp[[1]]
match <- pp[[2]]
teams <- pp[[3]]

###############################################################################
# MASTER SCRIPT
###############################################################################

# Load libraries
library(datavolley)
library(ovideo)
library(ovscout2)
library(tidyverse)
library(here)
# Set wd
setwd(here())

# Load video
video_file <- "001_2223_PGSFOGLIZZESE/scout/tmp/test01.mp4"
ref <- ovideo::ov_shiny_court_ref(video_file = video_file)

# TEAMS
teams <- tibble(team_id = c("FOG", "OTH"),
                team = c("PGS Foglizzese", "TSEC"),
                set_won = c(0, 0),
                coach = c("Chiapello", "Unknow"),
                assistent = c("Berardi", "Unknow"),
                shirt_colour = c("White", "Blue"),
                X7 = NA,
                home_away_team  = c("*", "a"),
                won_match = c(TRUE, FALSE))

match <- tibble(date = lubridate::ymd("2022-05-22"),
                time = lubridate::hms("16:00:00"),
                season = NA,
                league = NA,
                phase = "girone unico",
                home_away = FALSE,
                day_number = NA,
                match_number = NA,
                text_encodong = 1,
                regulation = "indoor rally point",
                zones_or_cones = "Z")


x <- dv_create(teams = teams, match = match, 
               players_h = readRDS("001_2223_PGSFOGLIZZESE/scout/tmp/players_fog"), 
               players_v = readRDS("001_2223_PGSFOGLIZZESE/scout/tmp/players_avv"))

## enter the team lineups for set 1
x <- dv_set_lineups(x, set_number = 1, lineups = list(c(28, 42, 16, 56, 32, 27), c(1, 2, 3 , 4, 5, 6)), 
                    setter_positions = c(6, 1))

ov_scouter(x, video_file = video_file, court_ref = ref$court_ref,
           scouting_options = list(transition_sets = TRUE))

xrec <- readRDS("/var/folders/9s/jk05tyb12gb5qbs7gg28k63m0000gp/T//Rtmp5TIj7C/file1511a5e8791a7.rds")
xrec$plays <- NULL ## discard this
ov_scouter(xrec, video_file = video_file, court_ref = ref$court_ref,
           scouting_options = list(transition_sets = TRUE))



# Needed libraries
library(datavolley)
library(ovscout2)
library(tidyverse)
library(fs)
library(here)
setwd(here())

# Create match/allenamento
ma <- function(date = "2022-09-01",
               opp = "altri",
               type = c("allenamento", "partita")){
    type <- match.arg(type)
    us <- "PGS Foglizzese"
    if(type == "partita"){
        mat <- paste0(here(), "/001_2223_PGSFoglizzese/U14F/scouts/partite/", date, "_", opp)
        dir_create(mat) 
        return(mat)
    } else {
        mat <- paste0(here(), "/001_2223_PGSFoglizzese/U14F/scouts/allenamenti/", date)
        dir_create(mat) 
        return(mat)
    }
}

opp <- "altri"
us <- "PGS Foglizzese"
date <- "2022-09-01"
out <- ma(date = date, type = "allenamento")

# Copy video clip inside new created folder
# read video
video_file <- dir_ls(out, regexp = "mp4$")
ref <- ovideo::ov_shiny_court_ref(video_file = video_file)


#######################
# PARTITA
# Match info
match <- tibble(date = lubridate::ymd(date),
                time = lubridate::hms("19:30:00"),
                season = "2022-2023",
                league = "U14F",
                phase = "andata",
                home_away = FALSE,
                day_number = 2,
                match_number = NA,
                text_encodong = 1,
                regulation = "indoor rally point",
                zones_or_cones = "Z")

# TEAMS
teams <- tibble(team_id = c("FOG", opp),
                team = c(us, opp),
                set_won = c(3, 2),
                coach = c("Chiapello", "Unknow"),
                assistent = c("Berardi", "Unknow"),
                shirt_colour = c("White", "Blue"),
                X7 = NA,
                home_away_team  = c("*", "a"),
                won_match = c(TRUE, FALSE))

#######################
# ALLENAMENTI
# Match info
match <- tibble(date = lubridate::ymd(date),
                time = lubridate::hms("19:30:00"),
                season = "2022-2023",
                league = "Allenamento",
                phase = "Pre-season",
                home_away = FALSE,
                day_number = NA,
                match_number = NA,
                text_encodong = 1,
                regulation = "indoor rally point",
                zones_or_cones = "Z")

# TEAMS
teams <- tibble(team_id = c("FOG", opp),
                team = c(us, opp),
                set_won = c(3, 2),
                coach = c("Chiapello", "Unknow"),
                assistent = c("Berardi", "Unknow"),
                shirt_colour = c("White", "Blue"),
                X7 = NA,
                home_away_team  = c("*", "a"),
                won_match = c(TRUE, FALSE))


x <- dv_create(teams = teams, match = match, 
               players_h = readRDS("001_2223_PGSFOGLIZZESE/U14F/tmp/players_fog"), 
               players_v = readRDS("001_2223_PGSFOGLIZZESE/U14F/tmp/players_avv"))

## enter the team lineups for set 1
x <- dv_set_lineups(x, set_number = 1, 
                    lineups = list(c(42,11,28,32,65,27), 
                                   c(1, 2, 3 , 4, 5, 6)), 
                    setter_positions = c(3, 1))

ov_scouter(x, video_file = video_file, court_ref = ref$court_ref,
           scouting_options = list(transition_sets = FALSE,
                                   nblockers = FALSE),
           launch_browser = FALSE)

ov_scouter("~/Library/Application Support/ovscout2/autosave/ovscout2-b5ee5503ebf1.ovs")

# Needed libraries
library(datavolley)
library(ovideo)
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
        mat <- paste0(here(), "/001_2223_PGSFoglizzese/scout/partite/", date, "_", opp)
        dir_create(mat) 
        return(mat)
    } else {
        mat <- paste0(here(), "/001_2223_PGSFoglizzese/scout/allenamenti/", date)
        dir_create(mat) 
        return(mat)
    }
}

out <- ma(date = "2022-01-01", type = "part")

# Copy video clip inside new created folder
# read video
video_file <- dir_ls(out, regexp = "mp4$")
ref <- ovideo::ov_shiny_court_ref(video_file = video_file)


#######################
# PARTITA
# Match info
match <- tibble(date = lubridate::ymd(date),
                time = lubridate::hms("16:00:00"),
                season = "2022-2023",
                league = "POU13F UISP",
                phase = "girone unico",
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
                coach = c("Berardi", "Unknow"),
                assistent = c("Chiapello", "Unknow"),
                shirt_colour = c("White", "Blue"),
                X7 = NA,
                home_away_team  = c("*", "a"),
                won_match = c(TRUE, FALSE))

#######################
# ALLENAMENTI
# Match info
match <- tibble(date = lubridate::ymd(date),
                time = lubridate::hms("16:00:00"),
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
                coach = c("Berardi", "Unknow"),
                assistent = c("Chiapello", "Unknow"),
                shirt_colour = c("White", "Blue"),
                X7 = NA,
                home_away_team  = c("*", "a"),
                won_match = c(TRUE, FALSE))


x <- dv_create(teams = teams, match = match, 
               players_h = readRDS("001_2223_PGSFOGLIZZESE/scout/tmp/players_fog"), 
               players_v = readRDS("001_2223_PGSFOGLIZZESE/scout/tmp/players_avv"))


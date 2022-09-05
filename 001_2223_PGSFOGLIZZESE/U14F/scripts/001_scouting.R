x <- dv_create(teams = teams, match = match, 
               players_h = readRDS("001_2223_PGSFOGLIZZESE/U14F/tmp/players_fog"), 
               players_v = readRDS("001_2223_PGSFOGLIZZESE/U14F/tmp/players_avv"))

## enter the team lineups for set 1
x <- dv_set_lineups(x, set_number = 1, 
                    lineups = list(c(42, 11, 28, 32, 65, 27), 
                                   c(1, 2, 3 , 4, 5, 6)), 
                    setter_positions = c(3, 1))

ov_scouter(x, video_file = video_file, court_ref = ref$court_ref,
           scouting_options = list(transition_sets = FALSE,
                                   nblockers = FALSE),
           launch_browser = FALSE)

# ov_scouter("~/Documents/personale/CoachVolleyball/001_2223_PGSFOGLIZZESE/U14F/scouts/allenamenti/2022-09-01/20220901_A002-3.ovs")

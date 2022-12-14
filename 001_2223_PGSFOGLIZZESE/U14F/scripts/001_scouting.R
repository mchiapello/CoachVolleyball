video_file <- dir_ls(out, regexp = "*MOV$")

x <- dv_create(teams = teams, match = match, 
               players_h = readRDS("001_2223_PGSFOGLIZZESE/U14F/tmp/players_fog"), 
               players_v = readRDS("001_2223_PGSFOGLIZZESE/U14F/tmp/players_avv"))

## enter the team lineups for set 1
x <- dv_set_lineups(x, set_number = 1, 
                    lineups = list(c(54,27,32,28,65,42), 
                                   c(1, 2, 3 , 4, 5, 6)), 
                    setter_positions = c(3, 1))

ov_scouter(x, video_file = video_file,
           scouting_options = list(transition_sets = TRUE,
                                   nblockers = FALSE),
           launch_browser = FALSE)

fs::file_move("~/Library/Application Support/ovscout2/autosave/ovscout2-724a54372810.ovs",
              "~/Documents/personale/CoachVolleyball/001_2223_PGSFOGLIZZESE/U14F/scouts/allenamenti/2022-09-06/IMG_1049.ovs")

ov_scouter("~/Documents/personale/CoachVolleyball/001_2223_PGSFOGLIZZESE/U14F/scouts/allenamenti/2022-09-06/IMG_1049.ovs",
           video_file = video_file,
           scouting_options = list(transition_sets = TRUE,
                                   nblockers = FALSE),
           launch_browser = FALSE)

# Create DV object
x <- dv_create(teams = teams, match = match, players_h = readRDS("matches/players_fog"), players_v = readRDS("matches/players_avv"))

# enter the team lineups for set 1
x <- dv_set_lineups(x, set_number = 1, lineups = list(c(11, 22, 27, 65, 32, 54), c(1, 2, 3 , 4, 5, 6)), 
                    setter_positions = c(3, 1))

# SCOUT THE MATCH
ov_scouter(x, video_file = video_file, scouting_options = list(transition_sets = TRUE))

# # Recover match scouting
# xrec <- readRDS("/var/folders/9s/jk05tyb12gb5qbs7gg28k63m0000gp/T//RtmpneIuEE/file65f12e3e3835.rds")
# xrec$plays <- NULL ## discard this
# ov_scouter(xrec, video_file = video_file, scouting_options = list(transition_sets = TRUE))

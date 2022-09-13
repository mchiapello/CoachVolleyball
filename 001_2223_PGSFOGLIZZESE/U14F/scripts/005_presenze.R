source("001_2223_PGSFOGLIZZESE/U14F/scripts/999_functions.R")

pres <- readr::read_tsv("001_2223_PGSFOGLIZZESE/U14F/tmp/presenze.tsv")
players <- readr::read_table("001_2223_PGSFOGLIZZESE/U14F/tmp/players.tsv")

tail(pres, n = 12)

pres <- add(players,
    date = "20220909",
    assenti = c(65, 14))

tail(as.data.frame(pres), n = 24)

file_copy("001_2223_PGSFOGLIZZESE/U14F/tmp/presenze.tsv",
          "001_2223_PGSFOGLIZZESE/U14F/tmp/presenze_old.tsv",
          overwrite = TRUE)
write_tsv(pres, "001_2223_PGSFOGLIZZESE/U14F/tmp/presenze.tsv")

pres %>% 
    mutate(date = format(date, "%d-%m")) %>% 
    pivot_wider(names_from = date,
                values_from = assenti) %>% 
    janitor::adorn_totals("row") %>% 
    janitor::adorn_totals("col") %>% 
    arrange((Total)) %>% 
    gt::gt(id = "mygt") %>% 
    gtExtras::gt_theme_538()  %>% 
    gt::gtsave("001_2223_PGSFOGLIZZESE/U14F/trainings/presenze.png", expand = 10)

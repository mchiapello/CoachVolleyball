# Load libraries
library(bookdown)

fold <- paste0("matches/", mat)

# Report
setwd("Report/")
system(paste0("Rscript -e \"bookdown::render_book('index.Rmd', 'bookdown::github_document2', params = list(path = \"", 
              fold, "\")\""))

system("Rscript -e \"bookdown::render_book('index.Rmd', 'bookdown::github_document2', params = list(path = \"pinco\") )\"")

setwd("..")

# Copy files
file_copy("Report/_book/MC-report.pdf", paste0("matches/", mat, "/Report.pdf"))

# Clean
setwd("Report/")
system("rm -rf _book")
system("rm -rf _bookdown_files/")
setwd("..")

# server.R
install.packages("plumber")
library(plumber)

r <- plumb("plumber.R")  # 'plumber.R' is your API script
r$run(host = '0.0.0.0', port = as.numeric(Sys.getenv('PORT', '8000')))

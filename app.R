library(plumber)
api <- plumb("api.R")
api$run(port=8080, host="0.0.0.0")

# plumber.R

library(tidyverse)

#* @param x
#* @get /normalDistribution
normalDistribution <- function(x = 10, y=10) {
  plot(x,y)
}

#' Echo the parameter that was sent in
#' @param msg The message to echo back.
#' @get /
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}


#* Plot a histogram
#* @png
#* @get /plot
plot <- function(){
  rand <- rnorm(100)
  hist(rand)
}

#* Plot a histogram
#* @png
#* @get /tidy
plotidy <- function(){
  ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(title = "Fuel efficiency generally decreases with engine size")
}



#* @serializer contentType list(type="application/pdf")
#* @get /pdf
pdf <- function(){
  tmp <- tempfile()
  pdf(tmp)
  plot(1:10, type="b")
  text(4, 8, "PDF from plumber!")
  text(6, 2, paste("The time is", Sys.time()))
  dev.off()

  readBin(tmp, "raw", n=file.info(tmp)$size)
}

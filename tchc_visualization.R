rm(list=ls())

library(magrittr)
library(leaflet)
library(htmlwidgets)

setwd("/Users/kevinquach/Dropbox/DataScience/TCHC")

df <- read.csv("TCHCBUILDING_6UNITSOR_MORE.csv", header = TRUE)

m <- leaflet(df) %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=~LONGITUDE,
             lat=~LATITUDE, 
             popup=paste("<b>Development Name:</b>", df$DEV_NAME, "<br>",
                         "<b>Year Built:</b>", df$YEAR_BUILT, "<br>",
                         "<b>Building Typology:</b>", df$BUILDING, "<br>",
                         "<b>Total Residential Units:</b>", df$TOTAL_RESU),
             clusterOptions = markerClusterOptions())
             
m  # Print the map

saveWidget(m, file = "m.html")

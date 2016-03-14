rm(list=ls())

library(magrittr)
library(leaflet)

setwd("/Users/kevinquach/Dropbox/DataScience/TCHC")

df <- read.csv("TCHCBUILDING_6UNITSOR_MORE.csv", header = TRUE)

m <- leaflet(df) %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=~LONGITUDE,
             lat=~LATITUDE, 
             popup=paste("<b>Street Address:</b>", df$DEV_ID, df$DEV_NAME),
             clusterOptions = markerClusterOptions())
             
m  # Print the map
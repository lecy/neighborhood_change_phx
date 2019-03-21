Rules for creating the crosswalk

1. If a tract-id was split from xxxx-00 to xxxx-01 and xxxx-02 then asssign xxxx-00 to both.
2. If a tract-id was split from xxxx-08 to xxxx-08 and xxxx-09 then assign xxxx-08 to both.

Basically you need to assign 1990 data from the combined tract to all of the new tracts. 



These files were created as follows:

```r
library( dplyr )
library( geojsonio )
library( sp )

url <- "https://raw.githubusercontent.com/lecy/neighborhood_change_phx/master/shapefiles/county.geojson"
phx <- geojson_read( url, method = "local", what="sp" )

dat <- read.csv( "https://raw.githubusercontent.com/lecy/neighborhood_change_phx/master/data/1990_race_data.csv", 
                  stringsAsFactors=F, colClasses="character"  )

geoid <- paste0( dat$state, dat$county, dat$tract )



crosswalk <- phx@data[ c("STATEFP00", "COUNTYFP00", "TRACTCE00","X") ]
crosswalk$X <- is.na(crosswalk$X)

crosswalk$TRACT4 <- substr( crosswalk$TRACTCE00, 1, 4 )
crosswalk$TRACT2 <- substr( crosswalk$TRACTCE00, 5, 6 )
crosswalk$GEOID_1990 <- crosswalk$TRACTCE00
crosswalk$GEOID_1990[ is.na(phx@data$X) ] <- NA

crosswalk <- crosswalk[c("STATEFP00", "COUNTYFP00", "TRACT4", "TRACT2", "X", 
"TRACTCE00","GEOID_1990")]

names(crosswalk) <- 
c("STATEFP00", "COUNTYFP00", "TRACT4", "TRACT2", 
  "MISSING", "TRACTCE00", "GEOID_1990")

crosswalk <- arrange( crosswalk, TRACT4, TRACT2 )
write.csv( crosswalk, "Tract-Crosswalk-1990-to-2010.csv", row.names=F )

these <- setdiff( dat$geoid, phx$CTIDFP00  )
void.1990 <- data.frame( GEOID=these, TRACT4=substr(these,6,9), TRACT2=substr(these,10,11) )
write.csv( void.1990, "Void-1990-Tract-IDs.csv", row.names=F )


these <- intersect( dat$geoid, phx$CTIDFP00  )
active.1990 <- data.frame( GEOID=these, TRACT4=substr(these,6,9), TRACT2=substr(these,10,11) )
write.csv( active.1990, "Valid-1990-Tract-IDs.csv", row.names=F )
```

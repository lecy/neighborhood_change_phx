
# Shapefiles Folder

This folder contains the shapefiles used for this project, the GeoJsons created as a part of this project, and the Zipped files of other shapefiles that were not used in this project but could be used in future analyses dependent on the year being analyzed.

# Helpful Code

## Load GeoJSON Shapefile From GitHub

Once GeoJson files are created, they can be loaded directly from GitHub:

```r
library( geojsonio )
library( sp )
url <- "https://raw.githubusercontent.com/lecy/neighborhood_change_phx/master/shapefiles/phx.2010.tracts.geojson"
phx <- geojson_read( url, method="web", what="sp" )
plot( phx )
```

# Create geojson From Tiger Shapefile


## 2010 Tiger Shapefiles

Census tract shapefiles downloaded from https://www.census.gov/geo/maps-data/data/tiger-line.html on 2/26/19.


## Download Files

```r
### create a new directory for your data
dir.create( "shapefiles" )
setwd( "./shapefiles" )

### download TIGER shapefile from GitHub or Census
download.file( "https://github.com/lecy/neighborhood_change_phx/raw/master/shapefiles/tl_2010_04013_tract10.zip", 
"maricopa-az-census_tract10.zip" )
unzip( "maricopa-az-census_tract10.zip" )
file.remove( "maricopa-az-census_tract10.zip" )
dir()
```

## This command reads in the shapefile

```r
library( rgdal )
phx <- readOGR("tl_2010_04013_tract10.shp")
head( phx@data, 10)
plot( phx )
```


## Convert Projection

```r
proj4string( phx )
phx <- spTransform( phx, CRS("+proj=longlat +datum=WGS84") )
proj4string( phx )
```


## Add Data

```r
url <- "https://raw.githubusercontent.com/lecy/neighborhood_change_phx/master/data/phx.combined.data.csv"
dat <- read.csv( url, stringsAsFactors=F )

#Create GEOID of FIPS Code elements
phx$geoid2 <- paste0( "G", phx$STATEFP10, 
                     "0", phx$COUNTYFP10, "0", phx$TRACTCE10 )

# > head( phx$geoid2 )
# [1] "G0400130422644" "G0400130422643" "G0400130422642" "G0400130422641"


phx.shape.data <- merge(phx, phx.combined.data, by.x="geoid2", by.y="GISJOIN", all.x=T)


```


## Convert SP to GeoJson

```r
library(geojsonio)
geojson_write( phx.shape.data, file = "../shapefiles/phx.geojson" )
```

## Convert the shapefile to a data frame
```r
library(broom)
phx_fortified <- tidy( phx, region = "geoid2")
```

## Merge the data frame of the shapefile with the combined dataset
```r
phx.tidy <- merge( phx_fortified, phx.combined.data, by.x="id", by.y="GISJOIN", all.x=T)
```
## Use this dataframe for ggplot() maps

```r
asian_2000 <- ggplot( data = phx.tidy, 
               aes( x = long, y = lat, group = group, fill = Asian_2000 ) ) + 
  geom_polygon() +
  coord_map()


hispanic_1990 <- ggplot( data = phx.tidy, 
               aes( x = long, y = lat, 
                    group = group, 
                    fill = Hispanic.Latino1990 ) ) + 
                geom_polygon() +
               coord_map() +
               scale_fill_distiller(palette="Set3", direction=1,
                                    name="Population") +
     labs(title="Hispanic/Latino1990 
     Population in Maricopa County", title.cex=.75, 
     caption="1990 Source: US Census, NHGIS")
  ```

## The resource that I used for this.

https://blog.exploratory.io/creating-geojson-out-of-shapefile-in-r-40bc0005857d


## This is to convert the county shapefile from sf to sp

```r
sp_mcpa <- fortify( phx )
```


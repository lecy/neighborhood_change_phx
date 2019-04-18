
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
url <- "https://raw.githubusercontent.com/lecy/neighborhood_change_phx/master/data/raw/NHGIS_geog_data.csv"
dat <- read.csv( url, stringsAsFactors=F )

#Create GEOID of FIPS Code elements
phx$geoid <- paste0( "G", phx$STATEFP10, "0", phx$COUNTYFP10, "0", phx$TRACTCE10 )

# > head( phx$geoid )
# [1] "G0400130422644" "G0400130422643" "G0400130422642" "G0400130422641"

phx <- merge( phx, dat, by.x="geoid", by.y="GISJOIN", all.x=T )
```


## Convert SP to GeoJson

```r
library(geojsonio)
geojson_write( phx, file = "phx.2010.tracts.geojson" )
```






## The resource that I used for this.

https://blog.exploratory.io/creating-geojson-out-of-shapefile-in-r-40bc0005857d


## This is to convert the county shapefile from sf to sp

```r
sp_mcpa <- fortify( phx )
```


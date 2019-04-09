
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
phx <- readOGR("tl_2010_04013_tract10/tl_2010_04013_tract10.shp")
head( phx@data, 10)
plot( phx )
```




# Convert SP to GeoJson

```r
library(geojsonio)
phx_json <- geojson_json( phx )
```

This command creates a json geofeaturecollection

```r
## Writing to geojson format
geojson_write( phx_json, file = "phx.geojson" )
```

## This is to convert the county shapefile from sf to sp

```r
sp_mcpa <- fortify( phx )
```


## Load GeoJson From GitHub

Once GeoJson files are created, they can be loaded directly from GitHub:

```r
library(geojsonio)
phx <- read( ...raw geojson file url... )
```


## The resource that I used for this.

https://blog.exploratory.io/creating-geojson-out-of-shapefile-in-r-40bc0005857d



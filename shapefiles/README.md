
## Load From GitHub

```r
library( rgdal )

phx <- read( ... )


```
# To Convert

```r
library(rgdal)
library(geojsonio)
```

## 2010 Tiger Shapefiles

Census tract shapefiles downloaded from https://www.census.gov/geo/maps-data/data/tiger-line.html on 2/26/19.

## This command reads in the shapefile

```r
county <- readOGR("tl_2010_04013_tract00/tl_2010_04013_tract00.shp")
head(county@data, 10)
```

## This command creates a json geofeaturecollection
```r
county_json <- geojson_json(county)
```

## Writing to geojson format

```r
geojson_write(county_json, file = "/Users/aggal/Desktop/Capstone/Maps/shapefiles/2010/county.geojson")
```

## The resource that I used for this.

https://blog.exploratory.io/creating-geojson-out-of-shapefile-in-r-40bc0005857d

## This is to convert the county shapefile from sf to sp

```r
sp_mcpa <- fortify(county)
```

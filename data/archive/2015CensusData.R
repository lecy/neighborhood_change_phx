library(censusapi)

censuskey <- "20f2773e863a33466e0fbace2116919a1c67e4a5"

library(devtools)

devtools::install_github("hrecht/censusapi")

vars2015 <- listCensusMetadata(name= "acs/acs5", vintage=2015, "v")

head(vars2015)

write.csv( vars2015, "2015ACS5DataDictionary.csv", row.names=F)

vars.2015 <-read.csv( file="C:/Users/aehende1/Desktop/Capstone/DataProfile_2015edited.csv", header=TRUE, sep=",")

vars.2015.list.geo <- vars.2015$name

dat.2015 <- getCensus(name= "acs/acs5", vintage= 2015, key=censuskey, vars=vars.2015.list, 
region="tract:*", regionin="state:04+county:013") 

*Add back in GEO_ID to all variable lists*

write.csv( dat.2015, "2015ACS5Data.csv", row.names=F)

test2015 <- get_acs(geography= "tract", variables= vars.2015.list, 
year=2015, state="04", geometry=TRUE, key=censuskey)


setdiff( PUT 2000 DATA HERE, dat.2010$tract)

setdiff( dat.2010$tract, PUT 2000 DATA HERE)


dir.create("test_vars")
setwd("test_vars")

for( i in 1:length( vars.2015.list))
{ 
var.name <- vars.2015.list[i]
var.i <- getCensus( key=censuskey, name="acs/acs5", vintage=2015, vars=var.name, 
region="tract:*", regionin="state:04+county:013")
write.csv(x=var.i, file=paste0(var.name,".csv", row.names=FALSE) )
}

var.i <- getCensus( key=censuskey, name="acs/acs5", 
                    vintage=2015, vars="B01001_001E", 
                    region="tract:*", 
                    regionin="state:04+county:013" )

var.i


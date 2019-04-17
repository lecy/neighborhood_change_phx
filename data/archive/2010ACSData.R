library(censusapi)
library(tidyverse)
library(tidycensus)
library(viridis)

censuskey <- "20f2773e863a33466e0fbace2116919a1c67e4a5"

library(devtools)

devtools::install_github("hrecht/censusapi")

vars2010 <- listCensusMetadata(name= "acs/acs5", vintage=2010, "v")


geo2010 <- listCensusMetadata(name= "acs/acs5", vintage=2010, "g")

head(vars2010)

write.csv( vars2010, "2010ACS5DataDictionary.csv", row.names=F)

vars.2010 <-read.csv( file="C:/Users/aehende1/Desktop/Capstone/Variable_Lists/2010ACS5DataDictionary.csv", header=TRUE, sep=",")

vars.2010.list <- vars.2010$name

dat.2010 <- getCensus(name= "acs/acs5", vintage= 2010, key=censuskey,
 vars=vars.2010.list, region="tract:*", regionin="state:04+county:013") 

write.csv( dat.2010, "2010ACS5Data.csv", row.names=F)

test <- get_acs(geography= "tract", variables= vars.2010.list, 
year=2010, state="04", geometry=TRUE, key=censuskey)


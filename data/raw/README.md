This folder contains the raw data originally downloaded for this project.

None of the data is renamed or manipulated.

This is the data used in the analysis of this project.

The data files include:

ACS 5 Meta data 2010 downloaded 3/24/19 through the Census API using the censusapi package

```{r}
library(censusapi)
censuskey <- "YOUR CENSUS KEY HERE"
library(devtools)
devtools::install_github("hrecht/censusapi")
Metadata2010 <- listCensusMetadata(name = "acs5", vintage=2010, "v")
write.csv(Metadata2010, "..ACS2010_Metadata", row.names=T)
```

ACS 5 Meta data 2015 downloaded 3/24/19 through the Census API using the censusapi package
```{r}
library(censusapi)
censuskey <- "YOUR CENSUS KEY HERE"
library(devtools)
devtools::install_github("hrecht/censusapi")
Metadata2015 <- listCensusMetadata(name = "acs5", vintage=2015, "v")
write.csv(Metadata2015, "..ACS2015_Metadata", row.names=T)
```

NHGIS time series tables 1990-2010 downloaded 4/5/19 using the IPUMS NHGIS website with the help of the How To Use the Data Finder document included in this folder

Website to download IPUMS NHGIS data:
https://data2.nhgis.org/main

NHGIS nominal data file (not used in this project as could not be consistently maintained over time) downloaded 4/5/19

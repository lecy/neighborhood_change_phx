# Project Data

Here is the documentation for the data folder.

This project uses two primary sources for data: the Census API for 2015 data and select 2010 data, and the NHGIS time series data tables for 1990, 2000, and select 2010 data.

The Census API data was downloaded in February and March 2019 through the Census API package in R.

The NHGIS time series data tables were downloaded in April 2019 through https://www.nhgis.org/

All of the data is available in this folder- including raw data files that were not used for this project.

### The sub-folders include:

* Archive- all data files and R Markdown files that were not used in the final project

* Raw- all raw data files, excluding shapefiles

* Crosswalk- all crosswalk data

* Variable_lists- lists of variable names saved as .csv files to allow for Census API data downloads

### The files in this folder include:

* NHGIS_data_rename.csv- this csv file is the renamed variables for the NHGIS data

* NHGIS-data_rename1- this is a data rename file as well

* Phx_data.Rmd- this is the R Markdown that includes all necessary data renames, combinations, altercations, and static map build outs using ACS 5 and NHGIS time series data

* Phx_data.html- this is an html version of the Phx_data.Rmd

* ethnicity.dashboard.dat.2.csv- this is the data file used in the Ethnicity tab of the Capstone Dashboard
* income.dashboard.dat.2.csv- this is the data file used in the Income tab of the Capstone Dashboard
* phx.combined.data.csv- this csv is a full data set of all data collected in this project from ACS and NHGIS, as well as shapefile data
* phx.dat.csv- this is the data for this project from ACS and NHGIS without shapefile data
* phx.geojson - this is the GeoJson of the phx.combined.dat.csv file
* phx.variable.name.crosswalk.2.csv- this is the crosswalk of variable names from ACS 5 and NHGIS data used in this project
* race.dashboard.dat.2.csv- this is the data file used in the Race tab of the Capstone Dashboard
* tidy.dashboard.dat.csv- this is the data file used in the Dataset tab of the Capstone Dashboard
* total.dat.2.csv- this is the data file used in the Total tab of the Capstone Dashboard pulled from Phoenix.gov
* vacancy.dashboard.dat.2.csv- this is the data file used in the Vacancy tab of the Capstone Dashboard* 

## Build Project Database

The file named "Phx_data.Rmd" contains all of the data steps to combine raw files into the file named "". 

[Data Steps](https://lecy.github.io/neighborhood_change_phx/data-steps.html)  


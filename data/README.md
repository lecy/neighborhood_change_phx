# Project Data

Here is the documentation for the data folder.

This project uses two primary sources for data: the Census API for 2015 data and select 2010 data, and the NHGIS time series data tables for 1990, 2000, and select 2010 data.

The Census API data was downloaded in February and March 2019 through the Census API package in R.

The NHGIS time series data tables were downloaded in April 2019 through https://www.nhgis.org/

All of the data is available in this folder- including raw data files that were not used for this project.

The sub-folders include:

Archive- all data files and R Markdown files that were not used in the final project

Raw- all raw data files, excluding shapefiles

Crosswalk- all crosswalk data

Variable_lists- lists of variable names saved as .csv files to allow for Census API data downloads

The files in this folder include:

Phx_data- this is the R Markdown that includes all necessary data renames, combinations, altercations, and static map build outs using ACS 5 and NHGIS time series data

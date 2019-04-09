# Criteria for a Successful Project

The project will be evaluated based upon general project management principles outlined here:

[Code and Data for the Social Sciences: A Practitioner’s Guide](https://web.stanford.edu/~gentzkow/research/CodeAndData.pdf)

I would split hairs with the authors about whether the project should be fully-executable with a single script. I would instead insist that each step should be fully-executable (building the census dataset, building shapefiles + data, launching a shiny app, etc.). 

Focus on the following criteria:

1. Document all of your raw data sources and archives the raw data file you downloaded during the project (in case something changes - you can then determine if the data from the provider has changed or if your code changed) and the location of current data files for people to build on your work.  
2. Documentation of all data "assets" like census variable crosswalks, census tract harmonization files, neighborhood shapefiles, etc. How were these obtained or created, and how were they used in your project?   
3. All data steps that were conducted to combine and enrich your data files to create the research datasets used in your analysis. Make sure that each file can be re-created by the end user from files available on GitHub (or archived elsewhere like Dataverse if files are too big to upload to GitHub). For example, you should use relative file references (folders versus personal directory structures), or read data and shapefiles directly from GitHub when possible so the code is easy for anyone to run.   
4. Well-organized folders that separate each aspect of your project (data, shapefiles, shiny apps, etc.). Document everything using the README.md files in the GitHub folders.   
5. A project file that describes the purpose of the project and all steps at a high-level so that someone unfamiliar with the project can understand the process (what data was used, how was the database built, how was analysis conducted, etc.). It is best to use a GitHub site page for this so that you can easily link to all relevant documents, data, and code. 

In other words, you are being graded primarily on your project management skills more than insights you generate from the analysis. 

Practially speaking, can you create a project as an employee that you can hand off to your replacement and they can pick up the work from where you left off? Or can you build a useful project that others in your organization can easily leverage because it is well-documented and steps are easy to replicate? 

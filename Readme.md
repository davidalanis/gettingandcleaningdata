Getting and Cleaning Data Course Project
========================================================

Instructions at Coursera:

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#How does it works.
1. Download the data source, unzip it, it should be have the parent directory  ```UCI HAR Dataset``` in it.
2. Get the script ```run_analysis.R``` at  `UCI HAR Dataset` directory, then set it as your working directory using ```setwd()``` function in RStudio.
3. Run ```source("run_analysis.R")```, to generate ```clean_data.txt```,

## Libraries Needed 

```run_analysis.R``` needs  ```reshape2``` and ```data.table``` library, you should install them and load them. 
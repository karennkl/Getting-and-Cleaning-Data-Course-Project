#Getting and Cleaning Data-Course Project

This repository hosts the R code and documentation files required for the Data Science's track course "Getting and Cleaning Data", available in Coursera.

The dataset being used is: Human Activity Recognition Using Smartphones , downloaded from
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Files
1. CodeBook.md describes the variables, the data, and any transformations or work that was performed to clean up the data.
2. run_analysis.R contains all the code to perform the analyses described as follow 
  1. Download the dataset if it does not already exist in the working directory
  2. Load the activity and feature info
  3. Load both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
  4. Load the activity and subject data for each dataset, and merges those columns with the dataset
  5. Merge the two datasets
  6. Convert the activity and subject columns into factors
  7. Create a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
3. The output of this Project is shown in the file tidydata.txt

# Code Book
This code book summarizes the resulting data fields in tidyData.csv.

## Introduction
tidyData.csv showcases summary for 30 volunteers who have performed 6 different activities captured by wearable computing 

## File Description
The dataset includes the following file:
  * activity_labels.txt: Names and IDs for each of the 6 activities.
  * features.txt: Names of the 561 features
  * features_info.txt: Shows information about the variables used on the feature vector.
  * subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.
  * X_test.txt: Test set. 2947 observations of the 561 features, for 9 of the 30 volunteers 
  * y_test.txt: Test labels. A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.
  * subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
  * X_train.txt: Training set.7352 observations of the 561 features, for 21 of the 30 volunteers.
  * y_train.txt: Training labels. A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.

This analysis was performed using only the files above, and did not use the raw signal data. 

## Processing Steps
  1. All relevant data files were read into data frames and column headers were assigned.
  2. Both training and test sets were combined into a single data set.
  3. All feature columns that did not contain the exact string "mean()" or "std()" were removed. 
  4. The activity column was converted from a integer to a factor, using labels describing the activities.
  5. A tidy data set was created containing the mean of each feature for each subject and each activity. 
  6. The tidy data set was output to a CSV file.

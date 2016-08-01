# runAnalysis.r File Description

# 1. Merge the training and the test sets to create one data set.
library(reshape2)
# setwd to the location where the Dataset was unzipped
setwd ("C:/Users/OECU2014/Karen/Karen/Coursera/GettingandCleaningData")

# Read data into data frames
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
yTest <- read.table("./UCI HAR Dataset/test/Y_test.txt")

# Assign column names for subject files
colnames(subjectTrain) <- "subjectId"
colnames(subjectTest) <- "subjectId"

# Assign column names for measurements files
features <- read.table("./UCI HAR Dataset/features.txt")
colnames(xTrain) <- features[,2]
colnames(xTest) <- features[,2]

# Assign column names for label files
colnames(yTrain) <-"activityId"
colnames(yTest) <-"activityId"

# Combine files into 1 dataset
train <-cbind(subjectTrain,yTrain,xTrain)
test <-cbind(subjectTest, yTest ,xTest)
finalData <- rbind(train,test)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
meanstdcols <- grep("mean\\(\\)", names(finalData)) |  grep("std\\(\\)", names(finalData))

# remove unnecessary columns
meanstdcols[1:2] <- TRUE
finalData <- finalData[,meanstdcols]

# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# Merge finalData with acitivityType to include descriptive activity names
finalData$activityId <- factor (finalData$activityId, labels=c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
melted <- melt(finalData, id=c("subjectId", "activityId"))
tidyData <- dcast(melted, subjectId+activityId ~variable,mean)

# Export the tidyData set 
write.csv(tidyData, "tidyData.csv",row.names=FALSE)

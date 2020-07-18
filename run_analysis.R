
# # Final project of course: Getting and Cleaning data (COURSERA)

#
#
#
#
#### Step 1: 
# The dataset is downloaded and the working directory is created.
#
# # load libraries:
#
library(data.table); library(dplyr)
#
# # Download the dataset and the working directory is created:
#
if(!file.exists("./Final-GCData")){dir.create("./Final-GCData")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./Final-GCData/ProjectDataset.zip")
#
#
# # Unzip the .zip file:
# 
unzip(zipfile = "./Final-GCData/ProjectDataset.zip", exdir = "./Final-GCData")
#
#
#
# # # Cleaning the dataset
#
#
# 
#### Step 2: 
# The 'training' and 'test' sets will be merged to create a new data set.
#
#
# Reading files:
#
#
# Reading feature:
#
features <- read.table("./Final-GCData/UCI HAR Dataset/features.txt", 
                       col.names = c("ID","App"))
#
# Reading activity labels:
#
actLabels <- read.table("./Final-GCData/UCI HAR Dataset/activity_labels.txt", 
                        col.names = c("Cod","Activity"))
#
#
#
# Reading training data:
#
Xtrain <- read.table("./Final-GCData/UCI HAR Dataset/train/X_train.txt", 
                     col.names = features$App)                                  # Training set
Ytrain <- read.table("./Final-GCData/UCI HAR Dataset/train/y_train.txt",
                     col.names = "Cod")                                          # Training labels
#
# Reading test data:
#
Xtest <- read.table("./Final-GCData/UCI HAR Dataset/test/X_test.txt",
                    col.names = features$App)                                   # Test set
Ytest <- read.table("./Final-GCData/UCI HAR Dataset/test/y_test.txt",
                    col.names = "Cod")                                           # Test labels             
#
# Reading Subject:
#
subTrain <- read.table("./Final-GCData/UCI HAR Dataset/train/subject_train.txt",
                       col.names = "Subject")
subTest <- read.table("./Final-GCData/UCI HAR Dataset/test/subject_test.txt",
                      col.names = "Subject")
#
#
#
#
# # Merged datasets:
#
#
Xdata <- rbind(Xtrain, Xtest)
Ydata <- rbind(Ytrain, Ytest)
Sub <- rbind(subTrain, subTest)
#
Merged <- cbind(Sub, Ydata, Xdata)
#
#
#
#### Step 3: 
# Extract the mean and standard deviation measurements for each measurement.
#
#
selectData <- select(Merged, Subject, Cod, contains("mean"), contains("std"))
#
#
#
#
#### Step 4: 
# Use descriptive activity names to name the activities in the dataset.
#
#
#
selectData$Cod <- actLabels[selectData$Cod, 2]
#
#
#### Step 5:
# Rename appropriately the data set with descriptive variable names.
#
#
names(selectData)[2] <- "Activity"
names(selectData) <- gsub("Acc", "Accelerometer", names(selectData))
names(selectData) <- gsub("Gyro", "Gyroscope", names(selectData))
names(selectData) <- gsub("BodyBody", "Body", names(selectData))
names(selectData) <- gsub("Mag", "Magnitude", names(selectData))
names(selectData) <- gsub("^t", "Time", names(selectData))
names(selectData) <- gsub("^f", "Frequency", names(selectData))
names(selectData) <- gsub("tBody", "TimeBody", names(selectData))
names(selectData) <- gsub("-mean()", "MEAN", names(selectData)
                          , ignore.case = TRUE)
names(selectData) <- gsub("-std()", "STD", names(selectData)
                          , ignore.case = TRUE)
names(selectData) <- gsub("-freq()", "Frequency", names(selectData)
                          , ignore.case = TRUE)
names(selectData) <- gsub("angle", "Angle", names(selectData))
names(selectData) <- gsub("gravity", "Gravity", names(selectData))
#
#
#
#
#### Step 6:
# Create a second ordered data set with the average of each variable for each activity and each subject.
#
#
#
#
TidyDataset <-  group_by(selectData, Subject, Activity) %>% summarise_all(funs(mean))
#
#
write.table(TidyDataset, "TidyDataset.txt", row.name=FALSE)
#
#
#
#
#
#
### END
#
#

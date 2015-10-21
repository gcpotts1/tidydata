## run_analysis.R
## Getting and Cleaning Data Course Project
## Greg Potts

#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl, destfile = "./Dataset.zip")
#dateDownloaded <- date()
#unzip("./Dataset.zip", overwrite = FALSE)

library(dplyr)
library(reshape2)
setwd("./UCI HAR Dataset")
features <- read.table("./features.txt", colClasses = "character")

## Read in the labels and data files. Combine the labels and data into one data frame.

## Read in the training activity labels
trainLabels <- read.table("./train/y_train.txt", col.names="Activity")

## Change the labels from numbers to the activity
activity_labels <- read.table("./activity_labels.txt")
## I started with the for loop and if statements below before finding the concise code
## below in the Discussion Forum
trainLabels$Activity <- activity_labels$V2[trainLabels$Activity]
#for(i in 1:7352) {
#        if(trainLabels[i,1]==1) {
#                trainLabels[i,1] <- "WALKING"
#        }
#        if(trainLabels[i,1]==2) {
#                trainLabels[i,1] <- "WALKING_UPSTAIRS"
#        }
#        if(trainLabels[i,1]==3) {
#                trainLabels[i,1] <- "WALKING_DOWNSTAIRS"
#        }
#        if(trainLabels[i,1]==4) {
#                trainLabels[i,1] <- "SITTING"
#        }
#        if(trainLabels[i,1]==5) {
#                trainLabels[i,1] <- "STANDING"
#        }
#        if(trainLabels[i,1]==6) {
#                trainLabels[i,1] <- "LAYING"
#        }
#}

## Read in the training subjects and data
trainSubject <- read.table("./train/subject_train.txt", col.names="Subject")
trainData <- read.table("./train/X_train.txt")

## Create one dataframe for all of the training data
train <- cbind(trainSubject, trainLabels, trainData)

## Read in the test activity labels
testLabels <- read.table("./test/y_test.txt", col.names="Activity")

## Change the labels from numbers to the activity
testLabels$Activity <- activity_labels$V2[testLabels$Activity]
#for(i in 1:2947) {
#        if(testLabels[i,1]==1) {
#                testLabels[i,1] <- "WALKING"
#        }
#        if(testLabels[i,1]==2) {
#                testLabels[i,1] <- "WALKING_UPSTAIRS"
#        }
#        if(testLabels[i,1]==3) {
#                testLabels[i,1] <- "WALKING_DOWNSTAIRS"
#        }
#        if(testLabels[i,1]==4) {
#                testLabels[i,1] <- "SITTING"
#        }
#        if(testLabels[i,1]==5) {
#                testLabels[i,1] <- "STANDING"
#        }
#        if(testLabels[i,1]==6) {
#                testLabels[i,1] <- "LAYING"
#        }
#}

## Read in the test subjects and data
testSubject <- read.table("./test/subject_test.txt", col.names="Subject")
testData <- read.table("./test/X_test.txt")

## Create one dataframe for all of the test data
test <- cbind(testSubject, testLabels, testData)

## Combine the training and test data sets into one Data Frame
combinedData <- rbind(train, test)

## Extract the columns with mean and std for each measurement
lmean <- grepl("mean", features[,2])
lstd <- grepl("std", features[,2])
lcombine <- lmean | lstd
colLabels <- c("Subject", "Activity")
meanstdData <- data.frame
meanstdData <- combinedData[,1:2]

## Generate column labels for the features and combine column bind a data frame
## for mean and std columns
for(i in 1:length(lcombine)) {
        if(lcombine[i]==1) {
                colLabels <- c(colLabels, features[i,2])
                meanstdData <- cbind(meanstdData, combinedData[,i+2])
        }
}

colLabels <- gsub("BodyBody", "Body", colLabels)
colnames(meanstdData) <- colLabels

## New tidy data set (Part5)
## Lists each feature as a single line for combinations of subject and activity
vars <- names(meanstdData[,3:81])
mstdMelt <- melt(meanstdData, id=c("Subject", "Activity"),measure.vars=vars)

## Recasts the data so that we have the average/mean for each subject & activity
actsubData <- dcast(mstdMelt, Activity + Subject ~ variable, mean)

setwd("./..")
write.table(actsubData, file="./actsubData.txt", row.names=FALSE)

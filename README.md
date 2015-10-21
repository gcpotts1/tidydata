Author: gcpotts1
Getting &amp; Cleaning Data Course Project
This course project required downloading a zip file from address:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The file was downloaded to my working directory and unzipped using the following commands.

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile = "./Dataset.zip")

dateDownloaded <- date()

unzip("./Dataset.zip", overwrite = FALSE)

At this point I explored the unzipped data and observed several files in the UCI HAR Dataset folder
as well as two more folders labeled test and train each containing additional files and one folder each.
I read the README.txt file, several times, using Notepad++. It became apparent that we have the building
blocks with:
* The variable names in features.txt for all of the measurements contained in X_train.txt and
X_test.txt
* The subject_train.txt and subject_test.txt files in the train and test folders contain a numeric
list of test subjects that is equivalent in length to the X_train.txt and X_test.txt files.
* The y_train.txt and y_test.txt files contain the numeric activity values that could be paired
with the file activity_labels.txt in the main directory
* The folders labeled Inertial_Signals in both the test and train folders were used to generate
the X_test and X_train data and I will not use them in this exercise.

## Step 1 - Merge the test and training data sets into one data set.
This was performed by multiple commands in the run_analysis.R file also contained in this folder. 
The approach I used was:
* Train Dataset
* First - read the activity labels using read.table
* Second - I chose to replace the numeric representation with the character name at this point
* Third - read the subject and X_train files again using read.table
NOTE: I provided a column name for the subject data at this point.
* Fourth - Using cbind, the data was bound in this order (Subject, Labels, Data)

## This same process was repeated for the test data. 
It was noted when exploring the various files that the train and test data are of different 
length or number of observations.  This is why I chose to combine the appropriate information
for training and test data separately and then used rbind to append the test data to the training
data. Now that I have one combined dataset I am ready for step 2.

## Step 2 - Extract only the measurements on the mean and standard deviation for each measurements
 This could be interpreted in different ways: Extract only those measurements that have both
a mean and standard deviation recorded which would not include the meanfrequency measurements.
I chose to keep the meanfrequency data during the extraction because it is always easier to
remove unnecessary data than to recreate or attempt to recall that information if it has
been removed but is needed.
The approach I used to extract the mean and std data is as follows:
* First - Using grep, I searched the features data for "mean" and "std"
and assigned the T/F result to values lmean and lstd respectively.
* Second - I then OR'd the results together to return a result that contained TRUE for
all of the data columns (561). NOTE: This does not yet include the Subject or Activity
columns so I started a data.frame called meanstdData and made the first two columns
the Subject and Activity columns from my combined data set from step 1 (combinedData).
* Third - Using a for loop, I then created a vector containing the column names
for mean and std while also using cbind to add the appropriate columns to the data.frame
meanstdData. This is accomplished by checking the combined T/F data from the first step,
and only appending the column name (from the features vector) and column data (from the combined
data set in Step 1).

## Step 3 - Uses descriptive activity names to name the activities in the data set
This was resolved in Step1 when I replaced the numeric representation of the
activities with the character name.

## Step 4 - Appropriately label the data set with descriptive variable names.
A vector with column names from the features vector was created during step 3 while
extracting on the mean and std data. I performed a minor clean of the labels using gsub
and then attached the labels to the data.frame meanstdData.

## Step 5 - From the data set in step 4, creates a second, independent tidy data set with the 
average of each variable for each activity and each subject.
Similar to the training in week3 of this course, I elected to melt the data set and then
recast using the dcast function. 
* First - Generate a vector (vars) that contains the names of the columns containing mean
and std deviation data. This will utilized in the melt function.
* Second - melt the combined data set containing on mean and std. We are interested in
the average by Subject and Activity so these will be the ID values and the variables
will be the vector vars from the previous step.
* Third - Use the function dcast to recast the data with the possible variations of
Activity + Subject in each row (tidy data principle that each different observation should be
in a different row). The average or mean of the corresponding features are listed by column
(tidy data principle that each variable measured should be in one column).

## Final Step
The command below was utilized to store the output of run_analysis.R in a text file
called actsubData.txt.
write.table(actsubData, file="./actsubData.txt", row.names=FALSE)
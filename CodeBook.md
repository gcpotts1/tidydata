---
title: "CodeBook.md"
author: "gcotts1"
date: "October 21, 2015"
output: html_document
---

# Study design
All processing of the zip files was performed in R-script run_analysis.R and documented in comments in the same file. Step by step descriptions are contained in the file README.MD.
The information below is from the original data collectors and included here for consistency and appropriate reference.
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

# The Data Dictionary below contains the desriptive column names for the output file from run_analysis.R. This also indcates the potential values of the output data.
# Data Dictionary - Time Domain
Subject		2
	The number corresponding to the test subject
	values = 1 - 30
	
Activity	
	The type of activity performed
	values = WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
	
tBodyAcc-mean()-X
	Mean Body Acceleration - X axis (time domain)
		values = -1 ... +1

tBodyAcc-mean()-Y
	Mean Body Acceleration - Y axis (time domain)
		values = -1 ... +1
		
tBodyAcc-mean()-Z
	Mean Body Acceleration - Z axis (time domain)
		values = -1 ... +1

tBodyAcc-std()-X
	Standard Deviation Body Acceleration - X axis (time domain)
		values = -1 ... +1
		
tBodyAcc-std()-Y
	Standard Deviation Body Acceleration - Y axis (time domain)
		values = -1 ... +1		

tBodyAcc-std()-Z
	Standard Deviation Body Acceleration - Z axis (time domain)
		values = -1 ... +1
		
tGravityAcc-mean()-X
	Mean Gravity Acceleration - X axis (time domain)
		values = -1 ... +1
		
tGravityAcc-mean()-Y
	Mean Gravity Acceleration - Y axis (time domain)
		values = -1 ... +1
		
tGravityAcc-mean()-Z
	Mean Gravity Acceleration - Z axis (time domain)
		values = -1 ... +1
		
tGravityAcc-std()-X
	Standard Deviation Gravity Acceleration - X axis (time domain)
		values = -1 ... +1
		
tGravityAcc-std()-Y
	Standard Deviation Gravity Acceleration - Y axis (time domain)
		values = -1 ... +1
		
tGravityAcc-std()-Z
	Standard Deviation Gravity Acceleration - Z axis (time domain)
		values = -1 ... +1
		
tBodyAccJerk-mean()-X
	Mean Body Acceleration Jerk - X axis (time domain)
		values = -1 ... +1
		
tBodyAccJerk-mean()-Y
	Mean Body Acceleration Jerk - Y axis (time domain)
		values = -1 ... +1
		
tBodyAccJerk-mean()-Z
	Mean Body Acceleration Jerk - Z axis (time domain)
		values = -1 ... +1
		
tBodyAccJerk-std()-X
	Standard Deviation Body Acceleration Jerk - X axis (time domain)
		values = -1 ... +1
		
tBodyAccJerk-std()-Y
	Standard Deviation Body Acceleration Jerk - Y axis (time domain)
		values = -1 ... +1
		
tBodyAccJerk-std()-Z
	Standard Deviation Body Acceleration Jerk - Z axis (time domain)
		values = -1 ... +1
		
tBodyGyro-mean()-X
	Mean Body Gyroscope - X axis (time domain)
		values = -1 ... +1
		
tBodyGyro-mean()-Y
	Mean Body Gyroscope - Y axis (time domain)
		values = -1 ... +1
		
tBodyGyro-mean()-Z
	Mean Body Gyroscope - Z axis (time domain)
		values = -1 ... +1
		
tBodyGyro-std()-X
	Standard Deviation Body Gyroscope - X axis (time domain)
		values = -1 ... +1
		
tBodyGyro-std()-Y
	Standard Deviation Body Gyroscope - Y axis (time domain)
		values = -1 ... +1
		
tBodyGyro-std()-Z
	Standard Deviation Body Gyroscope - Z axis (time domain)
		values = -1 ... +1
		
tBodyGyroJerk-mean()-X
	Mean Body Gyroscope Jerk - X axis (time domain)
		values = -1 ... +1
		
tBodyGyroJerk-mean()-Y
	Mean Body Gyroscope Jerk - Y axis (time domain)
		values = -1 ... +1
		
tBodyGyroJerk-mean()-Z
	Mean Body Gyroscope Jerk - Z axis (time domain)
		values = -1 ... +1
		
tBodyGyroJerk-std()-X
	Standard Deviation Body Gyroscope Jerk - X axis (time domain)
		values = -1 ... +1
		
tBodyGyroJerk-std()-Y
	Standard Deviation Body Gyroscope Jerk - Y axis (time domain)
		values = -1 ... +1
		
tBodyGyroJerk-std()-Z
	Standard Deviation Body Gyroscope Jerk - Z axis (time domain)
		values = -1 ... +1
		
tBodyAccMag-mean()
	Mean Body Acceleration Magnitude (time domain)
		values = -1 ... +1
		
tBodyAccMag-std()
	Standard Deviation Body Acceleration Magnitude (time domain)
		values = -1 ... +1
		
tGravityAccMag-mean()
	Mean Gravity Acceleration Magnitude (time domain)
		values = -1 ... +1
		
tGravityAccMag-std()
	Standard Deviation Gravity Acceleration Magnitude (time domain)
		values = -1 ... +1
		
tBodyAccJerkMag-mean()
	Mean Body Acceleration Jerk Magnitude (time domain)
		values = -1 ... +1
		
tBodyAccJerkMag-std()
	Standard Deviation Body Acceleration Jerk Magnitude (time domain)
		values = -1 ... +1
		
tBodyGyroMag-mean()
	Mean Body Gyroscope Magnitude (time domain)
		values = -1 ... +1
		
tBodyGyroMag-std()
	Standard Deviation Body Gyrscope Magnitude (time domain)
		values = -1 ... +1
		
tBodyGyroJerkMag-mean()
	Mean Body Gyroscope Jerk Magnitude (time domain)
		values = -1 ... +1
		
tBodyGyroJerkMag-std()
	Standard Deviation Body Gyroscope Jerk Magnitude (time domain)
		values = -1 ... +1
		
		
		
#Data Dictionary - Frequency Domain
fBodyAcc-mean()-X
	Mean Body Accelerometer - X axis (frequency domain)
		values = -1 ... +1
		
fBodyAcc-mean()-Y
	Mean Body Accelerometer - Y axis (frequency domain)
		values = -1 ... +1
		
fBodyAcc-mean()-Z
	Mean Body Accelerometer - Z axis (frequency domain)
		values = -1 ... +1
		
fBodyAcc-std()-X
	Standard Deviation Body Accelerometer - X axis (frequency domain)
		values = -1 ... +1
		
fBodyAcc-std()-Y
	Standard Deviation Body Accelerometer - Y axis (frequency domain)
		values = -1 ... +1
		
fBodyAcc-std()-Z
	Standard Deviation Body Accelerometer - Z axis (frequency domain)
		values = -1 ... +1
		
fBodyAcc-meanFreq()-X
	Mean Frequency Body Accelerometer - X axis (frequency domain)
		values = -1 ... +1
		
fBodyAcc-meanFreq()-Y
	Mean Frequency Body Accelerometer - Y axis (frequency domain)
		values = -1 ... +1
		
fBodyAcc-meanFreq()-Z
	Mean Frequency Body Accelerometer - Z axis (frequency domain)
		values = -1 ... +1
		
fBodyAccJerk-mean()-X
	Mean Body Accelerometer Jerk - X axis (frequency domain)
		values = -1 ... +1
		
fBodyAccJerk-mean()-Y
	Mean Body Accelerometer Jerk - Y axis (frequency domain)
		values = -1 ... +1
		
fBodyAccJerk-mean()-Z
	Mean Body Accelerometer Jerk - Z axis (frequency domain)
		values = -1 ... +1
		
fBodyAccJerk-std()-X
	Standard Deviation Body Accelerometer Jerk - X axis (frequency domain)
		values = -1 ... +1
		
fBodyAccJerk-std()-Y
	Standard Deviation Body Accelerometer Jerk - Y axis (frequency domain)
		values = -1 ... +1
		
fBodyAccJerk-std()-Z
	Standard Deviation Body Accelerometer Jerk - Z axis (frequency domain)
		values = -1 ... +1
		
fBodyAccJerk-meanFreq()-X
	Mean Frequency Body Accelerometer Jerk - X axis (frequency domain)
		values = -1 ... +1
		
fBodyAccJerk-meanFreq()-Y
	Mean Frequency Body Accelerometer Jerk - Y axis (frequency domain)
		values = -1 ... +1
		
fBodyAccJerk-meanFreq()-Z
	Mean Frequency Body Accelerometer Jerk - Z axis (frequency domain)
		values = -1 ... +1
		
fBodyGyro-mean()-X
	Mean Body Gyroscope - X axis (frequency domain)
		values = -1 ... +1
		
fBodyGyro-mean()-Y
	Mean Body Gyroscope - Y axis (frequency domain)
		values = -1 ... +1
		
fBodyGyro-mean()-Z
	Mean Body Gyroscope - Z axis (frequency domain)
		values = -1 ... +1
		
fBodyGyro-std()-X
	Standard Deviation Body Gyroscope - X axis (frequency domain)
		values = -1 ... +1
		
fBodyGyro-std()-Y
	Standard Deviation Body Gyroscope - Y axis (frequency domain)
		values = -1 ... +1
		
fBodyGyro-std()-Z
	Standard Deviation Body Gyroscope - Z axis (frequency domain)
		values = -1 ... +1
		
fBodyGyro-meanFreq()-X
	Mean Frequency Body Gyroscope - X axis (frequency domain)
		values = -1 ... +1
		
fBodyGyro-meanFreq()-Y
	Mean Frequency Body Gyroscope - Y axis (frequency domain)
		values = -1 ... +1
		
fBodyGyro-meanFreq()-Z
	Mean Frequency Body Gyroscope - Z axis (frequency domain)
		values = -1 ... +1
		
fBodyAccMag-mean()
	Mean Body Accelerometer Magnitude (frequency domain)
		values = -1 ... +1
		
fBodyAccMag-std()
	Standard Deviation Body Accelerometer Magnitude (frequency domain)
		values = -1 ... +1
		
fBodyAccMag-meanFreq()
	Mean Frequncy Body Accelerometer Magnitude (frequency domain)
		values = -1 ... +1
		
fBodyAccJerkMag-mean()
	Mean Body Accelerometer Jerk Magnitude (frequency domain)
		values = -1 ... +1
		
fBodyAccJerkMag-std()
	Standard Deviation Body Accelerometer Jerk Magnitude (frequency domain)
		values = -1 ... +1
		
fBodyAccJerkMag-meanFreq()
	Mean Frequency Body Accelerometer Jerk Magnitude (frequency domain)
		values = -1 ... +1
		
fBodyGyroMag-mean()
	Mean Body Gyroscope Magnitude (frequency domain)
		values = -1 ... +1
		
fBodyGyroMag-std()
	Standard Deviation Body Gyroscope Magnitude (frequency domain)
		values = -1 ... +1
		
fBodyGyroMag-meanFreq()
	Mean Frequency Body Gyroscope Magnitude (frequency domain)
		values = -1 ... +1
		
fBodyGyroJerkMag-mean()
	Mean Body Gyroscope Jerk Magnitude (frequency domain)
		values = -1 ... +1
		
fBodyGyroJerkMag-std()
	Standard Deviation Body Gyroscope Jerk Magnitude (frequency domain)
		values = -1 ... +1
		
fBodyGyroJerkMag-meanFreq()
	Mean Frequency Body Gyroscope Jerk Magnitude (frequency domain)
		values = -1 ... +1
		

#Code Book

<br>
We give here a detailed explanation of the variables, the data, and the transformations performed by the script "run_analysis.R" provided in this repository to tidy the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

## The experiments
As described by the authors, the experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## The original data
The relevant data comes following the file structure

- "./train/X_train.txt": training data set. 
- "./train/subject_train.txt": sample of integers from 1 to 30 corresponding to the subject.
- "./train/y_train.txt": sample of integers from 1 to 6 corresponding to the activity performed.
- "./test/X_test.txt": test data set.
- "./test/subject_test.txt": sample of integers from 1 to 30 corresponding to the subject.
- "./test/y_test.txt": sample of integers from 1 to 6 corresponding to the activity performed.
- "./features.txt": list of variables measured/estimated for each observation.
- "./features_info.txt": Information about the variables measured/estimated for each observation.
- "./activity_labels.txt": list of actions describing the activity performed.

The training (test) data set contains 7351 (2946) observations of 561 variables. Each observation is coded by the subject (integer from 1 to 30), as found in each row of the files "subject_train.txt" and "subject_test.txt"; as well as by the activity (integer from 1 to 6), as found in each row of the files "y_train.txt" and "y_test.txt". Each of this latter integers have a 1-1 mapping to the labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) defined in the file "activity_labels.txt". Each observation contains space-separated values for the 561 variables defined in the file "features.txt" and explained in "features_info.txt".

## The features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals (and reported here) are  

- mean(): Mean value
- std(): Standard deviation

## The processed data

After applying the script, the tidy data contains the followings features:

- "subject": an integer from 1 to 30 representing the subject who performed the experiment.
- "activity": one of the strings: walking, walking_upstairs, walking_downstairs, sitting, standing, laying.

The following features take on numeric values. The units for Acc signals are m/s<sup>2</sup>, for the Gyro signals rad/s, for the AccJerk signals m/s<sup>3</sup>, and for the GyroJerk signals rad/s<sup>2</sup>.

- "tBodyAcc-mean()-X"
- "tBodyAcc-mean()-Y"
- "tBodyAcc-mean()-Z"
- "tBodyAcc-std()-X"
- "tBodyAcc-std()-Y"
- "tBodyAcc-std()-Z"
- "tGravityAcc-mean()-X"
- "tGravityAcc-mean()-Y"
- "tGravityAcc-mean()-Z"
- "tGravityAcc-std()-X"
- "tGravityAcc-std()-Y"
- "tGravityAcc-std()-Z"
- "tBodyAccJerk-mean()-X"
- "tBodyAccJerk-mean()-Y"
- "tBodyAccJerk-mean()-Z"
- "tBodyAccJerk-std()-X"
- "tBodyAccJerk-std()-Y"
- "tBodyAccJerk-std()-Z"
- "tBodyGyro-mean()-X"
- "tBodyGyro-mean()-Y"
- "tBodyGyro-mean()-Z"
- "tBodyGyro-std()-X"
- "tBodyGyro-std()-Y"
- "tBodyGyro-std()-Z"
- "tBodyGyroJerk-mean()-X"
- "tBodyGyroJerk-mean()-Y"
- "tBodyGyroJerk-mean()-Z"
- "tBodyGyroJerk-std()-X"
- "tBodyGyroJerk-std()-Y"
- "tBodyGyroJerk-std()-Z"
- "tBodyAccMag-mean()"
- "tBodyAccMag-std()"
- "tGravityAccMag-mean()"
- "tGravityAccMag-std()"
- "tBodyAccJerkMag-mean()"
- "tBodyAccJerkMag-std()"
- "tBodyGyroMag-mean()"
- "tBodyGyroMag-std()"
- "tBodyGyroJerkMag-mean()"
- "tBodyGyroJerkMag-std()"
- "fBodyAcc-mean()-X"
- "fBodyAcc-mean()-Y"
- "fBodyAcc-mean()-Z"
- "fBodyAcc-std()-X"
- "fBodyAcc-std()-Y"
- "fBodyAcc-std()-Z"
- "fBodyAccJerk-mean()-X"
- "fBodyAccJerk-mean()-Y"
- "fBodyAccJerk-mean()-Z"
- "fBodyAccJerk-std()-X"
- "fBodyAccJerk-std()-Y"
- "fBodyAccJerk-std()-Z"
- "fBodyGyro-mean()-X"
- "fBodyGyro-mean()-Y"
- "fBodyGyro-mean()-Z"
- "fBodyGyro-std()-X"
- "fBodyGyro-std()-Y"
- "fBodyGyro-std()-Z"
- "fBodyAccMag-mean()"
- "fBodyAccMag-std()"
- "fBodyBodyAccJerkMag-mean()"
- "fBodyBodyAccJerkMag-std()"
- "fBodyBodyGyroMag-mean()"
- "fBodyBodyGyroMag-std()"
- "fBodyBodyGyroJerkMag-mean()"
- "fBodyBodyGyroJerkMag-std()"


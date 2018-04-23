---
title: "Code Book"
output: html_document
---
<br><br>

We give here a detailed explanation of the variables, the data, and the transformations performed by the script "run_analysis.R" provided in this repository to tidy the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

## The experiments
As described by the authors, the experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## The data
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

## The analysis script

The script "run_analysis.R" is run from the directory "./" of the above tree. It defines a function called "process" which does the following task when called independently on the training and test data sets:

- It reads the data set ("train" or "test") as text and begings extracting the string corresponding to each observation.
- It parses each of these strings to extract the 561 variables defined in "features.txt".
- It creates a data frame "data_df" containing the extracted 561 variables as columns.
- It reads the files "subject_train.tx" or "subject_test.txt" to add a column to "data_df" corresponding to the subject performing the experiment.
- It reads the file "y_train.txt" or "y_test.txt" to add a column to "data_df" corresponding to the activity performed by the subject. It stores these activities as factor variables with the verbs defined in the file "activity_labels.txt"
- It returns "data_df"

The function "process" is applied on the the training and test data sets to create the data frames 
"train_df" and "test_df". The following steps are then executed:

- Merge "train_df" and "test_df" into "merged_data" by row binding.
- Create a new data frame "mean_std_data" from "merged_data" by selecting the columns (features) whose names match the regular expression "mean[^F]|std". This selects only the measurements on which mean() and std() has been applied, discarding names in which meanFreq() appears.
- Finally a data frame "average_data" is created from "mean_std_data" by grouping according to the columns "subject" and "activity" and summarizing all the remaining features by applying the mean function.


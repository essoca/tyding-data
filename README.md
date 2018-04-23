# README

<br>
In this repository, a script for tyding the data in the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) is provided, as per the requirements of the Johns Hopkins Data Science Specialization. The files included are:

"CodeBook.md":

Gives a detailed explanation of the variables, the data, and the transformations performed by the script to tidy the data set. 

"run_analysis.R":  

Main script of this project. In summary, it does the following tasks:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set.
- Appropriately labels the data set with descriptive variable names.
- Generates a tidy data set with the average of each variable for each activity and each subject.

## The analysis script

The script "run_analysis.R" should be run from the main directory of the unzipped data set. It defines a function called "process" which does the following task when called independently on the training and test data sets:

- It reads the data set ("train" or "test") as text and begings extracting the string corresponding to each observation.
- It parses each of these strings to extract the 561 variables defined in "features.txt".
- It creates a data frame "data_df" containing the extracted 561 variables as columns.
- It reads the files "subject_train.txt" or "subject_test.txt" to add a column to "data_df" corresponding to the subject performing the experiment.
- It reads the file "y_train.txt" or "y_test.txt" to add a column to "data_df" corresponding to the activity performed by the subject. It stores these activities as factor variables with the verbs defined in the file "activity_labels.txt"
- It returns "data_df"

The function "process" is applied on the the training and test data sets to create the data frames 
"train_df" and "test_df". The following steps are then executed:

- Merge "train_df" and "test_df" into "merged_data" by row binding.
- Create a new data frame "mean_std_data" from "merged_data" by selecting the columns (features) whose names match the regular expression "mean[^F]|std". This selects only the measurements on which mean() and std() has been applied, discarding names in which meanFreq() appears.
- Finally a data frame "average_data" is created from "mean_std_data" by grouping according to the columns "subject" and "activity" and summarizing all the remaining features by applying the mean function.




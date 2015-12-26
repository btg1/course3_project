# course3_project
The project for course3 - Getting and Cleaning Data

## Working of run_analysis.R
The script checks if the data "UCI HAR Dataset" exists, if not it downloads and unzips the data.

The scripts combines data from the different files in UCI HAR Dataset directory. 

1. It reads the data from the file features.txt into a dataframe. This file has the column names for the data in the file X_test.txt and X_train.txt
2. It reads the data from the file activity_labels.txt into a dataframe. The data is later used to replace activity number with descriptive text.
3. The test and train datasets are processed in the same way - as follows -
	+ the data from test/train data files (X_test.txt or X_train.txt) is read into dataframes (test_X or train_X). The data is checked to make sure that that there are no missing values 
and that the values are in teh expected range (between -1 and 1).
	+ the columns are named using the data read from features.txt file (using data from step1)
	+ the activity is read from the file Y_test.txt or Y_train.txt and added as a column to dataframes test_X or train_X and the column is named activity.
	+ the activity number is converted to descriptive text (using the data from step2) and added as a column to test_X or train_X. 
	+ the subject identifiers are read from the files subject_test.txt or subject_train.txt and added as column to testX or train_X
4. The test and train data is checked to make sure that they are in the right format and can be appended.
5. data test_X and train_X is appended to a dataframe all.
6. A column test_train is added to flag if the samples are from the test set or train set.
7. A subset of teh data is generated with only the columns with the mean and standard deviation for each measurement.
8. The columns are renamed to exclude special charaters like "()" etc.
9. A tidy data is generated with the average of each measurement for each activity and each subject using group_by and summarize commands.
10. The tidy data is written to an output file using the write.table() command.   

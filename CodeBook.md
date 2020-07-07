All the features in the dataset represent the average for each subject for each activity performed of the following values:

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

For each one of them the mean and the standard deviation were considered.

------------------

The data was obtained as follows:
1. All files were inputted (test, train, labels, subjects and features)
2. Appropriate feature labels were given to all datasets
3. The full dataset was created before adding to both train and test the columns with the subjects and the activites, and then joining the train and test sets together
4. A subselection of the features was made taking into account only the features that have "mean" or "std" in it
5. The activity column was changed into a factor and descriptive labels were given instead of numbers from 1 to 6
6. Finally the tidy dataset was created by aggregating for subject and activity and calculating the mean for each variable

Course Project Code Book
========================

Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 



The run_analysis.R R script (.R) performs data cleanup:

1    Merges the training and the test sets to create one data set.
- I merge each of the **train** and **test** files for the 3 elements ( *X*, *y*, *subject* )
- the results are:

> str(X)
'data.frame':	10299 obs. of  79 variables: 

> str(y)
'data.frame':	10299 obs. of  1 variable:

> str(subject)
'data.frame':	10299 obs. of  1 variable:

2    Extracts only the measurements on the mean and standard deviation for each measurement. 

> str(X_extracted)
'data.frame':	10299 obs. of  79 variables:

3    Uses descriptive activity names to name the activities in the data set
- I just split the original FULL_CASE by "_" and add column names
> activity_labels
  activityId           activity \
1          1            WALKING \
2          2   WALKING UPSTAIRS \
3          3 WALKING DOWNSTAIRS \
4          4            SITTING \
5          5           STANDING \
6          6             LAYING


4    Appropriately labels the data set with descriptive variable names. 
- unfortunately the binding between the 3 elements does not work well for me (I think it should be different)
> str(out)
'data.frame':	10299 obs. of  81 variables:

5    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
*NOT DONE* -> error before

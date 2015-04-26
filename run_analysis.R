## Install needed packages
#install.packages("data.table")

## Merge the training and the test sets to create one data set. (1)

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X <- rbind(X_train, X_test)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y <- rbind(y_train, y_test)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subject_train, subject_test)

#X



## Extract only the measurements on the mean and standard deviation for each measurement. (2)

features <- read.table("UCI HAR Dataset/features.txt")[,2]

extracted <- grepl("mean|std", features)

X_extracted <-  X <- X[, extracted]

#X_extracted



## Uses descriptive activity names to name the activities in the data set (3)

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[, 2] <- gsub("_", " ", activity_labels[, 2])   #replace "_"

colnames(activity_labels) <- c("activityId", "activity")      #set matrix header



## Appropriately labels the data set with descriptive variable names. (4)

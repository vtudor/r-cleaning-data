## Install needed packages
#install.packages("data.table")

## Merge the training and the test sets to create one data set. (1)

X_train   <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test    <- read.table("UCI HAR Dataset/test/X_test.txt")
X         <- rbind(X_train, X_test)

y_train   <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test    <- read.table("UCI HAR Dataset/test/y_test.txt")
y         <- rbind(y_train, y_test)

sbj_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
sbj_test  <- read.table("UCI HAR Dataset/test/subject_test.txt")
sbj       <- rbind(sbj_train, sbj_test)

#X

features  <- read.table("UCI HAR Dataset/features.txt")[,2]
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")


## Uses descriptive activity names to name the activities in the data set (3)
## Appropriately labels the data set with descriptive variable names. (4)

colnames(X) = features; 
colnames(y)= "activityId";
colnames(sbj) = "subjectId";
colnames(activity_labels) <- c("activityId", "activity")      #set matrix header


## Extract only the measurements on the mean and standard deviation for each measurement. (2)

extracted <- grepl("mean|std", features)
X_extracted <-  X[, extracted]

#X_extracted

out <- cbind(sbj, y, X_extracted)

#out <- cbind(subject, y, X) #!!!!!!!!!!!!!!!!!!!!!!!!!!
# write.table(bindedClean, file = "out.txt")

out[, 2] <- activity_labels[out[, 2], 2]
out[, 2] <- gsub("_", " ", out[, 2])
#names(out)

##tidy output 
out <- aggregate(out[,3:81], by = out[c("subjectId","activityId")], FUN=mean)

write.table(out, "./tidyOut.txt", row.name=FALSE)
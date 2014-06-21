# Code for course project
# Coursera Data Science Specialization
# Getting and cleaning data

# Unzip the data
# Data is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
unzip('getdata-projectfiles-UCI HAR Dataset.zip')

# Merge the training and the test sets to create one data set.
# First read the data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"")

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"")

# Combine train and test
# X, y and subject will be combined later
X = rbind(X_train, X_test)
y = rbind(y_train, y_test)[[1]]

subject = rbind(subject_train, subject_test)[[1]]

# Extract only the measurements on the mean and standard deviation for each
# measurement. 

# Read the feature names, these will become column names for X
feature_names <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)[,2]

# Find the columns with 'mean' or 'std' in the name

# Some of the feature names are duplicates but they are not mean or std so we
# don't have to worry about them. Some columns are angle between mean and other
# features. We don't want those, just the true mean and std columns. The desired
# means are all labeled with lowercase while the angles use uppercase so a
# case-sensitive search finds what we want.
meanStdCols = grepl('mean|std', feature_names)

# Subset the columns of X
X = X[,meanStdCols]

# Appropriately label the data set with descriptive variable names. 
names(X) = feature_names[meanStdCols]

# Use descriptive activity names to name the activities in the data set

# Read the activity names and make a factor with activities
activity_names = read.table('UCI HAR Dataset/activity_labels.txt', row.names=1)
activity = activity_names[y,1]

# Now we can put it all together
data = cbind(subject, activity, X)

# Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(plyr)
tidy = ddply(data, .(subject, activity), function(df) colMeans(df[,-(1:2)]))

write.table(tidy, file='AverageMeanStd.txt', row.names=FALSE)

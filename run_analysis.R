
#Test data
#Load raw data of accelemeter, subject id's, action id's and relevant labels
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
features <- read.table("UCI HAR Dataset/features.txt")
action_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

#descriptive activity names to name the activities in the data set
y_test$V1 <- factor(y_test$V1,levels=action_labels$V1,labels=action_labels$V2)

#Combine subject,action, and accelemeter data for test data
testD <- cbind(subject_test,y_test,X_test)
#labels the data set with descriptive variable names
colnames(testD) <- c("subject","action",as.character(features$V2))

##Training data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

#descriptive activity names to name the activities in the data set
y_train$V1 <- factor(y_train$V1,levels=action_labels$V1,labels=action_labels$V2)

#Combine subject,action, and accelemeter data for test data
trainD <- cbind(subject_train,y_train,X_train)
#labels the data set with descriptive variable names
colnames(trainD) <- c("subject","action",as.character(features$V2))

#Merges the training and the test data to create one data set
neatData <- rbind(trainD,testD)

# Extracts only the measurements on the mean and standard deviation for each measurement.
mean <- sapply(neatData[,-c(1,2)],colMeans)
standard_deviation <- apply(neatData[,-c(1,2)],2,sd)
measurement_summary <- rbind(mean,standard_deviation)
measurement_summary

#average of each variable for each activity and each subject.
#This creates the second tidy data set
library(plyr)
library(foreach)
neatData2 <- ddply(neatData,c("subject","action"),function(df) colMeans(df[,-c(1,2)]))

write.table(x = neatData2,file = "CourseProjectOutput.txt",row.name=FALSE)

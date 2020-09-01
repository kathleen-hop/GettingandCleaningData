#load libraries
library(reshape2)

#read in test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
s_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

#read in train data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
s_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

#read in labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

#combine x data
x_data <- rbind(X_test, X_train)

#combine y data
y_data <- rbind(Y_test, Y_train)

#combine s data
s_data <- rbind(s_test, s_train)

#label data
names(s_data) <- c("Subject")
names(y_data) <- c("Activity")
names(x_data) <- features$V2

#select mean + std columns from x data
selected <- grep("mean\\(\\)|std\\(\\)", features[,2])
selectedData <- x_data[selected]

#rename variables with descriptive names
names(selectedData) <- gsub("-mean", "Mean", names(selectedData))
names(selectedData) <- gsub("-std", "Std", names(selectedData))
names(selectedData) <- gsub("[-()]", "", names(selectedData))
names(selectedData) <- gsub("^t", "Time", names(selectedData))
names(selectedData) <- gsub("^f", "Frequency", names(selectedData))
names(selectedData) <- gsub("Mag", "Magnitude", names(selectedData))


#create one data table
data <- cbind(s_data, y_data)
data <- cbind(data, selectedData)

#label activities
data$Activity <- factor(data$Activity, labels = activity_labels[,2])

#generate a tidy data set
dataMelt <- melt(data, id=c("Subject", "Activity"))
tidyData <- dcast(dataMelt, Subject + Activity ~ variable, mean)

write.table(tidyData, "tidy_data.txt", row.names = FALSE, quote = FALSE)


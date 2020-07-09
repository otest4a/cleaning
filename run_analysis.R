downloadurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(downloadurl,'c:/homework/cleaningdata/UCI HAR Dataset.zip', mode = 'wb')
setwd("c:/homework/cleaningdata/")
unzip("c:/homework/cleaningdata/UCI HAR Dataset.zip")



features <- read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
features <- as.character(features[,2])

x_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
y_train <- read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ')
subject_train <- read.csv('./UCI HAR Dataset/train/subject_train.txt',header = FALSE, sep = ' ')

train <-  data.frame(data.train.subject, data.train.activity, data.train.x)
names(train) <- c(c('subject', 'activity'), features)

x_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
y_test  <- read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
subject_test <- read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')

test <-  data.frame(data.test.subject, data.test.activity, data.test.x)
names(test) <- c(c('subject', 'activity'), features)

#1
data2 <- rbind(train, test)

#2
idx <- grep('mean|std', features)
data3<- data2[,c(1,2,idx + 2)]



#3
activity2 <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
activity2 <- as.character(activity2[,2])
data3$activity <- activity2[data3$activity]


#4
data5 <- names(data3)
data5 <- gsub("[(][)]", "", data5)
data5 <- gsub("^t", "TimeDomain_", data5)
data5 <- gsub("^f", "FrequencyDomain_", data5)
data5 <- gsub("Acc", "Accelerometer", data5)
data5 <- gsub("Gyro", "Gyroscope", data5)
data5 <- gsub("Mag", "Magnitude", data5)
data5 <- gsub("-mean-", "_Mean_", data5)
data5 <- gsub("-std-", "_StandardDeviation_", data5)
data5 <- gsub("-", "_", data5)
names(data3) <- data5

#5
data6<-aggregate(. ~subject + activity, data3, mean)
data6<-data6[order(data6$subject,data6$activity),]
write.table(data6, file = "tidydata.txt",row.name=FALSE)

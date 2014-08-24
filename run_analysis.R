##############
## Getting and Cleaning DAta course project
###################

###############
## Procedures:
## 1. Merge the training and the test sets 
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variables names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
###############

## set the working directory
## setwd("~/Dropbox/Courses/Sampled lecture notes/Data Science Track/3. Getting and Cleaning Data/data/UCI HAR Dataset")
install.packages("reshape2")
library(reshape2)

## Import the data
xTrain<-read.table("train/X_train.txt")
xTest<-read.table("test/X_test.txt")
subTrain<-read.table("train/subject_train.txt")
subTest<-read.table("test/subject_test.txt")
yTrain<-read.table("train/y_train.txt")
yTest<-read.table("test/y_test.txt")
features<-read.table("features.txt")
activity<-read.table("activity_labels.txt")

# Rename column names 
colnames(features)<-c("feature_ID","varname")
colnames(activity)<-c("activity_ID","activity_Type")
colnames(subTrain)<-"subjectID"
colnames(subTest)<-"subjectID"
colnames(xTrain)<-features[,2]
colnames(yTrain)<-"activity_ID"
colnames(xTest)<-features[,2]
colnames(yTest)<-"activity_ID"

# Extract only mean and standard deviation
var<-grepl("mean\\(\\)|std\\(\\)", colnames(xTest))
xTest<-xTest[,var]
xTrain<-xTrain[,var]

# rename activity
yTrain[,1]<-factor(yTrain[,1], levels=1:6, labels=activity[,2])
yTest[,1]<-factor(yTest[,1], levels=1:6, labels=activity[,2])

# Merging data
trainingData<-cbind(yTrain,subTrain, xTrain )
testData<-cbind(yTest, subTest, xTest)
Data<-rbind(trainingData, testData)

# rename variables


# Independent data
DataMelt<-melt(Data,id=c("subjectID","activity_ID"), measure.vars=colnames(Data[,-c(1,2)]))
finalData<-dcast(DataMelt,subjectID+activity_ID~variable,mean)
write.table(finalData,"Tidy Data.txt", row.names=FALSE)
# run_analysis.R
#
# This R script performs the following:
# 1. Download the project's datasets ZIP file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 2. Unzip the downloaded file and extract the datasets
# 3. Merge the training and test sets to create one data set
# 4. Extract only the measurements on the mean and standard deviation for each measurement
# 5. Use descriptive activity names to name the activities in the data set
# 6. Appropriately label the data set with descriptive variable names.
# 7. Creates a second independent tidy data set with the average of each variable for each activity and each subject.
#
#
# Download the datasets, save to ./data folder
if(!dir.exists("./data")){ # Check if data folder exists
  dir.create("./data")
}
zipFilename <- "./data/dataset.zip"
if (!file.exists(zipFilename)){ # check if the dataset is already existing (file has already been downloaded)
  datasetFileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(datasetFileURL, zipFilename)
}

# Unzip the downloaded file to ./data folder
if (!file.exists("./data/UCI HAR Dataset")){  # Check if the dataset container folder UCI HAR Dataset exists
  unzip(zipFilename, exdir="./data")
}  

# Read the activity labels and features files in table format and create dataframes from the files
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("./data/UCI HAR Dataset/features.txt", header = FALSE)

# Read the test data files in table format and create dataframes from the files
subjectTest  <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",header = FALSE)
xTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header=FALSE)
yTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header=FALSE)

# Read the training data files in table format and create dataframes from the files
subjectTraining  <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
xTraining <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header=FALSE)
yTraining <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header=FALSE)

# Assign column names to the dataframes (test and training)
colnames(activityLabels) = c('activity','activityType');
colnames(subjectTest) = "subject";
colnames(xTest)       = features[,2]; 
colnames(yTest)       = "activity";
colnames(subjectTraining) = "subject";
colnames(xTraining) = features[,2]; 
colnames(yTraining) = "activity";

# Merge Test data sets
testDataSet <- cbind(yTest,subjectTest,xTest);

# Merge Training data sets
trainingDataSet <- cbind(yTraining,subjectTraining,xTraining)

# Merge Training and Test Data Sets
mergedDataSet <- rbind(trainingDataSet,testDataSet)

# Extract only the measurements on the mean and standard deviation
colMeanStd<-features$V2[grep(".*mean.*|.*std.*", features$V2)]
selectedNames<-c("subject", "activity", as.character(colMeanStd))
subSetData<-subset(mergedDataSet,select=selectedNames)

# Use descriptive activity names to name the activities in the data set
subSetData$activity<-factor(subSetData$activity,labels=activityLabels[,2])

# Appropriately label the data set with descriptive variable names.
names(subSetData)<-gsub("^t", "time", names(subSetData))
names(subSetData)<-gsub("^f", "frequency", names(subSetData))
names(subSetData)<-gsub("Acc", "Accelerometer", names(subSetData))
names(subSetData)<-gsub("Gyro", "Gyroscope", names(subSetData))
names(subSetData)<-gsub("Mag", "Magnitude", names(subSetData))
names(subSetData)<-gsub("BodyBody", "Body", names(subSetData))
names(subSetData)<-gsub("-mean()", "Mean", names(subSetData), ignore.case = TRUE)
names(subSetData)<-gsub("-std()", "STD", names(subSetData), ignore.case = TRUE)
names(subSetData)<-gsub("-freq()", "Frequency", names(subSetData), ignore.case = TRUE)
names(subSetData)<-gsub("angle", "Angle", names(subSetData))
names(subSetData)<-gsub("gravity", "Gravity", names(subSetData))

# Create independent tidy data set with the average of each variable for each activity and each subject.
tidyData <- aggregate(. ~subject+activity,subSetData,mean)
tidyData <- tidydata[order(tidydata$subject,tidydata$activity),]

# Write the tidyData into a text file
write.table(tidyData,"tidy_data.txt",row.name = FALSE)


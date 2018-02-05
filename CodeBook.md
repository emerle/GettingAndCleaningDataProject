---
title: "CodeBook - run_analysis.R"
output: html_document
---

This codebook describes the variables, the data, and any transformations or work that were used in *run_analysis.R* and were performed to clean up the data for the **Getting and Cleaning Data Course Project**.

<br/>

## Source of Data

**Original Data Sets (ZIP File)**: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

**Data Set Description]**: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

<br/>

## Input Data Sets

- `activity_labels.txt`: contains the class labels with their activity names.
- `features.txt`: contains the name of the features in the data sets.
- `subject_test.txt`: each row identifies the subject who performed the activity for each window sample
- `X_test.txt`: contains variable features for testing.
- `y_test.txt`: contains test labels
- `subject_train.txt`: each row identifies the subject who performed the activity for each window sample
- `X_train.txt`: contains variable features intended for training.
- `y_train.txt`: contains training labels

<br/>

## Transformations
- The input data sets were read
    <ul>
      - `activityLabels`: data frame container of activity_labels.txt
      - `features`: data frame container of features.txt
      - `subjectTest`: data frame container of subject_test.txt
      - `xTest`: data frame container of X_test.txt
      - `yTest`: data frame container of y_test.txt
      - `subjectTraining`: data frame container of subject_train.txt
      - `xTraining`: data frame container of X_train.txt
      - `yTraining`: data frame container of y_train.txt
  </li>
</ul>
- Test Data Sets were merged and named the resulting data frame to `testDataSet`
- Training Data Sets were merged and named the resulting data frame to `trainingDataSet`
- Test and Training Data Sets were merged and named the resulting data frame to `mergedDataSet`
- Data reflecting only the measurements on the mean and standard deviation were extracted. Resulting data frame is named as `subSetData`
- Descriptive activity names from activityLabels data frame were used to name the activities in the subSetData data set
- Proper labeling on the variable names was done. Acronyms in variable names in subSetData, like 't', 'f', 'Acc', 'Gyro', 'Mag' and 'BodyBody', are replaced with descriptive labels such as 'time', 'frequency', 'Accelerometer', 'Gyroscope', 'Magnitude', and 'Body'.
- `tidyData` was created as a data frame that contains tidy data set with the average of each variable for each activity and each subject.
- Contents of the tidyData were written into the file named **tidy_data.txt**.


<br/>

## Output Data Set
**tidy_data.txt**: file that contains tidy data set with the average of each variable for each activity and each subject
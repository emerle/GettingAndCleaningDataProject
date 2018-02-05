---
title: "README - Getting and Cleaning Data Course Project"
output: html_document
---
## General Information

This project aims to demonstrate the student's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

<br/>


## Files
**run_analysis.R**: script that does the following:
1. Downloads the data sets (ZIP file) and saves the downloaded file to ./data folder.
2. Unzips the downloaded ZIP file.
3. Reads all the data sets (test and training)
4. Merges the test and training data sets.
5. Extracts the measurements on the mean and standard deviation.
6. Creates descriptive activity names for the name the activities in the data set
7. Appropriately labels the data set with descriptive variable names
8. Creates independent tidy data set with the average of each variable for each activity and each subject.
9. Write the tidyData data frame into a text file named tidy_data.txt.

**tidy_data.txt**: file that contains tidy data set with the average of each variable for each activity and each subject

**CodeBook.md**: describes the variables, the data, and any transformations or work that you performed to clean up the data

<br/>

## Additional Information
Please see **CodeBook.MD** file.
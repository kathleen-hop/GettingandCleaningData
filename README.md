---
#title: "ReadMe"
#author: "Kathleen"
#date: "8/31/2020"
#output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)
```

## Getting and Cleaning Data Course Project README

### Project Data

The data for this project is taken from the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The dataset contains information collected from 30 participants while performing 6 different activities.

It is assumed the the data is downloaded and unzipped in the user's working directory before running the ```run_analysis.R``` script. 

### How the Script Works

The ```run.analysis.R``` script completes the following steps.

1. Read in relevant data from the **UCI HAR Dataset**.  This is the test data (**X_test.txt**, **y_test.txt**, **subject_test.txt**), the training data (**X_train.txt**, **y_train.txt**, **subject_train.txt**), and the data labels (**activity_labels.txt**, **features.txt**).

2. Combine the **test** and **train** data for **X**, **Y**, and **Subject**.  This creates one dataset for each data type at this stage.

3. Label columns of each data table.  **Subject** data column is named as *Subject*, **Y** data column is named as *Activity*, and **X** data columns are named with the entries in the *features* vector.

4. Extract desired measurement columns.  Desired columns are the mean or standard deviation measurements for each individual measurement type.  Columns are selected if they contain ```mean()``` or ```std()```.  Use ```grep("mean\\(\\)|std\\(\\)")``` to find desired columns.  Subset **X data** with the desired columns.

5. Rename variables with descriptive variables names.  Several substitutions, such as *Time* for the prefix *t* are made, to clarify variable names.

6. Combine the data to create one data table.  All **X data**, **Subject data**, and **Activity data** are now in one data table.

7. Replace activity ID numbers with descriptive activity names using the six possible labels (*WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING*).

8. Produce a tidy dataset.  ```melt``` the data based on *Subject* and *Activity*.  Use ```dcast``` to create a tidy data table with the mean value of each variable for each subject and each activity.

9. The resulting tidy dataset is shown in the file ```tidy_data.txt```.



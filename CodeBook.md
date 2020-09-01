
## Getting and Cleaning Data Course Project Code Book

All data for this project is taken from the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The dataset contains information collected from 30 participants while performing 6 different activities.

### Tidy Data Variables

The tidy dataset contains the following variables:

1. Subject - ID of subject

2. Activity - ID of activity type

3. Mean and Standard Deviation of the following variables (measurement axes specified):

* TimeBodyAcc - XYZ

* TimeGravityAcc - XYZ

* TimeBodyAccJerk - XYZ

* TimeBodyGyro - XYZ

* TimeBodyGyroJerk - XYZ

* TimeBodyAccMagnitude

* TimeGravityAccMagnitude

* TimeBodyAccJerkMagnitude

* TimeBodyGyroMagnitude

* TimeBodyGyroJerkMagnitude

* FrequencyBodyAcc - XYZ

* FrequencyBodyAccJerk - XY


The original dataset contains additional data, but only the above variables were used in this project.




### Tidy Data Transformations

The following transformations were performed on the original data to produce the tidy dataset.

1. Combine **test** and **train** data

2. Combine **subject**, **activity**, and **variable** data to create one dataset

3. Substitute activity IDs with descriptive labels

* Activity labels: *WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING*

4. Rename variables with descriptive labels

* Substitute "Time" for "t"

* Substitute "Frequency" for "f"

* Substitute "Magnitude" for "Mag"

* Substitute "Mean" for "-mean()"

* Substitute "Std" for "-std()"

5. Tidy data constructed from mean value of each feature for each subject and each activity type





